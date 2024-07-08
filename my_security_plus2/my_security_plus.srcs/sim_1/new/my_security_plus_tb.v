`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 09:34:57
// Design Name: 
// Module Name: my_security_plus_tb
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


module my_security_plus_tb();
parameter CLK_PD = 8.00;
reg RST, CLK;
reg [1:0]   KEY;
reg         SENSOR;
wire        alarm_siren;
wire    [1:0] fsm_state;
    
my_security_plus #(.CLK_FREQ(10))
    uut (
    .RST    (RST),
    .CLK    (CLK),
    .KEY    (KEY),
    .SENSOR (SENSOR),
    .ALARM_SIREN    (alarm_siren),
    .FSM_STATE      (fsm_state)
    );    

initial begin
    RST = 1'b1;
    #(CLK_PD*10);
    RST = 1'b0;
end

initial CLK = 1'b0;
always #(CLK_PD/2) CLK = ~CLK;

initial begin
    KEY = 2'b00;
    SENSOR = 1'b0;
    wait (RST == 1'b0);
    #(CLK_PD*10);
    KEY = 2'b11;        // armed
    #(CLK_PD*10);
    KEY = 2'b00;        // disarmed        
    #(CLK_PD*10);
    KEY = 2'b11;        // armed
    #(CLK_PD*10);
    SENSOR = 1'b1;
    wait (alarm_siren == 1'b1);
    SENSOR = 1'b0;
    #(CLK_PD*10);
    KEY = 2'b00;    //disarmed
    #(CLK_PD*10);
    $finish;
end
            
endmodule
