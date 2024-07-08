`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 10:15:56
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
    input BAUD_X16_EN,  //over_sample_cnt_done,
    //input over_sample_cnt_done
    //input bit_cnt_done,
    //output reg [7:0] RX_DATA,
    output [7:0] RX_DATA,
    //output reg RX_DATA_RDY,
    output RX_DATA_RDY,
    //output reg PARITY,
    output reg PARITY_ERR,
    output reg FRM_ERR
    //output reg [1:0] fsm_state
    );
    
localparam [1:0] idle = 2'b00,
                start = 2'b01,
                data = 2'b10,
                stop= 2'b11;

reg [1:0] curr_state =2'b0;
reg [1:0] next_state=2'b0;

wire 	over_sample_cnt_done;
reg [3:0] over_sample_cnt;
reg [8:0] rx_frame;
assign over_sample_cnt_done = (over_sample_cnt == 4'd0) & BAUD_X16_EN;
reg [1:0] fsm_state;
reg [3:0] bit_cnt;
assign RX_DATA = rx_frame[7:0];

always @(posedge CLK)
begin
    if(RST)
        curr_state <= idle;
    else
        curr_state <= next_state;
end //always

always @(curr_state, over_sample_cnt_done, bit_cnt_done, RXD)
begin
    case (curr_state)
    idle : begin
        if(RXD == 1'b0)
            next_state = start;
        else
            next_state = idle;
        fsm_state = 2'b00;
    end
    start : begin
        if(over_sample_cnt_done) begin
            if(RXD)
                next_state = idle;
            else
                next_state = data;
        end
        fsm_state= 2'b01;
    end
    data : begin
        if(over_sample_cnt_done && bit_cnt_done)
            next_state = stop;
        else
            next_state = data;
        fsm_state = 2'b10;
    end
    stop : begin
        if(over_sample_cnt_done)
            next_state = idle;
        else
            next_state = stop;
        fsm_state = 2'b11;
    end
    default : next_state = idle;
endcase

end //always 

//over_smaple_cnt_done
/* //my_code
reg [3:0] over_sample_cnt;
reg over_sample_cnt_done;

initial begin
    if(fsm_state == 2'b10) begin
        over_sample_cnt = 7;
    end
end
always @(CLK)
begin
    if(fsm_state == 2'b10) begin
        if(BAUD_X16_EN) 
        over_sample_cnt = over_sample_cnt - 1;
    else
        over_sample_cnt = 7;
    
    over_sample_cnt_done = (over_sample_cnt == 0);
    if (over_sample_cnt ==0)
            over_sample_cnt = 15;
    end
end
//wire 	over_sample_cnt_done;
//wire <=> assign
*/



always @(posedge CLK)
begin
	if(RST || curr_state == idle)
		over_sample_cnt <= 4'd7;
	else if (BAUD_X16_EN) begin
		if(!over_sample_cnt)
			over_sample_cnt <= 4'd15;
		else
			over_sample_cnt <= over_sample_cnt - 1;
	end
end





always @(posedge CLK)
begin
    if(RST || curr_state != data)
        bit_cnt <= 4'd0;
    else if(over_sample_cnt_done)
        bit_cnt <= bit_cnt + 1;
end

assign bit_cnt_done = (over_sample_cnt_done && (bit_cnt == 4'd8));
//============================================================
/*

//


always @(posedge CLK)
begin
    if(over_sample_cnt_done && fsm_state == 2'b10)
        RX_DATA[bit_cnt] <= RXD;
       
end


always @(posedge CLK)
begin
    if (RST) begin
        RX_DATA <= 8'd0;
        PARITY <= 1'b0;
        //RX_DATA_RDY <= 1'b0;
    end else if (curr_state == data) begin
        if(bit_cnt < 8 && over_sample_cnt_done) begin
            RX_DATA[bit_cnt] <= RXD;
            
            //RX_DATA_RDY <= 1'b0;
        //end else if( bit_cnt_done)
            //RX_DATA_RDY <= 1'b1;
        end else if(bit_cnt == 8&& over_sample_cnt_done) 
            PARITY <= RXD;
        else 
            PARITY <= 1'b0;
    end
end


always @(posedge CLK)
begin
    if (RST) begin
        RX_DATA <= 8'd0;
        //RX_DATA_RDY <= 1'b0;
    end else if (curr_state == data) begin
        if(bit_cnt < 8 && over_sample_cnt_done) begin
            RX_DATA[bit_cnt] <= RXD;
            //RX_DATA_RDY <= 1'b0;
        //end else if( bit_cnt_done)
            //RX_DATA_RDY <= 1'b1;
    end
    //else
            //RX_DATA_RDY <= 1'b0;
           
    elseif (curr_state == data&& over_sample_cnt_done) begin
        if(bit_cnt < 8 ) begin
            RX_DATA[bit_cnt] <= RXD;
            RX_DATA_RDY <= 1'b0;        
    end else 
        RX_DATA_RDY <= 1'b1;
    
    end
end
*/
/*
always @ (posedge CLK)
    RX_DATA_RDY <= bit_cnt_done;
*/



//compare too much gate
/*
always @(posedge CLK) begin
    if(RX_DATA_RDY) begin
        if((^RX_DATA[7:0])^PARITY)
            $display("wrong");
        else
            $display("right");
    end
end
*/
//=================================================================
assign RX_DATA_RDY = bit_cnt_done;

always @(posedge CLK) begin
    if (RST)
        PARITY_ERR <= 1'b0;
    else if(RX_DATA_RDY && (^RX_DATA[7:0])^rx_frame[8])
            PARITY_ERR <= 1'b1;
    else
        PARITY_ERR <=1'b0;
end



always @(posedge CLK)
begin
    if (RST)
        rx_frame <= 9'b0;
    else if (curr_state == data && over_sample_cnt_done)
        rx_frame[bit_cnt] <= RXD;
end

//assign PARITY_ERR = RX_DATA_RDY & ( rx_frame[8] == (1'b0 ^ (^RX_DATA)));


always @(posedge CLK)
begin
    if(RST)
        FRM_ERR <= 1'b0;
    else if ((curr_state == stop) && over_sample_cnt_done)
        if (!RXD)
            FRM_ERR <= 1'b1;
        else
            FRM_ERR <= 1'b0;   
end  
endmodule


