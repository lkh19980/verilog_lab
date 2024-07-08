`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 15:39:36
// Design Name: 
// Module Name: LED_out_tb
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


module LED_out_tb();

LED_out uut(
    .CLK (CLK),
    .num1s (num1s),
    .num10s (num10s),
    .AN (AN)
    );
defparam uut.f125 = 10;
reg CLK;
reg [3:0] num1s;
reg [2:0] num10s;
wire [7:0] AN;    

initial
begin
num1s = 0;
num10s = 0;
CLK = 0;
end
always
begin
#5 CLK = ~CLK;
end
always @(CLK)
begin
#50 num1s <= num1s +1;
if(num1s == 9) num1s <=0;
end
always @(CLK)
begin
#500 num10s <= num10s +1;
if(num10s == 5) num10s <= 0;
end
endmodule
