`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 12:01:36
// Design Name: 
// Module Name: my_ps_tb
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


module my_ps_tb();
parameter CLK_PD = 8.0;
reg rst, clk, start;
reg [7:0] din;
wire sof;
wire p2s_dout;
wire[7:0] s2p_dout;

my_p2s uut_0 (.RST(rst), .CLK(clk), .START(start),
            .DIN(din), .SOF(sof), .DOUT(p2s_dout));
my_s2p uut_1 (.RST(rst), .CLK(clk), .SOF(sof),
            .DIN(p2s_dout), .DOUT(s2p_dout));


initial begin
    rst = 1'b1;
    #(CLK_PD *10);
    rst = 1'b0;
end

initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

initial begin
    start = 1'b0;
    din = 8'd0;
    wait (rst == 1'b0);
    #(CLK_PD * 5);
    start = 1'b1;
    din = 8'h47;
    #(CLK_PD);
    start = 1'b0;
    repeat (20) @(posedge clk);
    start = 1'b1;
    din = 8'hb8;
    #(CLK_PD);
    start = 1'b0;
    #100;
    $finish;
end

endmodule
