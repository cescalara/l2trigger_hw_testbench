set_property PACKAGE_PIN AC12 [get_ports zynq_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports zynq_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports zynq_clk_n]
set_property PACKAGE_PIN AD19 [get_ports locked]
set_property IOSTANDARD LVCMOS25 [get_ports locked]
set_property DRIVE 16 [get_ports locked]

set_property PACKAGE_PIN AF17 [get_ports blink]
set_property IOSTANDARD LVCMOS25 [get_ports blink]

set_property PACKAGE_PIN AD14 [get_ports {zynq_data[14]}]
set_property PACKAGE_PIN AC14 [get_ports {zynq_data[15]}]
set_property PACKAGE_PIN AF14 [get_ports {zynq_data[13]}]
set_property PACKAGE_PIN AE15 [get_ports {zynq_data[12]}]
set_property PACKAGE_PIN AF15 [get_ports {zynq_data[11]}]
set_property PACKAGE_PIN AD15 [get_ports {zynq_data[10]}]
set_property PACKAGE_PIN AB15 [get_ports {zynq_data[9]}]
set_property PACKAGE_PIN AE16 [get_ports {zynq_data[8]}]
set_property PACKAGE_PIN AD16 [get_ports {zynq_data[7]}]
set_property PACKAGE_PIN AC16 [get_ports {zynq_data[6]}]
set_property PACKAGE_PIN AE17 [get_ports {zynq_data[5]}]
set_property PACKAGE_PIN AA15 [get_ports {zynq_data[4]}]
set_property PACKAGE_PIN AB16 [get_ports {zynq_data[3]}]
set_property PACKAGE_PIN AC17 [get_ports {zynq_data[2]}]
set_property PACKAGE_PIN AB17 [get_ports {zynq_data[1]}]
set_property PACKAGE_PIN AC18 [get_ports {zynq_data[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {zynq_data[0]}]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list inst_clk_diff_to_200/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {counter_b[0]} {counter_b[1]} {counter_b[2]} {counter_b[3]} {counter_b[4]} {counter_b[5]} {counter_b[6]} {counter_b[7]} {counter_b[8]} {counter_b[9]} {counter_b[10]} {counter_b[11]} {counter_b[12]} {counter_b[13]} {counter_b[14]} {counter_b[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {counter_a[0]} {counter_a[1]} {counter_a[2]} {counter_a[3]} {counter_a[4]} {counter_a[5]} {counter_a[6]} {counter_a[7]} {counter_a[8]} {counter_a[9]} {counter_a[10]} {counter_a[11]} {counter_a[12]} {counter_a[13]} {counter_a[14]} {counter_a[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {err_counter_a[0]} {err_counter_a[1]} {err_counter_a[2]} {err_counter_a[3]} {err_counter_a[4]} {err_counter_a[5]} {err_counter_a[6]} {err_counter_a[7]} {err_counter_a[8]} {err_counter_a[9]} {err_counter_a[10]} {err_counter_a[11]} {err_counter_a[12]} {err_counter_a[13]} {err_counter_a[14]} {err_counter_a[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {err_counter_b[0]} {err_counter_b[1]} {err_counter_b[2]} {err_counter_b[3]} {err_counter_b[4]} {err_counter_b[5]} {err_counter_b[6]} {err_counter_b[7]} {err_counter_b[8]} {err_counter_b[9]} {err_counter_b[10]} {err_counter_b[11]} {err_counter_b[12]} {err_counter_b[13]} {err_counter_b[14]} {err_counter_b[15]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
