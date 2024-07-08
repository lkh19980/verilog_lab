`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 09:39:56
// Design Name: 
// Module Name: my_7seg
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


module my_7seg(
    input [1:0] fsm_state,
    input CLK,
    output AN,
    output CA
    );
    localparam [1:0]    disarmed = 2'b00,
                    armed = 2'b01,
                    wait_delay = 2'b10,
                    alarm = 2'b11;
    reg [6:0] AN;
    wire CA = 1'b0; 
    
    always @(posedge CLK)
    begin
    case (fsm_state)
        disarmed : AN = 0'b0111111;
        armed : AN = 0'b0000110;
        wait_delay : AN = 0'b1011011;
        alarm : AN = 0'b1001111;
        //04 : AN = 0'b1100110;
        default : AN = 0'b1000000;
    endcase
    end
endmodule
