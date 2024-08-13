`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/12 09:56:01
// Design Name: 
// Module Name: bram_if
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

(* dont_touch = "yes" *)
module bram_inf(
    (* mark_debug = "true" *) 
    input RST,
    (* mark_debug = "true" *) 
    input CLK,
    (* mark_debug = "true" *) 
    input BRAM_START,
    
    (* mark_debug = "true" *) 
    output reg READY,
    (* mark_debug = "true" *) 
    output reg [31:0] DOUT,
    (* mark_debug = "true" *) 
    output reg [31:0] ADDR,
    (* mark_debug = "true" *) 
    output reg [3:0] WE
    );
    //reg READY, DOUT, ADDR, WE;
    (* mark_debug = "true" *)
    reg [1:0] curr_state=2'b0;
    (* mark_debug = "true" *) 
    reg [1:0] next_state = 2'b0;
    
    parameter   idle = 2'b00,
                start = 2'b01,
                data_in = 2'b10,
                stop = 2'b11;
    (* mark_debug = "true" *)
    reg [11:0] cnt = 1'b0;            
    always @(posedge CLK) begin
        if(RST) begin
           READY <= 1'b1;
           DOUT <= 32'b0;
           ADDR <= 32'b0;
           WE <= 4'b0; 
           //curr_state <= idle;
           //next_state = idle;
        end        
    end
    
    always @(posedge CLK) begin
        case(next_state)
            idle : begin    //0
                if(BRAM_START)
                    next_state <= start;
                //else
                  //next_state <= curr_state;
            
            end
            start : begin   //1
                
                
                next_state <= data_in;
            end
            data_in : begin //2
                WE <= 4'b1111;
                READY <= 1'b0;
                ADDR <= {cnt,2'b00}; 
                //DOUT = {((cnt[7:0]*3'd4)+3'd3),((cnt[7:0]*3'd4)+3'd2),((cnt[7:0]*3'd4)+3'd1),(cnt[7:0]*3'd4)};
                DOUT <= {1'b0,(cnt*3'd4)};
                cnt <= cnt +1;
                if(cnt == 99)
                    next_state <= stop;
            end
            stop : begin
                READY <= 1'b1;
                WE <= 4'b0000;
                cnt <= 1'b0;
                next_state <= idle;
            end
            default : begin
                next_state <= idle;
            end
        endcase
    end
endmodule
