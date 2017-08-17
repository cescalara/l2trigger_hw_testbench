/*
 * Copyright (c) 2007 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#ifdef __arm__
#include "xil_printf.h"
#endif

#include "xl2_trigger.h"
#include "xparameters.h"

#include "xaxidma.h"

static unsigned rxperf_port = 5001;	/* iperf default port */
static unsigned rxperf_server_running = 0;

#define N_PIXELS	2304
#define N_ADDS		128*2
//#define K_SPARE		2

#define N_GTU		(N_ADDS/2)



#define ARRAY_SIZE	500000000
//char big_array[ARRAY_SIZE];

// Define the input and output array for DMA
u64 out_array[(N_PIXELS/2)] __attribute__ ((aligned (64)));
//u32 input_array[N_ADDS][(N_PIXELS/2)] __attribute__ ((aligned (64)));
u32 input_array[N_ADDS * (N_PIXELS/2)] __attribute__ ((aligned (64)));

u32 pointer = 0;

XL2_trigger l2trigger;
//XAxiDma axiDma_tx, axiDma_rx;
XAxiDma axiDma;

/* FUNCTIONS */

/* Initialise the input array */
void FillData()
{
	int i;

	for(i = 0; i < N_ADDS * (N_PIXELS/2); i++)
		//for(j = 0; j < (N_PIXELS/2); j++)
			input_array[i] = 0;
}

/* Configure the AXI DMA engine */
void DMA_config()
{
	XAxiDma_Config * CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_1_DEVICE_ID);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", XPAR_AXI_DMA_1_DEVICE_ID);
		return;
	}

	u32 ret = XAxiDma_CfgInitialize(&axiDma, CfgPtr);
	xil_printf("XAxiDma_CfgInitialize tx returns = %d\n\r", ret);


//	XAxiDma_Config* CfgPtr_rx = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
//	if (!CfgPtr_rx) {
//		xil_printf("No config found for %d\r\n", XPAR_AXI_DMA_0_DEVICE_ID);
//		return;
//	}
//	ret = XAxiDma_CfgInitialize(&axiDma_rx, CfgPtr_rx);
//	xil_printf("XAxiDma_CfgInitialize rx returns = %d\n\r", ret);

	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(&axiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_IntrDisable(&axiDma, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DEVICE_TO_DMA);
}

/* Start the DMA engine */
void DMA_start()
{
	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled */
	Xil_DCacheFlushRange((UINTPTR)input_array, N_ADDS*(N_PIXELS/2)*sizeof(u32));


	u32 ret = XAxiDma_SimpleTransfer(&axiDma, (UINTPTR)out_array, (N_PIXELS/2)*sizeof(u64), XAXIDMA_DEVICE_TO_DMA);
	xil_printf("XAxiDma_SimpleTransfer rx ret = %d\n\r", ret);

	ret = XAxiDma_SimpleTransfer(&axiDma, (UINTPTR)input_array, N_ADDS*(N_PIXELS/2)*sizeof(u32), XAXIDMA_DMA_TO_DEVICE);
	xil_printf("XAxiDma_SimpleTransfer tx ret = %d\n\r", ret);
}

/* Get info on the DMA status */
void DMA_info()
{
	xil_printf("XAxiDma_Busy XAXIDMA_DMA_TO_DEVICE=%d\n\r", XAxiDma_Busy(&axiDma, XAXIDMA_DMA_TO_DEVICE));
	xil_printf("XAxiDma_Busy XAXIDMA_DEVICE_TO_DMA=%d\n\r", XAxiDma_Busy(&axiDma, XAXIDMA_DEVICE_TO_DMA));
}

/* Print the L2 output */
void Print_L2_out()
{
	int i;
	Xil_DCacheInvalidateRange((UINTPTR)out_array, (N_PIXELS/2)*sizeof(u64));
	for(i = 0; i < (N_PIXELS/2); i++)
	{
		/* Separate the concatenated pixel output into 2 32-bit ints */
		/* Check output */
		u64 v = out_array[i];
		xil_printf("%u %u ", (u32)(v & 0xFFFFFFFFLL), (u32)((v & 0xFFFFFFFF00000000LL) >> 32));

	}
}

