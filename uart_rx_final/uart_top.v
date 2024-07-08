`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/24 12:25:18
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
    output FRM_ERR
    );
    
wire [7:0] rx_data;
uart_rx uart_rx_0(
    .RST(RST),
    .CLK(CLK),
    .RXD(RXD),
    .RX_DATA(rx_data),
    .RX_DATA_RDY(),
    .FRM_ERR (FRM_ERR),
    .PARITY_ERR(PAR_ERR)
    );
    
    
display_inf disp_0 (
    .RST (RST),
    .CLK (CLK),
    .NUM_1S (rx_data[3:0]),
    .NUM_10S (rx_data[7:4]),
    .AN (AN),
    .CA (CA)
    );
    
endmodule
