`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 12:32:03
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
    input RST,
    input CLK,
    input RXD,
    //input PARITY,
    //input bit_cnt_done,
    output [7:0] RX_DATA,
    output RX_DATA_RDY,
    output PARITY_ERR,
    output FRM_ERR
    //output [1:0] fsm_state
    );
    
    
wire baud_x16_en;


uart_baud_gen uart_baud_gen(
    .RST(RST),
    .CLK(CLK),
    .BAUD_X16_EN (baud_x16_en)
    );
    
    
uart_rx_ctrl uart_rx_ctrl(
    .RST(RST),
    .CLK(CLK),
    .RXD(RXD),
    .BAUD_X16_EN (baud_x16_en),
//    .bit_cnt_done(bit_cnt_done),
    .RX_DATA (RX_DATA),
    .RX_DATA_RDY (RX_DATA_RDY),
    .FRM_ERR (FRM_ERR),
    .PARITY_ERR(PARITY_ERR)
    //.fsm_state (fsm_state)
    );
    
    
endmodule
