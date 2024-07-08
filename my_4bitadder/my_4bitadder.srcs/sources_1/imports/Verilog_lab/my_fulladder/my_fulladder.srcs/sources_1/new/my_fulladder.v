`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/25 10:37:40
// Design Name: 
// Module Name: my_fulladder
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


module my_fulladder(
    input A,
    input B,
    input Ci,
    output S,
    output Co
    );
    
    wire ha0_s, ha0_c, ha1_s, ha1_c;
    
    assign S = ha1_s;
    assign Co = ha0_c | ha1_c;
    
    //my_hadder ha0(.A(A), .B(B), .
    my_hadder ha0(
    .A(A), .B(B),
    .S(ha0_s),
    .C(ha0_c)
    ); 
    my_hadder ha1(
    .A(ha0_s), .B(Ci),
    .S(ha1_s),
    .C(ha1_c)
    ); 
endmodule
