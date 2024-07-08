`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 15:08:41
// Design Name: 
// Module Name: my_security
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


module my_security(
    input [1:0] KEY,
    input SENSOR,
    input RST,
    input CLK,  
    output ALARM_SIREN,
    output [1:0] FSM_STATE
    );
    parameter CLK_FREQ = 125_000_000;
    localparam [1:0]    disarmed = 2'b00,
                        armed = 2'b01,
                        wait_delay = 2'b10,
                        alaam = 2'b11;
    reg [1:0] curr_state;
    reg [1:0] next_state;
    reg [29:0] cnt;
    wire cnt_done;
    reg start_cnt;
    
    always @(posedge CLK)
    begin
        if(RST)
            curr_state <= disarmed;
        else
            curr_state <= next_state;
    end
        
    always @ (posedge CLK)
    begin
        if(RST)
            cnt <= 30'd0;
        else if(start_cnt)
            cnt <= cnt +1;
        else
            cnt <= 30'd0; 
    end
    
    assign cnt_done = cnt == (CLK_FREQ*5-1);
    
    always @ (posedge CLK)
    begin
    case(curr_state)
        disarmed : begin
        if(KEY == 2'b11)
            next_state = armed;
        else 
            next_state = disarmed;
        ALARM_SIREN= 1'b0;
        start_cnt = 1'b0;
    end
    
    
endmodule
