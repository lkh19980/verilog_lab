`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 14:22:13
// Design Name: 
// Module Name: my_1sec
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


module my_1sec(
    input RST,
    input CLK,
    output reg LED
    );
    parameter clk_freq = 125_000_000;
    
    reg     enable;
    reg [31:0] cnt;
    
    always @(posedge CLK)
    begin
        if (RST) 
        begin
        cnt <= 32'd0;
        enable <= 1'b0;
        end 
        else begin
            if( cnt == (clk_freq-1)) begin
                cnt <= 32'd0;
                enable <= 1'b1;
            end else begin
                cnt <= cnt +1;
                enable <= 1'b0;
            end
        end
    end
    
    always @(posedge CLK)
    begin
        if(RST)
            LED <= 1'b0;
        else if (enable)
            LED <= ~LED;
    end
/*
    always #(
    if(RST == 1'b0)begin
    LED=1'b1;
    
    end else
    begin
    LED=1'b0;
    end
    */
endmodule
