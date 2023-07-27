//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Jul 27 16:20:03 2023
//Host        : chipdev2.physik.uni-wuppertal.de running 64-bit unknown
//Command     : generate_target uart_core.bd
//Design      : uart_core
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "uart_core,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=uart_core,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "uart_core.hwdef" *) 
module uart_core
   (reset,
    uart2_pl_rxd,
    uart2_pl_txd,
    user_si570_sysclk_clk_n,
    user_si570_sysclk_clk_p);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset;
  input uart2_pl_rxd;
  output uart2_pl_txd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 user_si570_sysclk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME user_si570_sysclk, CAN_DEBUG false, FREQ_HZ 300000000" *) input user_si570_sysclk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 user_si570_sysclk CLK_P" *) input user_si570_sysclk_clk_p;

  wire clk_wiz_clk_40;
  wire clk_wiz_clk_uart;
  wire clk_wiz_locked;
  wire debug_uart_core_0_out_tx_serial;
  wire in_rx_serial_0_1;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire reset_1;
  wire user_si570_sysclk_1_CLK_N;
  wire user_si570_sysclk_1_CLK_P;
  wire [7:0]xlconstant_0_dout;
  wire [7:0]xlconstant_1_dout;
  wire [7:0]xlconstant_2_dout;
  wire [7:0]xlconstant_3_dout;
  wire [7:0]xlconstant_4_dout;
  wire [7:0]xlconstant_5_dout;
  wire [7:0]xlconstant_6_dout;

  assign in_rx_serial_0_1 = uart2_pl_rxd;
  assign reset_1 = reset;
  assign uart2_pl_txd = debug_uart_core_0_out_tx_serial;
  assign user_si570_sysclk_1_CLK_N = user_si570_sysclk_clk_n;
  assign user_si570_sysclk_1_CLK_P = user_si570_sysclk_clk_p;
  uart_core_clk_wiz_0 clk_wiz
       (.clk_40(clk_wiz_clk_40),
        .clk_in1_n(user_si570_sysclk_1_CLK_N),
        .clk_in1_p(user_si570_sysclk_1_CLK_P),
        .clk_uart(clk_wiz_clk_uart),
        .locked(clk_wiz_locked));
  uart_core_debug_uart_core_0_0 debug_uart_core_0
       (.clk_40(clk_wiz_clk_40),
        .clk_uart(clk_wiz_clk_uart),
        .dec10b_Out_dbg({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .in_rx_serial(in_rx_serial_0_1),
        .out_tx_serial(debug_uart_core_0_out_tx_serial),
        .rstn(proc_sys_reset_0_peripheral_aresetn),
        .statedb_can_mux(xlconstant_2_dout),
        .statedeb_can(xlconstant_1_dout),
        .statedeb_elink_rec(xlconstant_5_dout),
        .statedeb_elink_tra(xlconstant_4_dout),
        .statedeb_main(xlconstant_0_dout),
        .statedeb_osc_trim(xlconstant_3_dout),
        .statedeb_spi(xlconstant_6_dout));
  uart_core_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(reset_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_clk_uart));
  uart_core_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  uart_core_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  uart_core_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
  uart_core_xlconstant_3_0 xlconstant_3
       (.dout(xlconstant_3_dout));
  uart_core_xlconstant_4_0 xlconstant_4
       (.dout(xlconstant_4_dout));
  uart_core_xlconstant_5_0 xlconstant_5
       (.dout(xlconstant_5_dout));
  uart_core_xlconstant_6_0 xlconstant_6
       (.dout(xlconstant_6_dout));
endmodule
