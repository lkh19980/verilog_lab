`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 10:39:13
// Design Name: 
// Module Name: uart_rx_ctrl_tb
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

//my_code

module uart_rx_ctrl_tb();
parameter CLK_PD = 8.0;
parameter CLK_FREQ = 125_000_000;
parameter BAUD_RATE = 9600;
parameter BIT_PD = CLK_FREQ/BAUD_RATE;

reg rst, clk, rxd;
reg over_sample_cnt_done, bit_cnt_done;
wire [1:0] fsm_state;
uart_rx_ctrl uut (
    .RST (rst),
    .CLK (clk),
    .RXD (rxd),
    .over_sample_cnt_done (over_sample_cnt_done),
    .bit_cnt_done (bit_cnt_done),
    .fsm_state (fsm_state)
    );
    
    
initial begin
rst = 1;
#(CLK_PD*10);
rst = 0;
end

initial begin
clk = 1'b0;
end
always #(CLK_PD/2) clk = ~clk;

initial begin
    rxd = 1;
    //over_sample_cnt_done = 0;
    bit_cnt_done = 0;
    wait(!rst);
    repeat (10) @(posedge clk);
    rxd = 1'b0;
    #(BIT_PD/2);
    //over_sample_cnt_done = 1;
    @(posedge clk);
    //over_sample_cnt_done = 0;
    #(BIT_PD/2);
    //over_sample_cnt_done = 1;
    bit_cnt_done =1;
    rxd = 1;
    @(posedge clk)
    //over_sample_cnt_done = 1'b0;
    bit_cnt_done = 1'b0;
    #(BIT_PD/2);
    //over_sample_cnt_done = 1'b1;
    @(posedge clk)
    //over_sample_cnt_done = 1'b0;
    #1000;
    $finish;
end

endmodule
