`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 09:46:25
// Design Name: 
// Module Name: uart_rx_ctrl
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


module uart_rx_ctrl(
    input RST,
    input CLK,
    input RXD,
    input BAUD_X16_EN, //over_sample_cnt_done
    //input over_sample_cnt_done,
//    input bit_cnt_done,
    output [7:0] RX_DATA,
    output reg RX_DATA_RDY,
    output reg FRM_ERR,
    output PARITY_ERR
    //output reg [1:0] fsm_state //무어 머신이기 때문에 상태를 표현
    
    );
    
localparam [1:0]   //state 정의
    IDLE = 2'b00,
    START = 2'b01,
    DATA = 2'b10,
    STOP = 2'b11;
    
reg [1:0] curr_state, next_state;
reg [3:0] over_sample_cnt;
wire over_sample_cnt_done;

reg [3:0] bit_cnt;
wire bit_cnt_done;

reg [8:0] rx_frame;

always @(posedge CLK)
begin
    if(RST)
        curr_state <= IDLE;        // (<=) non-blocking,  (=) blocking
    else
        curr_state <= next_state;
end

always @(curr_state, BAUD_X16_EN, bit_cnt_done, RXD)
begin
    case(curr_state)
        IDLE : begin
            if(RXD == 1'b0)
                next_state = START;
            else
                next_state = IDLE;
            //fsm_state = 2'b00;
        end
        
        START : begin
            if(over_sample_cnt_done) begin
                if(RXD)
                    next_state = IDLE;
                else
                    next_state = DATA;
            end
            //fsm_state = 2'b01;
        end
        
        DATA : begin
            if(over_sample_cnt_done && bit_cnt_done)
                next_state = STOP;
            else
                next_state = DATA;
            //fsm_state = 2'b10;
        end
        
        STOP : begin
            if(over_sample_cnt_done)
                next_state = IDLE;
            else
                next_state = STOP;
            //fsm_state = 2'b11;
        end
        default : next_state = IDLE;
    endcase
end

/*always @(posedge CLK)
begin
    if(fsm_state == 2'b01)
        over_sample_cnt <= 4'd7;
            if(BAUD_X16_EN)
                over_sample_cnt <= over_sample_cnt - 1;
    else
        over_sample_cnt <= 4'd7;
end

always @(posedge CLK)
begin
    if(fsm_state == 2'b10 || fsm_state == 2'b11)
        over_sample_cnt <= 4'd15;
            if(BAUD_X16_EN)
                over_sample_cnt <= over_sample_cnt - 1;
    else
        over_sample_cnt <= 4'd15;
end


assign over_sample_cnt_done = (over_sample_cnt == 3'd0);*/ // 내가 한 거

always @(posedge CLK) 
begin
    if(RST || curr_state == IDLE)
        over_sample_cnt <= 4'd7;
    
    else if(BAUD_X16_EN) begin
        if(over_sample_cnt_done)
            over_sample_cnt <= 4'd15;
        else
            over_sample_cnt <= over_sample_cnt - 1;
    end
end

assign over_sample_cnt_done = (over_sample_cnt == 4'd0) & BAUD_X16_EN;




always @(posedge CLK)
begin
    if(RST || curr_state != DATA)
        bit_cnt <= 4'd0;
    else if(over_sample_cnt_done)
        bit_cnt <= bit_cnt + 1;
end
    
assign bit_cnt_done = (over_sample_cnt_done && (bit_cnt == 4'd8));

assign RX_DATA = rx_frame[7:0];




/*********************************************************************
always @(posedge CLK)
begin
    if(RST) begin
        RX_DATA <= 8'd0;
//        RX_DATA_RDY <= 1'b0;
    end else if (curr_state == DATA && over_sample_cnt_done) begin
        if(bit_cnt < 8) begin
            RX_DATA[bit_cnt] <= RXD;
//            RX_DATA_RDY <= 1'b0;
//        end else
//            RX_DATA_RDY <= 1'b1;
        end
    end
end
**********************************************************************/

/*********************************************************************
else if (curr_state == DATA) begin
        if(bit_cnt < 8 && over_sample_cnt_done) begin
            RX_DATA[bit_cnt] <= RXD;
            RX_DATA_RDY <= 1'b0;
        end
        else if(bit_cnt_done == 1)
            RX_DATA_RDY <= 1'b1;
    end
        else
        RX_DATA_RDY <= 1'b0;            //RX_DATA_RDY 오류 수정
************************************************************************/

always @(posedge CLK)
begin
    if(RST)
        rx_frame <= 9'd0;
    else if (curr_state == DATA && over_sample_cnt_done)
        rx_frame[bit_cnt] <= RXD;
end



        
always @(posedge CLK)
    RX_DATA_RDY <= bit_cnt_done;
        
assign PARITY_ERR = RX_DATA_RDY & (rx_frame[8] == (1'b0 ^ (^RX_DATA)));


always @(posedge CLK)
begin
    if(RST)
        FRM_ERR <= 1'b0;
    else if((curr_state == STOP) && over_sample_cnt_done)
        if (!RXD)
            FRM_ERR <= 1'b1;
        else
            FRM_ERR <= 1'b0;
end
endmodule
