set_property MARK_DEBUG true [get_nets RST_IBUF]
set_property MARK_DEBUG true [get_nets PED_SW_IBUF]

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
connect_debug_port u_ila_0/clk [get_nets [list CLK_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 40 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {u0/MAX_CNT[0]} {u0/MAX_CNT[1]} {u0/MAX_CNT[2]} {u0/MAX_CNT[3]} {u0/MAX_CNT[4]} {u0/MAX_CNT[5]} {u0/MAX_CNT[6]} {u0/MAX_CNT[7]} {u0/MAX_CNT[8]} {u0/MAX_CNT[9]} {u0/MAX_CNT[10]} {u0/MAX_CNT[11]} {u0/MAX_CNT[12]} {u0/MAX_CNT[13]} {u0/MAX_CNT[14]} {u0/MAX_CNT[15]} {u0/MAX_CNT[16]} {u0/MAX_CNT[17]} {u0/MAX_CNT[18]} {u0/MAX_CNT[19]} {u0/MAX_CNT[20]} {u0/MAX_CNT[21]} {u0/MAX_CNT[22]} {u0/MAX_CNT[23]} {u0/MAX_CNT[24]} {u0/MAX_CNT[25]} {u0/MAX_CNT[26]} {u0/MAX_CNT[27]} {u0/MAX_CNT[28]} {u0/MAX_CNT[29]} {u0/MAX_CNT[30]} {u0/MAX_CNT[31]} {u0/MAX_CNT[32]} {u0/MAX_CNT[33]} {u0/MAX_CNT[34]} {u0/MAX_CNT[35]} {u0/MAX_CNT[36]} {u0/MAX_CNT[37]} {u0/MAX_CNT[38]} {u0/MAX_CNT[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 30 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {u0/cnt[0]} {u0/cnt[1]} {u0/cnt[2]} {u0/cnt[3]} {u0/cnt[4]} {u0/cnt[5]} {u0/cnt[6]} {u0/cnt[7]} {u0/cnt[8]} {u0/cnt[9]} {u0/cnt[10]} {u0/cnt[11]} {u0/cnt[12]} {u0/cnt[13]} {u0/cnt[14]} {u0/cnt[15]} {u0/cnt[16]} {u0/cnt[17]} {u0/cnt[18]} {u0/cnt[19]} {u0/cnt[20]} {u0/cnt[21]} {u0/cnt[22]} {u0/cnt[23]} {u0/cnt[24]} {u0/cnt[25]} {u0/cnt[26]} {u0/cnt[27]} {u0/cnt[28]} {u0/cnt[29]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 7 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {curr_slot[0]} {curr_slot[1]} {curr_slot[2]} {curr_slot[3]} {curr_slot[4]} {curr_slot[5]} {curr_slot[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {curr_state[0]} {curr_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 7 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {curr_time[0]} {curr_time[1]} {curr_time[2]} {curr_time[3]} {curr_time[4]} {curr_time[5]} {curr_time[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {next_state[0]} {next_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 7 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {time_slot[0]} {time_slot[1]} {time_slot[2]} {time_slot[3]} {time_slot[4]} {time_slot[5]} {time_slot[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list cnt_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list PED_SW_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list RST_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list start_cnt]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK_IBUF_BUFG]
