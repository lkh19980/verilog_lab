`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 11:46:35
// Design Name: 
// Module Name: time_cnt
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


module time_cnt(
    input [3:0] cnt_time,
    input start,
    input CLK,
    input RST,
    output reg cnt_done
    );
parameter CLK_FREQ = 125_000_000;
reg cnt1sec;
reg [31:0] cnt;
always @(posedge CLK)
begin
    if(RST)
        cnt = 32'b0;
        start = 1'b0;
    else
        
end
always @(posedge CLK)
begin
    if(cnt == CLK_FREQ*cnt_time -1)
    begin
        cnt_done <= 1'b1;
        cnt <= 32'b0;
    end
    else
    begin
        cnt <= cnt +1;
        cnt_done <= 1'b0;
    end
    
end
endmodule
