`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 15:24:47
// Design Name: 
// Module Name: baud_gen
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


module uart_baud_gen(
    input RST,
    input CLK,
    output BAUD_X16_EN
    );
    
    parameter CLK_FREQ = 125_000_000;
    parameter BAUD_RATE = 9600;
    localparam MAX_CNT = CLK_FREQ/(BAUD_RATE*16);
    //wire reg is always calculate
    //compile select number
    //125M/9600 = 13020.8333
    //x16 => 813.802 => 12bit
    
    
    reg [12:0] cnt= 12'd0;
    reg enable;
    
    assign BAUD_X16_EN = enable;
    initial begin
        cnt = 13'b0;
    end
    always @(posedge CLK)
    begin
        if (RST)
            cnt = 13'b0;
        else begin
            cnt = cnt + 1;
            if(cnt ==(MAX_CNT -1)) begin
                enable <= 1;
                cnt <= 13'b0;
            end else
            enable <= 0;
        end
    end
    /*
    always @(posedge CLK)
    begin
        if(cnt ==(MAX_CNT -1)) begin
            enable <= 1;
            cnt <= 13'b0;
        end else
            enable <= 0;
    end
    */
endmodule
