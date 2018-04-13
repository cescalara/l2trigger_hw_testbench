# l2trigger_hw_testbench
Hardware testbench project for the Mini-EUSO L2 trigger (HLS implementation).

Custom testbench for passing known datasets to the [L2 trigger IP](https://github.com/cescalara/zynq_ip_hls) and simulating the data flow in order to 
test the trigger performance and compare with earlier software implementation. 

The testbench is setup via a lightweight SW (lwip) in the Zynq PS with an ethernet connection capability. This is used to 
pass the data into the Zynq FPGA via DMA access. 

the block diagram is shown here:


![The L2 trigger testbench](https://github.com/cescalara/l2trigger_hw_testbench/blob/master/images/block_diagram.png)

The software is used to set up the L2 trigger IP and initialise it, then to send data and check outputs. The trigger behaviour 
is also checked using the built-in ChipScope Integrated Logic Analyzer (ILA).


