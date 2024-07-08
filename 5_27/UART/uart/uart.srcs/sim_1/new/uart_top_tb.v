`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/10 14:05:44
// Design Name: 
// Module Name: uart_top_tb
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


module uart_top_tb();
parameter CLK_PD = 8.0;

reg rst, clk;


uart_top uart_top (
    .RST (rst),
    .CLK (clk),
    .RXD (rxd),
    .AN (an),
    .CA (ca),
    .PAR_ERR (par_err),
    .FRM_ERR (frm_err),
    .TXD (txd)
    );


initial begin 
rst = 1'b1;
clk = 1'b0;
#(CLK_PD *10);
rst = 1'b0;
end


always #(CLK_PD/2) clk <= ~clk;
endmodule
