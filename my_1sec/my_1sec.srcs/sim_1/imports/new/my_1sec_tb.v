`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 14:20:12
// Design Name: 
// Module Name: my_1sec_tb
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


module my_1sec_tb();
parameter CLK_PED = 10.0;

reg reset, clk;
wire dout;

my_1sec #(.clk_freq(20))// 변경 문법
uut(
.RST (reset),
.CLK (clk),
.LED (dout)
);

initial begin
    reset = 1'b1;
    #(CLK_PED*10);
    reset = 1'b0;
end
initial clk = 1'b0;
always #(CLK_PED/2) clk = ~clk;

endmodule
