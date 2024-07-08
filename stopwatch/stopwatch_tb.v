`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 13:27:59
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
parameter CLK_PD = 10.0;
reg RST, CLK, START;
wire    [3:0]  num_1s;
wire    [2:0]   num_10s;

stopwatch #(.CLK_FREQ(5))
    uut (
    .RST        (RST),
    .CLK        (CLK),
    .START      (START),
    .NUM_1S     (num_1s),
    .NUM_10S    (num_10s)
    );

initial begin
    RST = 1'b1;
    #(CLK_PD*10);
    RST = 1'b0;
end

initial CLK = 1'b0;
always #(CLK_PD/2) CLK = ~CLK;

initial begin
    START = 1'b0;
    wait (RST == 1'b0);
    #(CLK_PD*10);
    START = 1'b1;
    #(CLK_PD*500);
    START = 1'b0;
    $finish;
end            

endmodule
