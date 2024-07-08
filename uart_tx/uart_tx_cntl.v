`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 10:55:45
// Design Name: 
// Module Name: uart_tx_cntl
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


module uart_tx_cntl(
    input RST,
    input CLK,
    input SEND,
    input [7:0] DATA,
    input PARITY,
    input BAUD_EN,
    output  reg BUSY,
    output reg DOUT
    );
parameter   [3:0] MAX_BIT = 9;
localparam  [1:0]   idle = 2'b00,
                    start = 2'b01,
                    data_tx = 2'b10,
                    stop = 2'b11;
reg [1:0] curr_state, next_state;
reg [3:0] bit_cnt;
reg       start_bit_cnt;
wire    enable;
wire    [8:0] send_data = {PARITY, DATA};

assign  enable = BAUD_EN;

always @(posedge CLK)
begin
    if(RST)
        curr_state <= idle;
    else
        curr_state <= next_state;
end     // always

always @(curr_state, enable, bit_cnt, SEND)                
begin
    BUSY = 1'b1;
    start_bit_cnt = 1'b0;
    case(curr_state)
        idle : begin
            if(SEND && enable)
                next_state = start;
            else
                next_state = idle;
            BUSY = 1'b0;
            DOUT = 1'b1;
        end
        start : begin
            if(enable)
                next_state = data_tx;
            else
                next_state = start;
            DOUT = 1'b0;          
        end
        data_tx : begin  
            if(enable) begin
                if(bit_cnt == (MAX_BIT)) begin
                    next_state = stop;
                    DOUT = 1'b1;
                end else begin
                    next_state = data_tx;
                    DOUT = send_data[bit_cnt];
                end                    
            end                    
            start_bit_cnt = 1'b1;    
        end
        stop : begin
               if(enable)
                    next_state = idle;
                else
                    next_state = stop;
        end
        default : next_state = idle;
    endcase
end // always next           

always @(posedge CLK)
begin
    if (RST || curr_state == idle)
        bit_cnt <= 4'd0;
    else if(start_bit_cnt && enable)
        bit_cnt <= bit_cnt + 1;
end                                                                                                                                                                                                  
    
endmodule
