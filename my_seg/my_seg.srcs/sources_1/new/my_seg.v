`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/26 15:24:56
// Design Name: 
// Module Name: my_seg
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


module my_seg(
    output reg [6:0] A,
    output CA,
    input [1:0] SW
    );
    
assign CA = 1'b1;


always @(SW)
begin
    case(SW)
        2'b00 : A = 8'h06;
        2'b01 : A = 8'h5b;
        2'b10 : A = 8'h4f;
        2'b11 : A = 8'h66;
        default : A = 8'hf1;
    endcase
end
        
endmodule
