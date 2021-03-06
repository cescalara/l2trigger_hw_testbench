proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -ruleid {1}  -id {Labtoolstcl 44-513}  -string {{ERROR: [Labtoolstcl 44-513] HW Target shutdown. Closing target: localhost:3121/xilinx_tcf/Xilinx/000013ccf85701}}  -suppress 

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/francesca/xil_proj/trig_testbench_F/project_1.cache/wt [current_project]
  set_property parent.project_path /home/francesca/xil_proj/trig_testbench_F/project_1.xpr [current_project]
  set_property ip_repo_paths {
  /home/francesca/xil_proj/trig_testbench_F/project_1.cache/ip
  /home/francesca/xil_proj/trig_testbench_F/ip_develop/fc_l2/L2triggerv5/solution1/impl
  /home/francesca/xil_proj/l2_trigger/solution1/impl
} [current_project]
  set_property ip_output_repo /home/francesca/xil_proj/trig_testbench_F/project_1.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.runs/synth_1/design_fc_wrapper.dcp
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_processing_system7_0_0/design_fc_processing_system7_0_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_processing_system7_0_0/design_fc_processing_system7_0_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_xbar_0/design_fc_xbar_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_xbar_0/design_fc_xbar_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_xbar_1/design_fc_xbar_1.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_xbar_1/design_fc_xbar_1.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_rst_processing_system7_0_100M_0/design_fc_rst_processing_system7_0_100M_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_rst_processing_system7_0_100M_0/design_fc_rst_processing_system7_0_100M_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_dma_0_1/design_fc_axi_dma_0_1.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_dma_0_1/design_fc_axi_dma_0_1.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_c_counter_binary_0_0/design_fc_c_counter_binary_0_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_c_counter_binary_0_0/design_fc_c_counter_binary_0_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_xlslice_0_0/design_fc_xlslice_0_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_xlslice_0_0/design_fc_xlslice_0_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_gpio_0_0/design_fc_axi_gpio_0_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_gpio_0_0/design_fc_axi_gpio_0_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_l2_trigger_0_0/design_fc_l2_trigger_0_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_l2_trigger_0_0/design_fc_l2_trigger_0_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_0/design_fc_auto_pc_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_0/design_fc_auto_pc_0.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1.dcp]
  add_files -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_us_0/design_fc_auto_us_0.dcp
  set_property netlist_only true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_us_0/design_fc_auto_us_0.dcp]
  read_xdc -ref design_fc_processing_system7_0_0 -cells inst /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_processing_system7_0_0/design_fc_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_processing_system7_0_0/design_fc_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref design_fc_rst_processing_system7_0_100M_0 -cells U0 /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_rst_processing_system7_0_100M_0/design_fc_rst_processing_system7_0_100M_0_board.xdc
  set_property processing_order EARLY [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_rst_processing_system7_0_100M_0/design_fc_rst_processing_system7_0_100M_0_board.xdc]
  read_xdc -ref design_fc_rst_processing_system7_0_100M_0 -cells U0 /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_rst_processing_system7_0_100M_0/design_fc_rst_processing_system7_0_100M_0.xdc
  set_property processing_order EARLY [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_rst_processing_system7_0_100M_0/design_fc_rst_processing_system7_0_100M_0.xdc]
  read_xdc -ref design_fc_axi_dma_0_1 -cells U0 /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_dma_0_1/design_fc_axi_dma_0_1.xdc
  set_property processing_order EARLY [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_dma_0_1/design_fc_axi_dma_0_1.xdc]
  read_xdc -prop_thru_buffers -ref design_fc_axi_gpio_0_0 -cells U0 /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_gpio_0_0/design_fc_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_gpio_0_0/design_fc_axi_gpio_0_0_board.xdc]
  read_xdc -ref design_fc_axi_gpio_0_0 -cells U0 /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_gpio_0_0/design_fc_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_gpio_0_0/design_fc_axi_gpio_0_0.xdc]
  read_xdc -ref design_fc_axi_dma_0_1 -cells U0 /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_dma_0_1/design_fc_axi_dma_0_1_clocks.xdc
  set_property processing_order LATE [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_axi_dma_0_1/design_fc_axi_dma_0_1_clocks.xdc]
  read_xdc -ref design_fc_auto_us_0 -cells inst /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_us_0/design_fc_auto_us_0_clocks.xdc
  set_property processing_order LATE [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_us_0/design_fc_auto_us_0_clocks.xdc]
  link_design -top design_fc_wrapper -part xc7z030ffg676-2
  write_hwdef -file design_fc_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force design_fc_wrapper_opt.dcp
  report_drc -file design_fc_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force design_fc_wrapper_placed.dcp
  report_io -file design_fc_wrapper_io_placed.rpt
  report_utilization -file design_fc_wrapper_utilization_placed.rpt -pb design_fc_wrapper_utilization_placed.pb
  report_control_sets -verbose -file design_fc_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force design_fc_wrapper_routed.dcp
  report_drc -file design_fc_wrapper_drc_routed.rpt -pb design_fc_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file design_fc_wrapper_timing_summary_routed.rpt -rpx design_fc_wrapper_timing_summary_routed.rpx
  report_power -file design_fc_wrapper_power_routed.rpt -pb design_fc_wrapper_power_summary_routed.pb -rpx design_fc_wrapper_power_routed.rpx
  report_route_status -file design_fc_wrapper_route_status.rpt -pb design_fc_wrapper_route_status.pb
  report_clock_utilization -file design_fc_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force design_fc_wrapper.mmi }
  write_bitstream -force design_fc_wrapper.bit 
  catch { write_sysdef -hwdef design_fc_wrapper.hwdef -bitfile design_fc_wrapper.bit -meminfo design_fc_wrapper.mmi -file design_fc_wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

