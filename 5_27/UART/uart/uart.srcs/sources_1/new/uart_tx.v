`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/10 09:44:42
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input RST,
    input CLK,
    (* mark_debug = "true" *)
    input START,
    (* mark_debug = "true" *)
    input [7:0] DIN,
    (* mark_debug = "true" *)
    output TXD
    );
(* mark_debug = "true" *)
parameter [1:0] idle = 2'b00,
                start = 2'b01,
                tx_send = 2'b10,
                stop = 2'b11;
reg [1:0] curr_state, next_state;
(* mark_debug = "true" *)
reg [3:0] over_sample_cnt;
(* mark_debug = "true" *)
reg [3:0] bit_cnt;
(* mark_debug = "true" *)
wire over_sample_cnt_done, bit_cnt_done;
(* mark_debug = "true" *)
wire parity;
(* mark_debug = "true" *)
reg[7:0] tx_data_in;
(* mark_debug = "true" *)
wire [8:0] tx_data = {parity, tx_data_in};
wire baud_x16_en;


reg TXD;


always @(posedge CLK)
if(START)
    tx_data_in <= DIN;
    //tx_data_in <= 8'h41;




always @(posedge CLK) begin
if(RST) begin
    curr_state = idle;
end else 
    curr_state <= next_state;
end

always @(curr_state, START, over_sample_cnt_done, bit_cnt_done)
begin
    case(curr_state)
        idle : begin
            if(START) 
                next_state = start;
            else 
               next_state = idle;
        end
        start : begin
            if(over_sample_cnt_done)
                next_state = tx_send;
            else 
                next_state = start;
        end
        tx_send : begin
            if(bit_cnt_done && over_sample_cnt_done) 
                next_state = stop;
            else 
                next_state = tx_send;
        end
        stop : begin
            if(over_sample_cnt_done)
                next_state = idle;
            else
                next_state = idle;//stop?idle
        end
        default : next_state = idle;
        
    endcase
end

// over sample count 5th
always @(posedge CLK)
    if(curr_state == idle)
        over_sample_cnt <= 5'd15;
    else if(baud_x16_en)
        over_sample_cnt <= over_sample_cnt - 1;
        
assign over_sample_cnt_done = (over_sample_cnt == 4'd0) & baud_x16_en;

//bit count generation 6th
always @(posedge CLK)
    if(curr_state != (tx_send))
        bit_cnt <= 4'd0;
    else if(over_sample_cnt_done)
        bit_cnt <= bit_cnt + 1;
        
 assign bit_cnt_done = over_sample_cnt_done & (bit_cnt == 4'd8);
 
 //parity gen 7th
assign parity = ^tx_data[7:0];
//assign parity
//parellel to serial 8th
always @(curr_state, bit_cnt)
    if(curr_state == idle || curr_state == stop)
        TXD = 1'b1;
    else if(curr_state == start)
        TXD = 1'b0;
    else
        TXD = tx_data[bit_cnt];
        
 //instantation uart_baud_gen 9th
 uart_baud_gen baud_gen_i0 (
    .RST (RST),
    .CLK (CLK),
    .BAUD_X16_EN (baud_x16_en)
    );
 
 
 
endmodule
