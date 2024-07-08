`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 15:37:49
// Design Name: 
// Module Name: uart_baud_gen_tb
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


module uart_baud_gen_tb();
uart_baud_gen #(.CLK_FREQ(1000), .BAUD_RATE(10))
    uut(
    .RST(rst),
    .CLK(clk),
    .BAUD_X16_EN(enable)
    );
reg rst, clk;
wire enable;
parameter CLK_PD = 8.0;//125MHz


initial begin
    rst = 1'b1;
    #(CLK_PD*10);
    rst = 1'b0;
    //clk = 1'b0;
end
initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

initial begin
repeat(10) @(posedge enable);
#100;
$finish;
end


endmodule
