//
// Module mopshub_lib.debug_uart_core.struct
//
// Created:
//          by - dcs.dcs (chipdev2.physik.uni-wuppertal.de)
//          at - 09:35:06 07/26/23
//
// Generated by Mentor Graphics' HDL Designer(TM) 2019.4 (Build 4)
//

`resetall
`timescale 1ns/10ps
module debug_uart_core #(
   // synopsys template
   parameter CLKS_PER_BIT = 64
)
( 
   // Port Declarations
   input   wire           clk_40, 
   input   wire           clk_uart, 
   input   wire    [7:0]  dec10b_Out_dbg, 
   input   wire           in_rx_serial, 
   input   wire           rstn, 
   input   wire    [7:0]  statedb_can_mux, 
   input   wire    [7:0]  statedeb_can, 
   input   wire    [7:0]  statedeb_elink_rec, 
   input   wire    [7:0]  statedeb_elink_tra, 
   input   wire    [7:0]  statedeb_main, 
   input   wire    [7:0]  statedeb_osc_trim, 
   input   wire    [7:0]  statedeb_spi, 
   output  wire           out_tx_serial
);


// Internal Declarations


// Local declarations

// Internal signal declarations
wire         axi_uart_test      = 1'b0;
wire  [7:0]  dout8bit;
reg   [7:0]  dout_fifo_reg;
reg          dout_rdy_fifo_reg;
wire         entimeout_uart;
wire         fifo_dbg_out_read;
wire         fifo_full;
wire  [7:0]  in_tx_byte;
wire         in_tx_dv_sm;
wire  [7:0]  o_Rx_Byte;
wire         o_Rx_DV;
wire  [7:0]  out_rx_byte;
wire         out_rx_dv;
reg          rd_en_data_rx;
reg          rd_en_data_tx;
wire         rd_en_s_rx;
wire         rd_en_s_tx;
wire         rst_fifo;
wire         rx_fifo_empty;
wire         select_dbg_sm;
wire  [7:0]  sm_dbg_out;
reg   [31:0] time_limit_trim;             //corresponds to 25 msec if the FPGA freq is 40Mhz
wire         timeoutrst_uart;             // timeout reset signal to the state machine in case bridge controller is not respoding for a specified time
wire         tx_fifo_empty;
wire         w_tx_active;
wire         w_tx_done;
wire         wena_w_fifo;
wire         write_dbg_fifo;


// Instances 
debug_uart_receiver #(CLKS_PER_BIT) debug_uart_receiver0( 
   .i_Clock     (clk_uart), 
   .i_Rx_Serial (in_rx_serial), 
   .o_Rx_DV     (o_Rx_DV), 
   .o_Rx_Byte   (o_Rx_Byte)
); 

debug_uart_sm dbg_uart_sm0( 
   .axi_uart_test     (axi_uart_test), 
   .clk               (clk_40), 
   .fifo_dbg_out_rdy  (rd_en_s_tx), 
   .out_rx_dv         (out_rx_dv), 
   .rst               (rstn), 
   .timeoutrst_uart   (timeoutrst_uart), 
   .w_tx_done         (w_tx_done), 
   .entimeout_uart    (entimeout_uart), 
   .fifo_dbg_out_read (fifo_dbg_out_read), 
   .in_tx_dv          (in_tx_dv_sm), 
   .select_dbg_sm     (select_dbg_sm), 
   .write_dbg_fifo    (write_dbg_fifo)
); 

debug_uart_transmitter #(CLKS_PER_BIT) debug_uart_transmitter0( 
   .i_Clock     (clk_uart), 
   .i_Tx_DV     (in_tx_dv_sm), 
   .i_Tx_Byte   (in_tx_byte), 
   .o_Tx_Active (w_tx_active), 
   .o_Tx_Serial (out_tx_serial), 
   .o_Tx_Done   (w_tx_done)
); 

fifo_async #(8,15) fifo_async0( 
   .wclk      (clk_uart), 
   .wrst_n    (rst_fifo), 
   .winc      (wena_w_fifo), 
   .wdata     (o_Rx_Byte), 
   .wfull     (fifo_full), 
   .awfull    (), 
   .rclk      (clk_40), 
   .rrst_n    (rst_fifo), 
   .rinc      (rd_en_s_rx), 
   .dout_fifo (dout8bit), 
   .rempty    (rx_fifo_empty), 
   .arempty   ()
); 

fifo_async #(8,15) fifo_async1( 
   .wclk      (clk_40), 
   .wrst_n    (rst_fifo), 
   .winc      (write_dbg_fifo), 
   .wdata     (sm_dbg_out), 
   .wfull     (), 
   .awfull    (), 
   .rclk      (clk_uart), 
   .rrst_n    (rst_fifo), 
   .rinc      (rd_en_s_tx), 
   .dout_fifo (in_tx_byte), 
   .rempty    (tx_fifo_empty), 
   .arempty   ()
); 

mux8_1_8bit mux8_1_8bit0( 
   .clk      (clk_40), 
   .rst      (rstn), 
   .data0    (statedeb_main), 
   .data1    (statedeb_can), 
   .data2    (statedb_can_mux), 
   .data3    (statedeb_osc_trim), 
   .data4    (statedeb_elink_tra), 
   .data5    (statedeb_elink_rec), 
   .data6    (statedeb_spi), 
   .data7    (dec10b_Out_dbg), 
   .sel      (out_rx_byte), 
   .en_sel   (select_dbg_sm), 
   .data_out (sm_dbg_out)
); 

timout_rst_module timout_rst1( 
   .clk        (clk_40), 
   .entimeout  (entimeout_uart), 
   .time_limit (time_limit_trim), 
   .rst        (rstn), 
   .timeoutrst (timeoutrst_uart)
); 

// HDL Embedded Text Block 4 eb4
// eb1 1  
initial dout_rdy_fifo_reg  = 1'b0;
initial dout_fifo_reg      = 8'b0;
initial rd_en_data_rx      = 1'b0;
initial rd_en_data_tx      = 1'b0;
initial time_limit_trim         = 32'd25000000;   //corresponds to 25 msec if the FPGA freq is 40Mhz

assign out_rx_byte = dout_fifo_reg;
assign out_rx_dv  = dout_rdy_fifo_reg;
//add read_en signal to overcome the clock Domains issues 
assign wena_w_fifo    = o_Rx_DV  && !fifo_full;
assign rd_en_s_rx     = !rx_fifo_empty;
assign rd_en_s_tx     = !tx_fifo_empty;
assign rst_fifo  = (rstn);


always @ (posedge clk_uart)
  if (!rstn) rd_en_data_tx       <=1'b0;
  else rd_en_data_tx  <= rd_en_s_tx;  
  
  
always @ (posedge clk_40)
  if (!rstn) rd_en_data_rx       <=1'b0;
  else rd_en_data_rx  <= rd_en_s_rx;     
    

always @ (posedge clk_40)
  if (!rstn) 
  begin 
  dout_fifo_reg       <=8'b0;
  dout_rdy_fifo_reg   <= 1'b0;
  end
  else
    begin
      if (rd_en_data_rx == 1)      
      begin
        dout_fifo_reg  <= dout8bit ;
        dout_rdy_fifo_reg <= 1'b1;
      end
      else
      begin                  
        dout_fifo_reg  <= dout_fifo_reg; 
        dout_rdy_fifo_reg <= 1'b0;

      end
    end  















































































endmodule // debug_uart_core

