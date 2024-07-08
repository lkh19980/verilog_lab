`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 14:10:22
// Design Name: 
// Module Name: uart_rx_tb
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


module uart_rx_tb();
parameter CLK_PD = 8.0;

reg rst, clk, rxd;
//reg bit_cnt_done;
wire [7:0] rx_data;
wire [1:0] fsm_state;
wire rx_data_rdy;


uart_rx uut0(
    .RST(rst),
    .CLK(clk),
    .RXD(rxd),
    .PARITY(1'b0),
    //.bit_cnt_done(bit_cnt_done),
    .RX_DATA (rx_data),
    .RX_DATA_RDY(rx_data_rdy),
    .fsm_state (fsm_state)
    );
    
initial begin
    rst = 1'b1;
    #(CLK_PD*10)
    rst = 1'b0;
end

initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

parameter par_sel = 1'b0;
localparam [7:0] tx_data = 8'hB8; //1011 1000
wire par = (^tx_data) ^par_sel;
wire [8:0] send_data = {par, tx_data};

parameter BIT_PD = 125_000_000/9600 * CLK_PD;   //    클럭 / baudrate * 주기
integer i;


initial begin
    rxd= 1'b1;
    //bit_cnt_done = 1'b0;
    wait(!rst);
    #(CLK_PD*5);
    rxd = 1'b0;
    //wait (fsm_state == 2'b10);
    #(BIT_PD);
    for(i = 0; i < 9;  i = i + 1) begin
        rxd = send_data[i];
        #(BIT_PD);
    end
    rxd = 1'b1;
    #(BIT_PD);
    //bit_cnt_done = 1'b1;
    //wait (fsm_state == 2'b00);
    #10000;
    $finish;
end
endmodule
