`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/18 11:34:56
// Design Name: 
// Module Name: counter_prj
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


module counter_prj(
    input [9:0] counter,
    input enable,
    output reg [1:0] LED,
    output reg [3:0] SEG1,
    output reg [2:0] SEG10
    );
    always @(enable)
    begin
        if((counter/60)>0)
            LED <= LED + 1'b1;
        SEG10 <= (counter%60)/10;
        SEG1 <= (counter%10);    
    end

endmodule
