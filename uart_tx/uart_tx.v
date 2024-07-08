`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 11:16:40
// Design Name: 
// Module Name: uart_tx_top
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


module uart_tx(
    input RST,
    input CLK,
    input SEND,
    input [7:0] DIN,
    input PARITY_MODE,  // 0 even parity, 1 odd parity
    output BUSY,
    input DOUT
    );
parameter   CLK_FREQ = 125_000_000;
parameter   BAUD_RATE = 9600;    

wire        parity;
wire        buad_enable;

uart_tx_cntl uart_tx_cnt (
    .RST        (RST),
    .CLK        (CLK),
    .SEND       (SEND),
    .DATA       (DIN),
    .PARITY     (parity),
    .BAUD_EN    (baud_enable),
    .BUSY       (BUSY),
    .DOUT       (DOUT)
    );

baud_gen_tx #(.CLK_FREQ (CLK_FREQ), .BAUD_RATE(BAUD_RATE)) 
    baud_gen (
    .RST        (RST),
    .CLK        (CLK),
    .BAUD_EN    (baud_enable)
    );

parity_gen parity_gen (
    .DATA       (DIN),
    .PARITY_MODE    (PARITY_MODE),
    .PARITY         (parity)
    );

endmodule
