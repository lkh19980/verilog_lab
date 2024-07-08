`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 11:52:19
// Design Name: 
// Module Name: time_chk
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


module time_chk(
    input RST,
    input CLK,
    input [6:0] time_slot,
    input       start,
    output [6:0]    curr_slot,
    output      done
    );
parameter CLK_FREQ = 125_000_000;
(* mark_debug = "true" *)
wire [39:0] MAX_CNT = time_slot * CLK_FREQ / 10;    
(* mark_debug = "true" *)
reg [29:0] cnt;

always @(posedge CLK)
begin
    if(RST)
        cnt <= 30'd0;
    else if(start)
        cnt <= cnt + 1;
    else
        cnt <= 30'd0;
end     //always

assign done = (cnt == MAX_CNT -1);
assign curr_slot = (cnt/CLK_FREQ) * 10;
    
endmodule
