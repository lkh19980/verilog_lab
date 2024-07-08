`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 16:41:12
// Design Name: 
// Module Name: parity_gen
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


module parity_gen(
    input [7:0] Din,
    input paritycheck,
    output parity
    );
    
    assign parity <= (^Din)^paritycheck;
endmodule
