`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 13:39:53
// Design Name: 
// Module Name: stopwatch_tb
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


module stopwatch_tb();
//parameter CLK_FREQ = 100;
stopwatch uut (
    .RST (RST),
    .CLK (CLK),
    .start_stop (start_stop),
    .num1s (num1s),
    .num10s (num10s)
    );
defparam uut.CLK_FREQ =10;
reg RST;
reg CLK;
reg start_stop;
wire [3:0] num1s;
wire [2:0] num10s;



initial begin
RST = 1'b0;
CLK = 1'b0;
start_stop = 1'b0;
#5 start_stop = 1'b1;
//num1s = 4'b0;
//num10s = 3'b0;
end

always #5 CLK = ~CLK;

endmodule
