`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/26 16:30:32
// Design Name: 
// Module Name: DIO test
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


module DIO_test(
    input [3:0] DIO,
    output reg LED0,
    output reg LED1
    );

    
    always @(DIO)
    begin
        LED0 = 1'b0;
        LED1 = 1'b0;
    case(DIO)
        4'b0001 : LED0 = 1'b1;
        default : LED1 = 1'b1;
    endcase
    end
endmodule
