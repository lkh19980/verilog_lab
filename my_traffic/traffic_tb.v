`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 13:34:22
// Design Name: 
// Module Name: traffic_tb
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


module traffic_tb();
parameter CLK_PD = 10.0;
reg RST, CLK, PED_SW;
wire    RED, GREEN, YELLOW, WORK;

traffic_cntl #(.CLK_FREQ(100))
    uut  (
    .RST    (RST),
    .CLK    (CLK),
    .PED_SW (PED_SW),
    .RED    (RED),
    .GREEN  (GREEN),
    .YELLOW (YELLOW),
    .WORK   (WORK)
    );

initial begin
    RST = 1'b1;
    #(CLK_PD*20);
    RST = 1'b0;
end

initial CLK = 1'b0;
always #(CLK_PD/2) CLK = ~CLK;

initial begin
    PED_SW = 1'b0;
    wait (RST == 1'b0);
    wait (RED == 1'b1);
    wait (RED == 1'b0);
    wait (RED == 1'b1);    
    #(CLK_PD*12);
    PED_SW = 1'b1;
    #(CLK_PD*3);
    PED_SW = 1'b0;    
    wait (GREEN == 1'b1);
    wait (GREEN == 1'b0);
    wait (YELLOW == 1'b1);
    wait (YELLOW == 1'b0);
    $finish;
end            
        
endmodule
