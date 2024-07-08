`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 15:46:50
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

parameter CLK_PD = 8.0;  //125MHz
reg rst, clk;
wire baud_x16_en;

uart_baud_gen #(.CLK_FREQ(1000), .BAUD_RATE(10))   //본 코드의 parameter를 바꿀 수 있음
    uut(
    .RST(rst),
    .CLK(clk),
    .BAUD_X16_EN(baud_x16_en)
    );
    
    
initial begin
    rst = 1'b1;
    #(CLK_PD*10);
    rst = 1'b0;
end

initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

initial begin
    repeat(10) @(posedge baud_x16_en); //10번 반복
     // wait (baud_x16_en == 1'b1); //enable == 1될 때까지 기다림
    #100;
    $finish;
end
        
endmodule
