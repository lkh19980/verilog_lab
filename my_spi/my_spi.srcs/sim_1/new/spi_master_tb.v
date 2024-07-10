`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/27 15:25:44
// Design Name: 
// Module Name: spi_master_tb
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


module spi_master_tb();
parameter CLK_PD = 8.0;
reg CLK, RST;
reg [7:0] DIN;
reg WR, RD;
wire [7:0] DOUT;
spi_master_top smt (
    .RST (RST),
    .CLK (CLK),
    .DIN (DIN),
    .WR (WR),
    .FULL (FULL),
    .RD (RD),
    .EMPTY (EMPTY),
    .DOUT (DOUT)
    );
    


initial begin 
    CLK = 1'b1;
    RST = 1'b1;
    #(CLK_PD*10);
    RST = 1'b0;
    //CLK = 1'b1;
end
always #(CLK_PD/2) CLK =~CLK;

initial begin
wait(!RST);
DIN = {5'b10000,2'b11,1'b0};//write 10000 -> 10
WR = 1'b1;
#CLK_PD
DIN = 8'b10010011;//d3
#CLK_PD
WR = 1'b0;
#CLK_PD
DIN = 8'b10000001;
WR = 1'b1;
#CLK_PD
WR = 1'b0;
end


endmodule
