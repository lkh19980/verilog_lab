`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 09:52:59
// Design Name: 
// Module Name: key_proc_tb
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


module key_proc_tb();
reg RST;
reg clk;
reg Key;

key_proc uut(
    .RST (RST),
    .clk (clk),
    .Key (Key),
    .start_stop (start_stop)
    );

initial
begin
    RST = 1'b0;
    clk = 1'b0;
    Key = 1'b0;
    #1 RST = 1'b1;
    #1 RST = 1'b0;
end

always
begin
    #5 clk  <= ~clk;
    #50 RST <= ~RST;
end

always
begin
    #10 Key = ~Key;
    #3 Key = ~Key;
    #12 Key = ~Key;
    #7 Key = ~Key;
end
endmodule
