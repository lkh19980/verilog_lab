`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 09:33:06
// Design Name: 
// Module Name: my_security_plus
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


module my_security_plus(
    input RST,
    input CLK,
    input [1:0] KEY,
    input SENSOR,
    (* MARK_DEBUG="true" *)
    output reg ALARM_SIREN,
    output reg [1:0] FSM_STATE
    );
parameter CLK_FREQ = 125_000_000;
localparam [1:0]    disarmed = 2'b00,
                    armed = 2'b01,
                    wait_delay = 2'b10,
                    alarm = 2'b11;
(* MARK_DEBUG="true" *)
reg [1:0]   curr_state, next_state;
(* mark_debug= "true" *)
wire        cnt_done;
(* mark_debug= "true" *)
reg         start_cnt;
(* mark_debug= "true" *)
reg [29:0]  cnt;

always @(posedge CLK)
    if(RST)
        curr_state <= disarmed;
    else
        curr_state <= next_state;

always @(curr_state, KEY, SENSOR, cnt_done)
begin
    start_cnt = 1'b0;
    ALARM_SIREN = 1'b0;
    
    case(curr_state)
        disarmed : begin
            if(KEY == 2'b11)
                next_state = armed;
            else
                next_state = disarmed;
            FSM_STATE = 2'b00;
        end                                                                   
        armed : begin
            if(SENSOR == 1'b1)
                next_state = wait_delay;
            else if (KEY == 2'b00)
                next_state = disarmed;
            else
                next_state = armed;                
            FSM_STATE = 2'b01;
        end
        wait_delay : begin
            start_cnt = 1'b1;
            if(cnt_done == 1'b1)
                next_state = alarm;
            else if (KEY == 2'b00)
                next_state = disarmed;
            else
                next_state = wait_delay;                
            FSM_STATE = 2'b10;
        end
        alarm : begin
            ALARM_SIREN = 1'b1;
            if(KEY == 2'b00)
                next_state = disarmed;
            else
                next_state = alarm;
            FSM_STATE = 2'b11;
        end        
        default : next_state = disarmed;
    endcase
end

always @(posedge CLK)
begin
    if (RST)
        cnt <= 30'd0;
    else if(start_cnt)
        cnt <= cnt + 1;
    else
        cnt <= 30'd0;
end     //always

assign cnt_done = cnt == (CLK_FREQ*5 -1);
                        
endmodule
