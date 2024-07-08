`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 12:17:29
// Design Name: 
// Module Name: my_cnt_tb
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


module my_cnt_tb();
    parameter clk_period = 10;
    reg RST, CLK, DIR;
    wire [2:0] LED;
    
     my_cnt uut(
    .RST    (RST),
    .CLK    (CLK),
    .DIR    (DIR),
    .LED    (LED)
    );
//input always initial
    initial begin
    RST = 1'b1;
    //#200;
    #(clk_period*20);
    RST= 1'b0;
    end
    
    initial CLK = 1'b0;
    //always#10 CLK = ~CLK;
    always #(clk_period) CLK = ~CLK;
    
    initial begin
        DIR = 1'b0;
        wait (RST == 1'b0);
        #300;
        DIR = 1'b1;
        #300;
        DIR = 1'b0;
    end
endmodule