/* Configure the L2 trigger IP */
void L2_config()
{
	XL2_trigger_Initialize(&l2trigger, XPAR_L2_TRIGGER_0_DEVICE_ID);
	XL2_trigger_Set_n_pixels_in_bus(&l2trigger, N_PIXELS);
	XL2_trigger_EnableAutoRestart(&l2trigger);
	XL2_trigger_Start(&l2trigger);
}

int transfer_rxperf_data() {
    return 0;
}

/* Receive data on port 5001 */
static err_t
rxperf_recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
    /* close socket if the peer has sent the FIN packet  */
    if (p == NULL) {
        tcp_close(tpcb);
        return ERR_OK;
    }
    print("*");
    //xil_printf("%s, %d\n\r", p->payload, p->len);
    /* all we do is say we've received the packet */
    /* we don't actually make use of it */

    /* copy max 1024 bytes at a time */
    memcpy(&input_array[0] + pointer, p->payload, p->len);

    /* For some reason it leaves gaps so divide by 4 */
    pointer += (p->len)/4;
    //xil_printf("Base: %u | pointer: %u \n\r", &input_array[0], pointer/1024);

    tcp_recved(tpcb, p->tot_len);

    pbuf_free(p);
    return ERR_OK;
}


void
print_input() {
	/* print the input array after sending data */
	int i, k = 0, null = 0;
	for (i = 0; i < 2 * (N_PIXELS/2); i++) {

		xil_printf("%u :   %u | %u \n\r", input_array[i], input_array[i] & 0x0000ffff, input_array[i] >> 16);

	}
	xil_printf("\n\r Done! k: %u | null: %u \n\r", k, null);
	//xil_printf("%zu ", sizeof(input_array[0]));
}

void
test_ones(){
	/* Fill input array with concatenated ones */
	xil_printf("Filling input array with 1s\n\r");
	int i, j;
	u32 * in;
	u32 a = 65537;
	in = &a;
	for (i = 0; i < 10; i++){
		for (j = 0; j < 100; j++){
			memcpy(&input_array[0] + pointer, in, sizeof(u32));
			pointer += sizeof(u32);
			xil_printf("*");
		}
	}
	free(in);
}

/* get the offset pointer of the read in data */
u32 GetOffsetPointer()
{
	/* multiply by 4 due to problems with gaps FIX THIS */
	return pointer*4;
}

/* Accept the connection on port 5001 */
err_t rxperf_accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
    xil_printf("rxperf: Connection Accepted\r\n");
    tcp_recv(newpcb, rxperf_recv_callback);

    return ERR_OK;
}

/* Start the listening on port 5001 */
int start_rxperf_application()
{
    struct tcp_pcb *pcb;
    err_t err;

    /* create new TCP PCB structure */
    pcb = tcp_new();
    if (!pcb) {
    	xil_printf("rxperf: Error creating PCB. Out of Memory\r\n");
    	return -1;
    }

    /* bind to iperf @port */
    err = tcp_bind(pcb, IP_ADDR_ANY, rxperf_port);
    if (err != ERR_OK) {
    	xil_printf("rxperf: Unable to bind to port %d: err = %d\r\n", rxperf_port, err);
    	return -2;
    }

    /* we do not need any arguments to callback functions :) */
    tcp_arg(pcb, NULL);

    /* listen for connections */
    pcb = tcp_listen(pcb);
    if (!pcb) {
    	xil_printf("rxperf: Out of memory while tcp_listen\r\n");
    	return -3;
    }

    /* specify callback to use for incoming connections */
    tcp_accept(pcb, rxperf_accept_callback);

    rxperf_server_running = 1;

    return 0;
}

//void
//print_rxperf_app_header()
//{
//    xil_printf("%20s %6d %s\r\n", "rxperf server",
//                        rxperf_port,
//                        "$ iperf -c <board ip> -i 5 -t 100");
//}
