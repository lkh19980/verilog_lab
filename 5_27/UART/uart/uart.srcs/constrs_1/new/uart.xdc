

set_property IOSTANDARD LVCMOS33 [get_ports {AN[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports CA]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports FRM_ERR]
set_property IOSTANDARD LVCMOS33 [get_ports PAR_ERR]
set_property IOSTANDARD LVCMOS33 [get_ports RST]
set_property IOSTANDARD LVCMOS33 [get_ports RXD]
set_property IOSTANDARD LVCMOS33 [get_ports TXD]
set_property PACKAGE_PIN J18 [get_ports RXD]
set_property PACKAGE_PIN K18 [get_ports TXD]
set_property PACKAGE_PIN D20 [get_ports RST]
set_property PACKAGE_PIN M15 [get_ports PAR_ERR]
set_property PACKAGE_PIN N15 [get_ports FRM_ERR]
set_property PACKAGE_PIN H16 [get_ports CLK]
set_property PACKAGE_PIN T10 [get_ports CA]
set_property PACKAGE_PIN Y18 [get_ports {AN[0]}]
set_property PACKAGE_PIN Y19 [get_ports {AN[1]}]
set_property PACKAGE_PIN Y16 [get_ports {AN[2]}]
set_property PACKAGE_PIN Y17 [get_ports {AN[3]}]
set_property PACKAGE_PIN W14 [get_ports {AN[4]}]
set_property PACKAGE_PIN Y14 [get_ports {AN[5]}]
set_property PACKAGE_PIN T11 [get_ports {AN[6]}]

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
set_property port_width 9 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {uart_tx_0/tx_data[0]} {uart_tx_0/tx_data[1]} {uart_tx_0/tx_data[2]} {uart_tx_0/tx_data[3]} {uart_tx_0/tx_data[4]} {uart_tx_0/tx_data[5]} {uart_tx_0/tx_data[6]} {uart_tx_0/tx_data[7]} {uart_tx_0/tx_data[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {uart_tx_0/tx_data_in[0]} {uart_tx_0/tx_data_in[1]} {uart_tx_0/tx_data_in[2]} {uart_tx_0/tx_data_in[3]} {uart_tx_0/tx_data_in[4]} {uart_tx_0/tx_data_in[5]} {uart_tx_0/tx_data_in[6]} {uart_tx_0/tx_data_in[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {uart_tx_0/DIN[0]} {uart_tx_0/DIN[1]} {uart_tx_0/DIN[2]} {uart_tx_0/DIN[3]} {uart_tx_0/DIN[4]} {uart_tx_0/DIN[5]} {uart_tx_0/DIN[6]} {uart_tx_0/DIN[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list uart_tx_0/TXD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list uart_tx_0/START]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list uart_tx_0/parity]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK_IBUF_BUFG]