`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 15:14:25
// Design Name: 
// Module Name: baud_gen_tb
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


module baud_gen_tb();

baud_gen_Tx uut (
    .Din (Din),
    .RST (RST),
    .CLK (CLK),
    .paritycheck (paritymode),
    .baud_enable (baud_enable)
);

initial 
begin
Din = 8'b00100011;
RST = 1'b1;
CLK = 1'b0;
paritymode = 1;
end

always
begin

end
endmodule
