`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 12:04:56
// Design Name: 
// Module Name: uart_tx_top_tb
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


module uart_tx_tb( );
parameter CLK_PD = 10.0;
parameter   CLK_FREQ = 125_000_000;
parameter   BAUD_RATE = 9600;
parameter   PARITY_MODE = 1'b0;
parameter   NUM_CHAR = 17;

reg rst, clk, send;
reg    [7:0] din;
wire    busy, dout;
integer i;

reg [0:(NUM_CHAR*8)-1] string ="Welcome to Inchon";



uart_tx #(.CLK_FREQ(CLK_FREQ), .BAUD_RATE(BAUD_RATE)) 
    uut (
    .RST    (rst),
    .CLK    (clk),
    .SEND   (send),
    .DIN    (din),
    .PARITY_MODE    (PARITY_MODE),
    .BUSY   (busy),
    .DOUT   (dout)
    );

initial begin
    rst = 1'b1;
    #(CLK_PD*10);
    rst = 1'b0;
end

initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

initial begin
    send = 1'b0;    
    wait (rst == 1'b0);
    #(CLK_PD*10);
    for (i = 0; i < NUM_CHAR; i=i+1) begin
        din =  string[i*8+:8];
        send = 1'b1;
        wait (busy == 1'b1);
        send = 1'b0;
        wait (busy == 1'b0);
        #(CLK_PD * 10);
    end
    #100;
    $finish;
end
        
endmodule
