`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 12:21:19
// Design Name: 
// Module Name: stopwatch
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


module stopwatch(
    input RST,
    input CLK,
    input START,
    output reg [3:0] NUM_1S,
    output reg [2:0] NUM_10S
    );
parameter CLK_FREQ = 125_000_000;

reg [26:0]  cnt;
wire        tick_1s;

always @(posedge CLK)
begin
    if(RST || ~START)
        cnt <= 27'd0;
    else if(cnt == (CLK_FREQ - 1))
        cnt <= 27'd0;
    else
        cnt <= cnt + 1;
end

assign tick_1s = cnt == (CLK_FREQ - 1);

always @(posedge CLK)
begin
    if (RST)
        NUM_1S <= 4'd0;
    else if(tick_1s) begin
        if(NUM_1S == 4'd9)
            NUM_1S <= 4'd0;
        else
            NUM_1S <= NUM_1S + 1;
    end                                            
end     //slways

always @(posedge CLK)
begin
    if (RST)
        NUM_10S <= 3'd0;
    else if(tick_1s && (NUM_1S == 4'd9)) begin
        if(NUM_10S == 3'd5)
            NUM_10S <= 3'd0;
        else
            NUM_10S <= NUM_10S + 1;
    end                                            
end     //slways
    
endmodule
