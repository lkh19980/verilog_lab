`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/29 14:24:10
// Design Name: 
// Module Name: new_traffic
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


module new_traffic(
    input RST,
    input CLK,
    input PED_SW,
    output reg RED,
    output reg GREEN,
    output reg YELLOW,
    output reg WORK
    );
parameter   CLK_FREQ = 125_000_000;    
localparam [1:0] //   sIDLE  = 3'd0, 
                sYEL    = 2'd0,
                 sRED   = 2'd1,
                 sGREEN = 2'd2,
                 sPED   = 2'd3;
(* mark_debug = "true" *)
reg [1:0]   curr_state, next_state;
(* mark_debug = "true" *)
reg     start_cnt;
(* mark_debug = "true" *)
wire    cnt_done;
(* mark_debug = "true" *)
reg  [6:0] time_slot;
(* mark_debug = "true" *)
wire    [6:0]   curr_slot;
(* mark_debug = "true" *)
reg   [6:0]  curr_time;
reg     pd_sw_1d, pd_sw_2d;
wire    pd_sw_rising;

always @(posedge CLK)
begin
    if(RST)
        curr_state <= sYEL;
    else
        curr_state <= next_state;
end //always                

always @(RST, curr_state, cnt_done,PED_SW)
begin
    if(RST) begin
        next_state = sYEL;
        start_cnt = 1'b0;
        time_slot = 0;
        RED = 1'b0;
        GREEN = 1'b0;
        YELLOW = 1'b0;
        WORK = 1'b0;        
    end else begin    
        RED = 1'b0;
        GREEN = 1'b0;
        YELLOW = 1'b0;
        WORK = 1'b0;    
        case (curr_state)
            sYEL : begin
                time_slot = 10;
                if(cnt_done) begin
                    next_state = sRED;
                    start_cnt = 1'b0;                    
                end else begin
                    next_state = sYEL;
                    start_cnt = 1'b1;
                end                    
                YELLOW = 1'b1;
            end                                                                            
            sRED : begin
                time_slot = 7'd80;
                if(cnt_done) begin
                    start_cnt = 1'b0;
                    next_state = sGREEN;
                end else if(pd_sw_rising) begin
                    next_state = sPED;
                    start_cnt = 1'b0;
                end else begin
                    start_cnt = 1'b1;
                    next_state = sRED;
                end                                            ;                        
                RED = 1'b1;
            end                                                        
            sGREEN : begin
                time_slot = 80;
                if(cnt_done) begin
                    start_cnt = 1'b0;
                    next_state = sYEL;
                end else begin
                    start_cnt = 1'b1;
                    next_state = sGREEN;
                end                                            ;                        
                GREEN = 1'b1;
                WORK = 1'b1;
            end      
            sPED : begin
                if(curr_time < 20) begin 
                    time_slot = 20;
                end else begin 
                    time_slot = 12;
                end                                         
                if(cnt_done) begin
                    start_cnt = 1'b0;
                    next_state = sGREEN;
                end else begin
                    start_cnt = 1'b1;
                    next_state = sPED;
                end                        
                RED = 1'b1;
            end    
            default : next_state = sYEL;                          
        endcase
    end        // if/else
end    //always            


time_chk #(.CLK_FREQ(CLK_FREQ)) 
    u0 (
    .RST        (RST),
    .CLK        (CLK),
    .time_slot  (time_slot),
    .start      (start_cnt),
    .curr_slot  (curr_slot),
    .done       (cnt_done)
    );
always @(posedge CLK)
begin
    pd_sw_1d <= PED_SW;
    pd_sw_2d <= pd_sw_1d;
end
assign pd_sw_rising = pd_sw_1d & ~pd_sw_2d;    

always @(posedge CLK)
begin
    if(curr_state == sYEL)
        curr_time <= 7'd0;
    else if(pd_sw_rising)
        curr_time <= curr_slot;
 end        
      
endmodule
