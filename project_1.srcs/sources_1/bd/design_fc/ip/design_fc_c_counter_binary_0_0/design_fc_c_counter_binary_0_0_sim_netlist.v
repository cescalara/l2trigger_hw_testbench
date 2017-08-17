// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Thu Apr 20 16:17:25 2017
// Host        : alx-HP-ENVY-Notebook running 64-bit Ubuntu 16.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_c_counter_binary_0_0/design_fc_c_counter_binary_0_0_sim_netlist.v
// Design      : design_fc_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z030ffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_fc_c_counter_binary_0_0,c_counter_binary_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module design_fc_c_counter_binary_0_0
   (CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [15:0]Q;

  wire CE;
  wire CLK;
  wire [15:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  design_fc_c_counter_binary_0_0_c_counter_binary_v12_0_9 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "16" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_9" *) (* downgradeipidentifiedwarnings = "yes" *) 
module design_fc_c_counter_binary_0_0_c_counter_binary_v12_0_9
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [15:0]L;
  output THRESH0;
  output [15:0]Q;

  wire CE;
  wire CLK;
  wire [15:0]L;
  wire LOAD;
  wire [15:0]Q;
  wire SCLR;
  wire SINIT;
  wire SSET;
  wire THRESH0;
  wire UP;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  design_fc_c_counter_binary_0_0_c_counter_binary_v12_0_9_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L(L),
        .LOAD(LOAD),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET),
        .THRESH0(THRESH0),
        .UP(UP));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A13f8tlz6UJG9JfCNcYl8NLUw8Tlctm35dCRvt/KCTpBFIuXlOawHL7sTHowWNnYPdFQNufThU2P
nq6r7CYRfg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJAsCu5zl/OMFEQsA8TK81YQdELnJEDcFa6KQ0EHWxmJrxei82pUrFKy5/0YZah/J8433WTkuMYX
n4DxKRAShIrdY1X7G4VuvTy06p94vL5LjcHyEy4fxae5eyT8gPJ2ix4XQa8NTiv0ndfGQZyw3Nh2
G2fKlAI5x3f8zwZZQY8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
wvBGFVtHjRF0sOMF1pCWFAGskoPwO7T2ijyj/eL3cj3Mn4RaSun2E2ii2aHguV5ZVFP65oRsiH5d
RuZPDUKAsxBDhHSsGkFSPIwX9KivlJTo2FZHlBDTlkfDQbn+a3fWxc1HcR9KUBo8QndFpzMmqgOV
oDGrjFRMryCx3hlDJdU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UMkVtIsRH0SCXq8LQlXc2SFapNVFtJ6lm3Wp55oPh2JHEa2eDcLuSNAMzka2zwzCEXltR/XJthW1
e74yTmf22SChtep5vBZ+ajUd7h2t8MuWnhQAMciHkyF4IkU7ju3JOoQFlih3FqDO3aUJPcamhd7Q
ccMUMAhIvZFp44NdLzl8HbXnE1qh9bi1m8qU8jMCKESUZ7pg4lNlsQjd+Goa1H9iXaLEv3OfHZuq
AS/RQip05I1DUFL5hACAmmneYHUVM5S4EEaO3aHf1jZ3r/piru3ZRDHXxDir2Y9zXiL2oDUfsV5l
w+Pp691O/rBEAjBLQdevDcp/mZn7axrfo7gedQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BizuB2M20zTA5t6lHKGfnJrucOUdZ0HEVkxiYzkxLH0WP9VZIREBo09OejVavblw0lBdoToGD/Dx
ZN2JWgxB3v9b0Oe7EvwN3oB8w0TKm0RoqDmuPV8JuY7RwxtxkHcrVvcjXuOt8j2BPe5Ix86NYRxZ
8RqRFVGNyOVCKZuaFMVHI+ktnNU/xi6ZGsd+L0PEmNWeJ+y+7ubRYuJBTcZK6n0e0Rv144/nsqdy
X+40+rhcynqZUh14Jaqxwmyc8eu2wmo21it2TUiXXzLiWf9C/rPTasxTNu6GgF2yKIv/qtG5zsH5
iEI5vhFnzG+RShh+IHFb+FdSgnifLxcvxMZyfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WBEZpdyDr9NfPjFUCp37UUdIujNIa897wZZ58/x9eMPhksqlKdy3SYhoDdl4U5n1JXPWIonhbpyY
qfWTq0gV9NaH1PiTuV9w+nrQziNvPhnHnWOzNrltlMQ+uTbMRquXZffmAQGphp7ekw56wGNMIqvn
BRmPzqHv8wZfX/RCaFbjfXAJEmAF89kl5TL3IWnE72Kb9o1cSvFtKTxyRoh9m9E0ghJdkhnRh4Pm
wU/+pIGwon3nUS1E00edVC7apMYbKm+8akp/2UT8ovmuCYJtcE90yRZZaeiFNpLq2UTmaGHp3XHC
2ziTOAA9fjUjv2jhCi5RMA2D0eDmOlHleltm9Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
OzGujReK1pWGbwG/LDrhz2kzbLFcyxHICh92pHuEGGfDCSMpysmexOgPlvE+9yVLJXS7ThlgCs+k
Qekqibzxx4akBvqbdivn8HkALvI5OC4swd7JylN/2ZFRYMNZPBddpN9O9zvSjUlK8ydhN7T5ibOf
41Oq+ubpA1bm3VWxXzuVKsTGlK5jbHiNiDCFHGfQNhzlxbKpE6yCuHETcsDD/Q6JDB+JoIKdiDNC
1Fg9LOirLhATakLgqgXfqgFbeSNy9kNHtoVZevVGdgxiyIh9waWQU5S1eEG6V48MdfgaiVpc8bTn
zw+v4U2azg+VEI8C/VhIWo31SqzL3pCu1gZ48Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
qFFsbnmNgeuN+hmOsgXCsn73fj23QUmnkZ8wtcGZWPIRj/TS9Nnsu74FmvQqBelGO4czkT25qwmg
mJR3dCFB4I184C0Gw2ff4ERtfrdfHQpOrDEy4voEi8x3zhz31CtC2RdzPKWYShxfdvjH6XSXgriU
aKptE34TnL15N1Ro+/zOjWkWix7nIp6Ta2c3Yjo+U0fizaBfUBIUQsnpHwR5iB5TpL4wfRL6D7Gr
wmwtovX+wJYYvOi4amGTbphwf6IvdPNzyQecifY7VO8xAAy/Oht3aE/AdJi/za0j690KmKV8jA7p
XpcpXXLkJbTbw8s0PXpXfd8ANI1Fzs4MevxhiQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11632)
`pragma protect data_block
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
INFi+Q==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
