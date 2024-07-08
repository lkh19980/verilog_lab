`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/25 12:04:22
// Design Name: 
// Module Name: my_4bitadder
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


module my_4bitadder(
    input [1:0] A,
    input [1:0] B,
    //input Ci,
    output [1:0] S,
    output Co
    );
    
    wire [1:0] ca;
    assign Co = ca[1];
    //assign Ci = 1'b0;
    
    my_fulladder fadd0(
    .A(A[0]),
    .B(B[0]),
    .Ci(1'b0),
    .S(S[0]),
    .Co(ca[0])
    );
    
    my_fulladder fadd1(
    .A(A[1]),
    .B(B[1]),
    .Ci(ca[0]),
    .S(S[1]),
    .Co(ca[1])
    );
    
endmodule
