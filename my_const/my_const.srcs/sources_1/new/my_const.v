`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/12 14:24:00
// Design Name: 
// Module Name: my_const
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


module my_const(
input rd_rw, cs,
input [ADDR_WIDTH -1 : 0] address,
output [DATA_WIDTH -1 : 0] data );

    
    parameter DEPTH = 512;
    parameter DATA_WIDTH = 16;
    localparam ADDR_WIDTH = clogb2 (DEPTH);

    
    function integer clogb2 (input integer depth);
    begin
        for (clogb2 = 0; depth >0; clogb2 = clogb2 + 1)
            depth = depth >> 1;
        end
    endfunction
    
initial
    $display(" Parameter Values DATA WIDTH = %d; DEPTH = %d; ADDRESS WIDTH = %d ", DATA_WIDTH, DEPTH, ADDR_WIDTH);
    
endmodule

