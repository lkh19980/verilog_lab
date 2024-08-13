`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/12 10:33:53
// Design Name: 
// Module Name: bram_inf_tb
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


module bram_inf_tb();
    reg clk;
    reg rst, bram_start;
    
    wire ready;
    wire [31:0] ADDR;
    wire [31:0] DOUT;
    wire [3:0] WE;   
    bram_inf dut(
    .RST(rst),
    .CLK(clk),
    .BRAM_START(bram_start),
    .READY(ready),
    .DOUT(DOUT),
    .ADDR(ADDR),
    .WE(WE)
    );
    

    
    initial begin
    clk = 1'b0;
    end
    always #8 clk = ~clk;
    
    initial begin
    rst = 1'b0;
    #100;
    rst = 1'b1;
    #8;
    rst = 1'b0;
    bram_start= 1'b1;
    #16;
    bram_start = 1'b0;
    end
    
    
    
endmodule
