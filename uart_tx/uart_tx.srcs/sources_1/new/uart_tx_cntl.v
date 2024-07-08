`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 10:46:54
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
    input [7:0] Din,
    input RST,
    input CLK,
    input SEND,
    input parity,
    input baud_enable,
    output reg BUSY,
    output reg Dout
    );
    parameter [3:0] MAX_BIT = 9;
    localparam [1:0] idle = 2'b00,
                     start = 2'b01,
                     Tx = 2'b10,
                     stop = 2'b11;
    reg [1:0] curr_state, next_state;
    //reg [3:0] mod11 = 4'b0;
    reg [3:0] bit_cnt = 4'b0;
    reg start_bit_cnt;
    
    wire enable;
    wire [8:0] send_data = {parity, Din};
    
    assign enable = baud_enable;
    
    always @ (posedge CLK)
    begin
        if(RST)
            curr_state <= idle;
        else
            curr_state <= next_state;
    end
    
    always @(curr_state, baud_enable, bit_cnt, SEND)
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
            Dout = 1'b1;
        end
        start : begin
            if(baud_enable)
                next_state = Tx;
            else
                next_state = start;
            Dout = 1'b0;
                
        end
        Tx : begin
            if(enable) begin
                if(bit_cnt == (MAX_BIT))begin
                    next_state = stop;
                    Dout = 1'b1;
                end else begin
                    next_state = Tx;
                    Dout = send_data[bit_cnt];
                end
            end
            start_bit_cnt = 1'b1;
        end
        /*
            if(mod11 == 10)
                next_state = stop;
            else
            begin
                Dout <= message
                mod11 = mod11 + 1'b1;
        end
        */
        stop : begin
            if(enable)
                next_state = idle;
            else
                next_state = stop;
        end
        default : begin
            next_state = idle;
        end
    
    
    endcase
end
always @ (posedge CLK)
begin
    if(RST || curr_state == idle)
        bit_cnt <= 4'b0;
    else if(start_bit_cnt && enable)
        bit_cnt <=bit_cnt +1;
end
endmodule
