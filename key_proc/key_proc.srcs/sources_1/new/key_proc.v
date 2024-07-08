`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 09:47:14
// Design Name: 
// Module Name: key_proc
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


module key_proc(
    input RST,
    input clk,
    input Key,
    output start_stop
    );
    reg ss_1d;
    reg ss_2d;
    wire enable;
    reg start_stop;
    //wire start_stop;
    assign enable = ss_1d & ~ss_2d;
    
    always @(posedge clk)
    begin
        ss_1d <= Key;
        ss_2d <= ss_1d;
        //enable <= ss_1d & ~ss_2d;
    end
    
    initial start_stop <= 1'b0;
    
    always @(posedge clk)
    begin
        if(RST)
        start_stop <= 1'b0; 
        //else if(~enable)
        //start_stop <= ~start_stop;
        //ss_1d <=0;
        //ss_2d <=0;
    end
    always @(posedge enable)
        start_stop <= ~start_stop;
endmodule
