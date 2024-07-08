`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 11:09:38
// Design Name: 
// Module Name: my_trafficlight
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


module my_trafficlight(
    input CLK,
    input RST,
    input PED_CROSSING,
    output WORK,
    output RED_LED,
    output GREEN_LED,
    output YELLOW_LED
    );
parameter CLK_FREQ = 125_000_000;
localparam [1:0]RED_LIGHT = 2'b00,
                GREEN_LIGHT = 2'b01,
                YELLOW_LIGHT = 2'b10,
                PED_CROSS = 2'b11;
reg [1:0] state;
wire cnt_done;
reg cnt1sec;
reg [32:0] cnt;
reg RED_LED, GREEN_LED, YELLOW_LED, WORK;

always @ (posedge CLK)
begin
    case(state)
        RED_LIGHT : begin
            if
            
            RED_LED = 1'b1;
            GREEN_LED = 1'b0;
            YELLOW_LED = 1'b0;
            WORK = 1'b0;
            
        end
        GREEN_LIGHT : begin
            
            
            RED_LED = 1'b0;
            GREEN_LED = 1'b1;
            YELLOW_LED = 1'b0;
            WORK = 1'b0;
        end
        YELLOW_LIGHT : begin
            
            
            RED_LED = 1'b0;
            GREEN_LED = 1'b0;
            YELLOW_LED = 1'b1;
            WORK = 1'b0;
        end
        PED_CROSS : begin
            
            
            RED_LED = 1'b0;
            GREEN_LED = 1'b0;
            YELLOW_LED = 1'b0;
            WORK = 1'b1;
        end
        
    endcase
end

always @(posedge CLK)
begin
    if(cnt == CLK_FREQ)
        cnt1sec = ~cnt1sec;
    else
        cnt <= cnt +1;
end

always @ (cnt1sec)
begin
    
end 

endmodule
