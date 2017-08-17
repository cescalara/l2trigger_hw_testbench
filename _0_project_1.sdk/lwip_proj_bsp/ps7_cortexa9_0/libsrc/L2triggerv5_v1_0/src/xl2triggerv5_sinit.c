// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xl2triggerv5.h"

extern XL2triggerv5_Config XL2triggerv5_ConfigTable[];

XL2triggerv5_Config *XL2triggerv5_LookupConfig(u16 DeviceId) {
	XL2triggerv5_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XL2TRIGGERV5_NUM_INSTANCES; Index++) {
		if (XL2triggerv5_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XL2triggerv5_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XL2triggerv5_Initialize(XL2triggerv5 *InstancePtr, u16 DeviceId) {
	XL2triggerv5_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XL2triggerv5_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XL2triggerv5_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

