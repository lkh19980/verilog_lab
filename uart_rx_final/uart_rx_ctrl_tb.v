`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 10:38:29
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


module uart_rx_ctrl_tb();


parameter CLK_PD = 8.0;  //PD = period

parameter CLK_FREQ = 125_000_000;
parameter BAUD_RATE = 9600;
parameter BIT_PD = CLK_FREQ / BAUD_RATE;


reg rst, clk, rxd;
reg over_sample_cnt_done, bit_cnt_done;
wire [1:0] fsm_state;

uart_rx_ctrl uut(
    .RST(rst),
    .CLK(clk),
    .RXD(rxd),
    //BAUD_X16_EN,
    .over_sample_cnt_done(over_sample_cnt_done),
    .bit_cnt_done(bit_cnt_done),
    .fsm_state(fsm_state)
    );
    
initial begin
    rst = 1'b1;
    #(CLK_PD*10);
    rst = 1'b0;
end


initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

initial begin
    rxd = 1'b1;
    over_sample_cnt_done = 1'b0;
    bit_cnt_done = 1'b0;
    wait (!rst); //참될 때 까지 기다림
    repeat (10) @(posedge clk) //@ - event
    rxd = 1'b0;
    #(BIT_PD/2)
    over_sample_cnt_done = 1'b1; //start로 들어감
    @(posedge clk)
    over_sample_cnt_done = 1'b0; //data mode 대기
    #(BIT_PD/2);
    over_sample_cnt_done = 1'b1;
    bit_cnt_done = 1'b1;     //stop으로 들어감
    rxd = 1'b1;
    @(posedge clk)
    over_sample_cnt_done = 1'b0; //stop 대기
    bit_cnt_done = 1'b0;
    #(BIT_PD/2);
    over_sample_cnt_done = 1'b1;
    @(posedge clk)
    over_sample_cnt_done = 1'b0;
    $finish;
end
    
    

    
    
    
endmodule
