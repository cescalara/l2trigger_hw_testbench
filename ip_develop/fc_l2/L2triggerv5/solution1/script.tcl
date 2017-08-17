############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project L2triggerv5
set_top L2triggerv5
add_files L2triggerv5/cpp_code/L2triggerv5.cpp
add_files L2triggerv5/cpp_code/L2triggerv5.h
add_files -tb L2triggerv5/cpp_code/L2trigger_testv5.cpp
open_solution "solution1"
set_part {xc7z030ffg676-2}
create_clock -period 5 -name default
#source "./L2triggerv5/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level port -rtl vhdl
export_design -format ip_catalog
