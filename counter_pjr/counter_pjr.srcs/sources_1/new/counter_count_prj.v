`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/18 13:52:00
// Design Name: 
// Module Name: counter_count_prj
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


module counter_count_prj(
    input CLK,
    output clk_out
    );
    assign clk_out = CLK;
    reg [7:0] cnt;
    always @* begin
    if(CLK)
        cnt = cnt +1;
    end
endmodule
