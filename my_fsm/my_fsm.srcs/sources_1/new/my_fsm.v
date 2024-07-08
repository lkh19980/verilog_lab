`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 11:13:15
// Design Name: 
// Module Name: my_fsm
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


module my_fsm(
    input RST,
    input CLK,
    input [1:0] SW,
    output reg [1:0] LED,
    output VCC
    //output GND
    );
    
    assign VCC = 1'b1;
    //assign GND = 1'b0;
    
    localparam [1:0] idle = 2'b00,
                     state_a = 2'b01,
                     state_b = 2'b10,
                     state_c = 2'b11;
    reg [1:0] curr_state, next_state;
    
    
    always @(posedge CLK)
    begin
        if(RST)
            curr_state <= idle;
        else
            curr_state <= next_state;
    end
    
    always @( curr_state, SW)
    begin
        case(curr_state)
            idle : begin
                if(SW == 2'b01)
                    next_state = state_a;
                else 
                    next_state = idle;
                LED = idle;
            end 
            state_a : begin
                if(SW == 2'b10)
                    next_state = state_b;
                else 
                    next_state = state_a;
                LED = state_a;
            end
            state_b : begin
                if(SW == 2'b11)
                    next_state = state_c;
                else 
                    next_state = state_b;
                LED = state_b;
            end
            state_c : begin 
                if(SW == 2'b00)
                    next_state = idle;
                else 
                    next_state = state_c;
                LED = state_c;
            end
            default : next_state = idle;
        endcase
    end
    
endmodule
