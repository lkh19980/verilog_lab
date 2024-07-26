`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/23 15:19:18
// Design Name: 
// Module Name: test
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


module test(
input A,
input B,
input C,
input CLK,
output D,
output reg E
    );
assign D = A? B : C;    

always @ (posedge CLK)
begin
if(A)
E<=B;
else
E=C;
end 

endmodule
