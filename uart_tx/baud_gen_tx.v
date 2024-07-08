`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 10:45:34
// Design Name: 
// Module Name: baud_gen_tx
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


module baud_gen_tx(
    input RST,
    input CLK,
    output reg BAUD_EN
    );
parameter   CLK_FREQ = 125_000_000;
parameter   BAUD_RATE = 9600;
localparam [26:0]   MAX_CNT = CLK_FREQ / BAUD_RATE;

reg [26:0] cnt;

always @(posedge CLK)
begin
    if(RST) begin
        cnt <= 27'd0;
        BAUD_EN <= 1'b0;
    end else begin
        if (cnt == (MAX_CNT - 1)) begin
            cnt <= 27'd0;
            BAUD_EN <= 1'b1;
        end else begin
            cnt <= cnt + 1;
            BAUD_EN <= 1'b0;
        end            
    end
end     // always                                

    
endmodule
