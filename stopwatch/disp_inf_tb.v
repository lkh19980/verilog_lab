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
module disp_inf_tb();
parameter CLK_PD = 10.0;
reg RST, CLK;
reg [3:0] num_1s;
reg [2:0] num_10s;
wire    [6:0] AN;
wire        CA;

display_inf #(.CLK_FREQ(5))
    uut (
    .RST        (RST),
    .CLK        (CLK),      // 125 Mhz
    .NUM_1S     (num_1s),
    .NUM_10S    (num_10s),
    .CA         (CA),
    .AN         (AN)
    );
initial begin
    RST = 1;
    #(CLK_PD*20);
    RST = 0;
end

initial CLK = 0;
always #(CLK_PD/2) CLK = ~CLK;

initial begin
    num_1s = 0;
    num_10s = 0;
    wait (RST == 1'b0);
    #(CLK_PD*20);
    num_1s = 1;
    num_10s = 3;
    #(CLK_PD*20);
    num_1s = 2;
    num_10s = 4;
    #(CLK_PD*20);
    $finish;
end        
                        
    


endmodule