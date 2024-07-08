`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/03 11:18:49
// Design Name: 
// Module Name: my_fifo_tb
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


module my_fifo_tb();

parameter CLK_PD = 8.00;
reg rst, clk, wr_en, rd_en;
reg [7:0] din;
wire full, empty;
wire [7:0] dout;

my_fifo uut(
    .RST (rst),
    .CLK (clk),
    .DIN (din),
    .WR_EN (wr_en),
    .FULL (full),
    .DOUT (dout),
    .RD_EN (rd_en),
    .EMPTY (empty)
    );

initial begin
//rst = 1'b0;
clk <= 1'b1;
rst <= 1'b1;
#(CLK_PD * 10);
rst <= 1'b0;
//clk <=1'b1;
end

always #(CLK_PD/2) clk <= ~clk;

always@(posedge clk)
begin
    if(rst)
    din <= 8'd0;
    else if (wr_en & (~full))
    //#(CLK_PD)
    din <= din +1;
end

initial begin
    wr_en = 1'b0;
    rd_en = 1'b0;
    wait (rst == 1'b0);
    #(CLK_PD *20);
    wr_en = 1'b1;
    repeat(17) @(posedge clk);
    wr_en = 1'b0;
    #(CLK_PD *20);
    rd_en = 1'b1;
    wait (empty == 1'b1);
    #(CLK_PD *20);
    rd_en = 1'b0;
    wr_en = 1'b1;
    @(posedge clk);
    rd_en = 1'b0;
    wr_en = 1'b1;
    @(posedge clk);
    rd_en = 1'b0;
    #(CLK_PD *10);
    $finish;
end


endmodule
