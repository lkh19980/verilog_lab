`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 12:18:02
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
    input start_stop,
    output reg [3:0] num1s,
    output reg [2:0] num10s
    );
    parameter CLK_FREQ = 125_000_000;
    reg [31:0] count;
    reg tick1s;
    initial begin
    tick1s = 1'b0;
    count = 32'b0;
    num1s = 4'b0;
    num10s = 3'b0;
    end
    always @(posedge CLK)
    begin
        //#8 tick1s = ~tick1s;
        if(RST==1) begin
        count <= 32'd0;
        tick1s <= 1'b0;
        end 
        else if(start_stop == 1) begin
        count <= count +1;
        tick1s = 1'b0;
        if (count == CLK_FREQ)
        begin
            count <= 32'd0;
            //
            //tick1s <= 1'b1;
            tick1s = ~tick1s;
        end
        
        if (tick1s ==1'b1)
            begin
        
            num1s = num1s + 1;
            if (num1s == 4'd10)
                begin
                //$display("test");
                num1s = 4'd0;
                end
            end
        if (tick1s == 1'b1 && num1s == 9)
        begin
        num10s = num10s + 1;
        if (num10s == 3'd5)
            num10s = 3'd0;
        end
        end
    end
    
    
endmodule
