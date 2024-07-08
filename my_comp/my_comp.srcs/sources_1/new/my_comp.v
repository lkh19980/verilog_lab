`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/26 14:29:15
// Design Name: 
// Module Name: my_comp
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


module my_comp(
    input [1:0] A,
    input [1:0] B,
    output reg L,
    output reg G,
    output reg E
    );
    
    
    //always @ *
    always @ (A,B)
    begin
    G = 1'b0;
    L = 1'b0;
    E = 1'b0;
    
    if (A< B)
        L = 1'b1;
    else if (A > B)
        G = 1'b1;
    else if (A == B)
        E = 1'b1;
    end
    /*
    if(A[1]>B[1])
    G=1'b1;
    else if (A[1]<B[1])
    L=1'b1;
    else if (A[0]>B[0])
    G=1'b1;
    else if (A[0]<B[0])
    L=1'b1;
    else E = 1'b1;
    end
    */
endmodule
