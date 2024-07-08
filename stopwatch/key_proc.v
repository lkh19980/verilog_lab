`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 09:49:37
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
    input CLK,
    input KEY,
    output reg STR_STP  //start : 1, stop :0
    );

reg ss_1d, ss_2d;
wire enable;

always @(posedge CLK)
begin
    ss_1d <= KEY;
    ss_2d <= ss_1d;
end

assign enable = ss_1d & ~ss_2d;

always @(posedge CLK)
begin
    if (RST)
        STR_STP <= 1'b0;
    else if (enable)
        STR_STP <= ~STR_STP;
end                
    
endmodule
