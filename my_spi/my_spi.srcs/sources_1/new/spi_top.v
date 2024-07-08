`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/01 16:44:19
// Design Name: 
// Module Name: spi_top
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


module spi_top();
    spi_master_top smt(
    .RST (RST),
    .CLK,
    
    input [7:0] DIN,
    input WR,
    output FULL,
    
    input RD,
    output EMPTY,
    output [7:0] DOUT

    );


endmodule
