# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -ruleid {1}  -id {Labtoolstcl 44-513}  -string {{ERROR: [Labtoolstcl 44-513] HW Target shutdown. Closing target: localhost:3121/xilinx_tcf/Xilinx/000013ccf85701}}  -suppress 
create_project -in_memory -part xc7z030ffg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/alx/xil_proj/pdm_zynq_board/fc/project_1.cache/wt [current_project]
set_property parent.project_path /home/alx/xil_proj/pdm_zynq_board/fc/project_1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths /home/alx/xil_proj/pdm_zynq_board/fc/ip_develop/fc_l2/L2triggerv5/solution1/impl [current_project]
read_ip -quiet /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0.xci
set_property is_locked true [get_files /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top design_fc_util_vector_logic_0_0 -part xc7z030ffg676-2 -mode out_of_context

rename_ref -prefix_all design_fc_util_vector_logic_0_0_

write_checkpoint -force -noxdef design_fc_util_vector_logic_0_0.dcp

catch { report_utilization -file design_fc_util_vector_logic_0_0_utilization_synth.rpt -pb design_fc_util_vector_logic_0_0_utilization_synth.pb }

if { [catch {
  file copy -force /home/alx/xil_proj/pdm_zynq_board/fc/project_1.runs/design_fc_util_vector_logic_0_0_synth_1/design_fc_util_vector_logic_0_0.dcp /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir /home/alx/xil_proj/pdm_zynq_board/fc/project_1.ip_user_files/ip/design_fc_util_vector_logic_0_0]} {
  catch { 
    file copy -force /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0_stub.v /home/alx/xil_proj/pdm_zynq_board/fc/project_1.ip_user_files/ip/design_fc_util_vector_logic_0_0
  }
}

if {[file isdir /home/alx/xil_proj/pdm_zynq_board/fc/project_1.ip_user_files/ip/design_fc_util_vector_logic_0_0]} {
  catch { 
    file copy -force /home/alx/xil_proj/pdm_zynq_board/fc/project_1.srcs/sources_1/bd/design_fc/ip/design_fc_util_vector_logic_0_0/design_fc_util_vector_logic_0_0_stub.vhdl /home/alx/xil_proj/pdm_zynq_board/fc/project_1.ip_user_files/ip/design_fc_util_vector_logic_0_0
  }
}
