`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/19 15:03:57
// Design Name: 
// Module Name: my_adder
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


module my_adder(
    input A,
    input B,
    input Ci,
    output S,
    output Co
    );
    wire ab_xor;
    wire ab_and;
    wire ci_and;
    
    assign ab_xor = A ^ B;
    assign S = (ab_xor ^ Ci);
    assign Co = ci_and | ab_and;
    assign ci_and = ab_xor & Ci;
    assign ab_and = A & B;
endmodule
