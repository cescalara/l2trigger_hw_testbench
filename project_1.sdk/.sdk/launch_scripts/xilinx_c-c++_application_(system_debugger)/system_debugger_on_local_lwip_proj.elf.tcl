connect -url tcp:127.0.0.1:3121
source /home/francesca/xil_proj/trig_testbench_F/project_1.sdk/design_fc_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Platform Cable USB II 0000128f2f8f01"} -index 0
loadhw /home/francesca/xil_proj/trig_testbench_F/project_1.sdk/design_fc_wrapper_hw_platform_0/system.hdf
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Platform Cable USB II 0000128f2f8f01"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB II 0000128f2f8f01"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB II 0000128f2f8f01"} -index 0
dow /home/francesca/xil_proj/trig_testbench_F/project_1.sdk/lwip_proj/Debug/lwip_proj.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB II 0000128f2f8f01"} -index 0
con
