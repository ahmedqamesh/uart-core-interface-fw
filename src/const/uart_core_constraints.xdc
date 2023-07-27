##Clock signal
set_property IOSTANDARD DIFF_SSTL12 [get_ports user_si570_sysclk_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports user_si570_sysclk_clk_n]
set_property PACKAGE_PIN AL8 [get_ports user_si570_sysclk_clk_p]
set_property PACKAGE_PIN AL7 [get_ports user_si570_sysclk_clk_n]

set_property PACKAGE_PIN AM13 [get_ports reset]


set_property IOSTANDARD LVCMOS33 [get_ports uart2_pl_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart2_pl_txd]
set_property PACKAGE_PIN E13 [get_ports uart2_pl_rxd]
set_property PACKAGE_PIN F13 [get_ports uart2_pl_txd]

