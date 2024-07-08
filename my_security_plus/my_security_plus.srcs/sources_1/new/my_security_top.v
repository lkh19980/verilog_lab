`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 10:03:58
// Design Name: 
// Module Name: my_security_top
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


module my_security_top(
    input [1:0] KEY,
    input SENSOR,
    input RST,
    input CLK,
    output ALARM_SIREN,
    output CA,
    output [6:0] AN,
    output VCC
);
wire [1:0] FSM_STATE;

assign VCC = 1'b1;

my_security_plus u0 (
    .RST(RST), 
    .CLK(CLK), 
    .KEY(KEY), 
    .SENSOR(SENSOR), 
    .ALARM_SIREN(ALARM_SIREN), 
    .FSM_STATE(FSM_STATE) 
    );
my_7seg u1 (
    .fsm_state(FSM_STATE),
    .CLK(CLK),
    .AN(AN),
    .CA(CA)
    );

endmodule
