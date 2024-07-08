`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/18 15:18:03
// Design Name: 
// Module Name: cnt_tb
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


module cnt_tb();
parameter clk_period = 10;
reg CLK;

cnt uut(
    .CLK (CLK),
    .clk_out (clk_out)
    );



initial CLK = 1'b0;
always #(clk_period) CLK = ~CLK;

endmodule
