`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/24 12:29:08
// Design Name: 
// Module Name: uart_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_top(
    input RST,
    input CLK,
    input RXD,
    output [6:0] AN,
    output CA,
    output PAR_ERR,
    output FRM_ERR,
    output TXD
    );
//(* mark_debug = "true" *)
//reg [7:0] rx_data;
//wire [7:0] rx_data; 
wire [7:0] RX_DATA;

uart_rx uart_rx_0 (
        .RST (RST),
        .CLK (CLK),
        .RXD (RXD),
        .RX_DATA (RX_DATA),
        .RX_DATA_RDY (RX_DATA_RDY),
        .FRM_ERR (FRM_ERR),
        .PARITY_ERR (PAR_ERR)
        );
my_fifo my_fifo (
    .RST (RST),
    .CLK (CLK),
    .DIN (RX_DATA),
    .WR_EN (RX_DATA_RDY),
    .FULL (FULL),
    .DOUT (dout),
    .RD_EN (rd_en),
    .EMPTY (empty)
    );
    
assign rd_en = ~empty;
wire empty;
reg [7:0] dout_reg;
wire [7:0] dout;
always @(posedge CLK)
    if(rd_en)
        dout_reg <= dout;
wire RX_DATA_RDY;
wire rd_en;        
display_inf disp_inf (
    .RST (RST),
    .CLK (CLK),
    .NUM_1S (dout_reg[3:0]),//dout_reg
    .NUM_10S (dout_reg[7:4]),
    .AN (AN),
    .CA (CA)
    );
    
uart_tx uart_tx_0 (
    .RST (RST),
    .CLK (CLK),
    .START (rd_en),
    .DIN (dout),
    .TXD (TXD)
    );
    
endmodule
