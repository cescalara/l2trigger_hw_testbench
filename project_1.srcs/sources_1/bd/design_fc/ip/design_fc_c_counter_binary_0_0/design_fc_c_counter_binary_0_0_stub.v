// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Thu Apr 20 16:17:25 2017
// Host        : alx-HP-ENVY-Notebook running 64-bit Ubuntu 16.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_c_counter_binary_0_0/design_fc_c_counter_binary_0_0_stub.v
// Design      : design_fc_c_counter_binary_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030ffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *)
module design_fc_c_counter_binary_0_0(CLK, CE, Q)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,Q[15:0]" */;
  input CLK;
  input CE;
  output [15:0]Q;
endmodule
