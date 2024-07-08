`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 10:48:11
// Design Name: 
// Module Name: uart_Tx_top
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


module uart_Tx_top();

baud_gen_Tx baud (
    .Din (Din),
    .RST (RST),
    .CLK (CLK),
    .paritychech (1),
    .baud_enable (baud_enable)
);


endmodule
