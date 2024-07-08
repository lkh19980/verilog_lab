`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/03 10:30:48
// Design Name: 
// Module Name: my_fifo
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


module my_fifo(
    input RST,
    input CLK,
    input [7:0] DIN,
    input WR_EN,
    output FULL,
    input [7:0] DOUT,
    input RD_EN,
    output EMPTY
    );
endmodule
