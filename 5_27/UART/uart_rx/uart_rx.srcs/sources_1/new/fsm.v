`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 09:47:23
// Design Name: 
// Module Name: fsm
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


module fsm(
    input RST,
    input CLK,
    input RXD,
    input oversample_done,
    input bit_cnt,
    output [1:0] state
    );

localparam [1:0] idle = 2'b00,
            start = 2'b01,
            data = 2'b10,
            stop = 2'b11;
reg curr_state;        
    
always @(posedge oversample_done, RST)
begin
case (current_state) 
    idle : begin
        
    end 
    start : begin
        
    end
    data : begin 
        
    end 
    stop : begin
        
    end
endcase
end
endmodule
