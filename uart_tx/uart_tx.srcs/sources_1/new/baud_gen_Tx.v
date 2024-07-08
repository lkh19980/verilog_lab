`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 10:47:45
// Design Name: 
// Module Name: baud_gen_Tx
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


module baud_gen_Tx(
    //input [7:0] Din,
    input RST,
    input CLK,
    input paritycheck,
    //output message
    output reg baud_enable
    );
    
    parameter clk_freq = 125_000_000;
    //parameter clk_freq = CLK/1;
    parameter baud_rate = 9600;
    //parameter paritycheck = 1;
    //reg [10:0] message;
    reg parity;
    reg [13:0] maxcount = clk_freq/baud_rate;
    reg [13:0] cnt = 1'b0;
    
    initial @(posedge CLK)
    begin
        
    end 
    /*
    always @ (posedge clk_freq)
    begin
        if(RST) begin
            message = 11'b1;
        end
        else
        begin
            message <= 11'b0 + (Din<<2) + parity + 11'b1;
        end
    end
    always @ (posedge clk_freq)
    begin
        parity <= (^Din)^paritycheck;
    end
    */
    always @ (posedge CLK)
    begin
        if(cnt == maxcount) 
        begin
            cnt=0;
            baud_enable = 1'b1;
        end
        else
        begin
            cnt = cnt + 1'b1;
            baud_enable = 1'b0;
        end
    end
endmodule
