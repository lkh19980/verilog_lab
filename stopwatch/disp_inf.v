`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/26 15:18:15
// Design Name: 
// Module Name: my_seg
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


module display_inf(
    input           RST,
    input           CLK,      // 125 Mhz
    input [3:0]     NUM_1S,
    input [3:0]     NUM_10S,
    output reg     CA,
    output reg [6:0] AN
    );
parameter CLK_FREQ = 125_000_000;
parameter CNT_MAX = CLK_FREQ / 1000_000; 

reg [26:0] clk_cnt;
wire    enable;

always @(posedge CLK)
begin
    if(RST)
        clk_cnt <= 27'd0;
    else begin
        if( clk_cnt == (CNT_MAX -1))
            clk_cnt <= 27'd0;
        else
            clk_cnt <= clk_cnt + 1;
    end                                
end

assign enable = (clk_cnt == (CNT_MAX -1));

always @(posedge CLK)
    if(RST)
        CA <= 1'b0;
    else if (enable)
        CA <= ~CA;

always @(CA, NUM_1S, NUM_10S)
begin
    if (CA) begin
        case (NUM_10S)
               0 : AN = 8'b00111111;
        1 : AN = 8'b00000110;
        2 : AN = 8'b01011011;
        3 : AN = 8'b01001111;
        4 : AN = 8'b01100110;
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
            default : AN = 7'h00;
        endcase  
    end else begin
        case (NUM_1S)
                    0 : AN = 8'b00111111;
        1 : AN = 8'b00000110;
        2 : AN = 8'b01011011;
        3 : AN = 8'b01001111;
        4 : AN = 8'b01100110;
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
            default : AN = 8'h00;
        endcase  
    end        
end        

endmodule
