//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Jul 27 16:20:03 2023
//Host        : chipdev2.physik.uni-wuppertal.de running 64-bit unknown
//Command     : generate_target uart_core_wrapper.bd
//Design      : uart_core_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module uart_core_wrapper
   (reset,
    uart2_pl_rxd,
    uart2_pl_txd,
    user_si570_sysclk_clk_n,
    user_si570_sysclk_clk_p);
  input reset;
  input uart2_pl_rxd;
  output uart2_pl_txd;
  input user_si570_sysclk_clk_n;
  input user_si570_sysclk_clk_p;

  wire reset;
  wire uart2_pl_rxd;
  wire uart2_pl_txd;
  wire user_si570_sysclk_clk_n;
  wire user_si570_sysclk_clk_p;

  uart_core uart_core_i
       (.reset(reset),
        .uart2_pl_rxd(uart2_pl_rxd),
        .uart2_pl_txd(uart2_pl_txd),
        .user_si570_sysclk_clk_n(user_si570_sysclk_clk_n),
        .user_si570_sysclk_clk_p(user_si570_sysclk_clk_p));
endmodule
