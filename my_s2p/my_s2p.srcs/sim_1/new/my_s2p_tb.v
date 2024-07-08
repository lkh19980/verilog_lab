`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 09:40:45
// Design Name: 
// Module Name: my_s2p_tb
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


module my_s2p_tb();
parameter CLK_PD = 10.0;
parameter CLK_FREQ = 125_000_000;
parameter BAUD_RATE = 9600;



my_s2p uut1 (
    .RST(RST),
    .CLK(CLK),
    .DIN(Serial),
    .SoF(SoF),
    .Dout(Parellel_out)
    );

my_p2s uut2 (
    .RST(RST),
    .CLK(CLK),
    .Start(Start),
    .Din(Parellel),
    .Dout(Serial),
    .SoF(SoF)
    );

reg RST;
reg CLK;
wire SoF;
wire Serial;
wire[7:0] Parellel_out;
reg [7:0] Parellel;
reg [7:0] Din= 8'b11110000;
reg Start;

initial
begin
    RST = 1'b0;
    CLK = 1'b0;
    Parellel = Din;
    #(CLK_PD*10);
    RST = 1'b0;
    Start = 1'b1;
end

always
begin
    #(CLK_PD/2) CLK = ~CLK;
    Start = 1'b0;
    Parellel = Parellel_out;
end

endmodule
