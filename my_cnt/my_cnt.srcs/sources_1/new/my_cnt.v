`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 10:29:13
// Design Name: 
// Module Name: my_cnt
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


module my_cnt(
    input RST,
    input CLK,
    input DIR,
    output [2:0] LED
    );
    wire [2:0] LED;
    assign LED[2:0] = cnt[31:29];
    reg [31:0] cnt;
    always @(posedge CLK)
    begin
        if (RST == 1'b1)
        begin cnt <= 32'd0;
        end
        else begin
            if(DIR == 1'b1)
                cnt <= cnt +1;
            else begin
                cnt <= cnt -1;
                end
        end
    end
    /*
    always @(posedge RST)
    begin
    if(DIR == 1'b0)
        cnt = cnt - 1;
    else
        cnt = cnt + 1;
    end
    assign LED[2:0] = cnt[31:29];
    */
endmodule
