`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/24 12:39:00
// Design Name: 
// Module Name: 7seg_out
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


module seg7_out(
    input CLK,
    input [3:0] num1s,
    input [2:0] num10s,
    output reg [6:0] AN,
    output reg CA
    );
//parameter f125 = 1000_000;
reg [31:0] count;
//reg clk125;

initial begin
count = 32'b0;
//clk125 = 1'b0;
AN = 8'b0;
CA = 1'b0;
end
/*
always @(posedge CLK)
begin
    count = count + 1;
    if(count == f125) begin
        clk125 = ~clk125;
        count = 0;
    end
end
*/
always @(posedge CLK)
begin
    if((CA)==0)
    begin
        case(num10s)
        0 : AN = 8'b10111111;
        1 : AN = 8'b10000110;
        2 : AN = 8'b11011011;
        3 : AN = 8'b11001111;
        4 : AN = 8'b11100111;
        5 : AN = 8'b11101101;
        6 : AN = 8'b11111101;
        7 : AN = 8'b10000111;
        8 : AN = 8'b11111111;
        9 : AN = 8'b11101111;
        10 : AN = 8'b11110111;
        11 : AN = 8'b11111100;
        12 : AN = 8'b11011000;
        13 : AN = 8'b11011110;
        14 : AN = 8'b11111001;
        15 : AN = 8'b11110001;
    endcase
    end
    else begin
    case(num1s)
        0 : AN = 8'b00111111;
        1 : AN = 8'b00000110;
        2 : AN = 8'b01011011;
        3 : AN = 8'b01001111;
        4 : AN = 8'b01100111;
        5 : AN = 8'b01101101;
        6 : AN = 8'b01111101;
        7 : AN = 8'b00000111;
        8 : AN = 8'b01111111;
        9 : AN = 8'b01101111;
        10 : AN = 8'b11110111;
        11 : AN = 8'b11111100;
        12 : AN = 8'b11011000;
        13 : AN = 8'b11011110;
        14 : AN = 8'b11111001;
        15 : AN = 8'b11110001;
    endcase
    end
    CA = ~CA;
end
endmodule

