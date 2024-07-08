`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 11:11:32
// Design Name: 
// Module Name: key_proc_tb
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


module key_proc_tb();
parameter CLK_PD = 10.0;

reg CLK, RST, KEY;
wire start_stop;

key_proc uut (
    .RST    (RST),
    .CLK    (CLK),
    .KEY    (KEY),
    .STR_STP    (start_stop)  //start : 1, stop :0
    );

initial begin
    RST = 1'b1;
    #(CLK_PD*10);
    RST = 1'b0;
end

initial CLK = 1'b0;
always #(CLK_PD/2) CLK = ~CLK;

initial begin
    KEY = 1'b0;
    wait (RST == 1'b0);
    #(CLK_PD*40);
    KEY = 1'b1;
    #(CLK_PD*40);
    KEY = 1'b0;
    #(CLK_PD*40);
    KEY = 1'b1;
    #(CLK_PD*40);
    KEY = 1'b0;
   #(CLK_PD*100);
   $finish;
end            
           

endmodule
