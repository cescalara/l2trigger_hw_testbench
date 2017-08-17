# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -ruleid {1}  -id {Labtoolstcl 44-513}  -string {{ERROR: [Labtoolstcl 44-513] HW Target shutdown. Closing target: localhost:3121/xilinx_tcf/Xilinx/000013ccf85701}}  -suppress 
create_project -in_memory -part xc7z030ffg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/francesca/xil_proj/trig_testbench_F/project_1.cache/wt [current_project]
set_property parent.project_path /home/francesca/xil_proj/trig_testbench_F/project_1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths {
  /home/francesca/xil_proj/trig_testbench_F/ip_develop/fc_l2/L2triggerv5/solution1/impl
  /home/francesca/xil_proj/l2_trigger/solution1/impl
} [current_project]
read_ip -quiet /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1.xci
set_property is_locked true [get_files /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top design_fc_auto_pc_1 -part xc7z030ffg676-2 -mode out_of_context

rename_ref -prefix_all design_fc_auto_pc_1_

write_checkpoint -force -noxdef design_fc_auto_pc_1.dcp

catch { report_utilization -file design_fc_auto_pc_1_utilization_synth.rpt -pb design_fc_auto_pc_1_utilization_synth.pb }

if { [catch {
  file copy -force /home/francesca/xil_proj/trig_testbench_F/project_1.runs/design_fc_auto_pc_1_synth_1/design_fc_auto_pc_1.dcp /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir /home/francesca/xil_proj/trig_testbench_F/project_1.ip_user_files/ip/design_fc_auto_pc_1]} {
  catch { 
    file copy -force /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1_stub.v /home/francesca/xil_proj/trig_testbench_F/project_1.ip_user_files/ip/design_fc_auto_pc_1
  }
}

if {[file isdir /home/francesca/xil_proj/trig_testbench_F/project_1.ip_user_files/ip/design_fc_auto_pc_1]} {
  catch { 
    file copy -force /home/francesca/xil_proj/trig_testbench_F/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_auto_pc_1/design_fc_auto_pc_1_stub.vhdl /home/francesca/xil_proj/trig_testbench_F/project_1.ip_user_files/ip/design_fc_auto_pc_1
  }
}
