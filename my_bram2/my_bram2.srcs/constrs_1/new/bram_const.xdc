
connect_debug_port dbg_hub/clk [get_nets u_ila_1_FCLK_CLK0]

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
connect_debug_port u_ila_0/clk [get_nets [list bram_bd_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {bram_bd_i/bram_inf_0/inst/DOUT[0]} {bram_bd_i/bram_inf_0/inst/DOUT[1]} {bram_bd_i/bram_inf_0/inst/DOUT[2]} {bram_bd_i/bram_inf_0/inst/DOUT[3]} {bram_bd_i/bram_inf_0/inst/DOUT[4]} {bram_bd_i/bram_inf_0/inst/DOUT[5]} {bram_bd_i/bram_inf_0/inst/DOUT[6]} {bram_bd_i/bram_inf_0/inst/DOUT[7]} {bram_bd_i/bram_inf_0/inst/DOUT[8]} {bram_bd_i/bram_inf_0/inst/DOUT[9]} {bram_bd_i/bram_inf_0/inst/DOUT[10]} {bram_bd_i/bram_inf_0/inst/DOUT[11]} {bram_bd_i/bram_inf_0/inst/DOUT[12]} {bram_bd_i/bram_inf_0/inst/DOUT[13]} {bram_bd_i/bram_inf_0/inst/DOUT[14]} {bram_bd_i/bram_inf_0/inst/DOUT[15]} {bram_bd_i/bram_inf_0/inst/DOUT[16]} {bram_bd_i/bram_inf_0/inst/DOUT[17]} {bram_bd_i/bram_inf_0/inst/DOUT[18]} {bram_bd_i/bram_inf_0/inst/DOUT[19]} {bram_bd_i/bram_inf_0/inst/DOUT[20]} {bram_bd_i/bram_inf_0/inst/DOUT[21]} {bram_bd_i/bram_inf_0/inst/DOUT[22]} {bram_bd_i/bram_inf_0/inst/DOUT[23]} {bram_bd_i/bram_inf_0/inst/DOUT[24]} {bram_bd_i/bram_inf_0/inst/DOUT[25]} {bram_bd_i/bram_inf_0/inst/DOUT[26]} {bram_bd_i/bram_inf_0/inst/DOUT[27]} {bram_bd_i/bram_inf_0/inst/DOUT[28]} {bram_bd_i/bram_inf_0/inst/DOUT[29]} {bram_bd_i/bram_inf_0/inst/DOUT[30]} {bram_bd_i/bram_inf_0/inst/DOUT[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {bram_bd_i/bram_inf_0/inst/ADDR[0]} {bram_bd_i/bram_inf_0/inst/ADDR[1]} {bram_bd_i/bram_inf_0/inst/ADDR[2]} {bram_bd_i/bram_inf_0/inst/ADDR[3]} {bram_bd_i/bram_inf_0/inst/ADDR[4]} {bram_bd_i/bram_inf_0/inst/ADDR[5]} {bram_bd_i/bram_inf_0/inst/ADDR[6]} {bram_bd_i/bram_inf_0/inst/ADDR[7]} {bram_bd_i/bram_inf_0/inst/ADDR[8]} {bram_bd_i/bram_inf_0/inst/ADDR[9]} {bram_bd_i/bram_inf_0/inst/ADDR[10]} {bram_bd_i/bram_inf_0/inst/ADDR[11]} {bram_bd_i/bram_inf_0/inst/ADDR[12]} {bram_bd_i/bram_inf_0/inst/ADDR[13]} {bram_bd_i/bram_inf_0/inst/ADDR[14]} {bram_bd_i/bram_inf_0/inst/ADDR[15]} {bram_bd_i/bram_inf_0/inst/ADDR[16]} {bram_bd_i/bram_inf_0/inst/ADDR[17]} {bram_bd_i/bram_inf_0/inst/ADDR[18]} {bram_bd_i/bram_inf_0/inst/ADDR[19]} {bram_bd_i/bram_inf_0/inst/ADDR[20]} {bram_bd_i/bram_inf_0/inst/ADDR[21]} {bram_bd_i/bram_inf_0/inst/ADDR[22]} {bram_bd_i/bram_inf_0/inst/ADDR[23]} {bram_bd_i/bram_inf_0/inst/ADDR[24]} {bram_bd_i/bram_inf_0/inst/ADDR[25]} {bram_bd_i/bram_inf_0/inst/ADDR[26]} {bram_bd_i/bram_inf_0/inst/ADDR[27]} {bram_bd_i/bram_inf_0/inst/ADDR[28]} {bram_bd_i/bram_inf_0/inst/ADDR[29]} {bram_bd_i/bram_inf_0/inst/ADDR[30]} {bram_bd_i/bram_inf_0/inst/ADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {bram_bd_i/bram_inf_0/inst/next_state[0]} {bram_bd_i/bram_inf_0/inst/next_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 12 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {bram_bd_i/bram_inf_0/inst/cnt[0]} {bram_bd_i/bram_inf_0/inst/cnt[1]} {bram_bd_i/bram_inf_0/inst/cnt[2]} {bram_bd_i/bram_inf_0/inst/cnt[3]} {bram_bd_i/bram_inf_0/inst/cnt[4]} {bram_bd_i/bram_inf_0/inst/cnt[5]} {bram_bd_i/bram_inf_0/inst/cnt[6]} {bram_bd_i/bram_inf_0/inst/cnt[7]} {bram_bd_i/bram_inf_0/inst/cnt[8]} {bram_bd_i/bram_inf_0/inst/cnt[9]} {bram_bd_i/bram_inf_0/inst/cnt[10]} {bram_bd_i/bram_inf_0/inst/cnt[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {bram_bd_i/bram_inf_0/inst/WE[0]} {bram_bd_i/bram_inf_0/inst/WE[1]} {bram_bd_i/bram_inf_0/inst/WE[2]} {bram_bd_i/bram_inf_0/inst/WE[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {bram_bd_i/bram_inf_0/inst/curr_state[0]} {bram_bd_i/bram_inf_0/inst/curr_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list bram_bd_i/bram_inf_0/inst/BRAM_START]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list bram_bd_i/bram_inf_0/inst/READY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list bram_bd_i/bram_inf_0/inst/RST]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
