`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 11:41:08
// Design Name: 
// Module Name: my_fsm_tb
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


module my_fsm_tb();
parameter CLK_PD = 10.0;


my_fsm uut(
    .CLK (CLK),
    .RST (RST),
    .SW (SW),
    .LED (LED)
    );
    reg RST, CLK;
    reg [1:0] SW;
    
    wire [1:0] LED;
    initial
    begin
    CLK <= 1'b0;
    RST = 1'b0;
    SW = 2'b00;
    #5 RST = 1'b1;
    end
    /*
    initial begin
        RST= 1'b1;
        #(CLK_PD*20);
        RST = 1'b0;
    end
    
    initial CLK = 1'b0;
    always #(CLK_PD/2) CLK = ~CLK;
    
    initial begin
    SW = 2'b00;
    wait (RST == 1'b0);
    #(CLK_PD*10);
    SW = 2'b01;
    
    #(CLK_PD*10);
    SW = 2'b10;
    wait (RST == 1'b0);
    #(CLK_PD*10);
    SW = 2'b11;
    #(CLK_PD*10);
    SW = 2'b00;
    */
    always 
    begin
        #10 CLK = ~CLK;
    end
    always
    begin
        RST = 1'b0;
        #8 SW = SW + 2'b01;
    end
    
endmodule
