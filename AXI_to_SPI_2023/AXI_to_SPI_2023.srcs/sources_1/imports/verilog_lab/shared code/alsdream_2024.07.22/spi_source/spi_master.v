`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/27 11:07:04
// Design Name: 
// Module Name: spi_master
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


module spi_master(
    input RST,
    input CLK,
    input EMPTY,
    output reg RD,
    input [7:0] DIN,
    input FULL,
    output reg WR,
    output [7:0] DOUT,
    output NCS ,
    output SCLK,
    output reg  MOSI,
    input MISO
    );
parameter   [2:0]   sidle = 3'd0,
                    scmd_rd = 3'd1,
                    scmd = 3'd2,
                    scmd_chk = 3'd3,
                    sdata_rd = 3'd4,
                    swrite = 3'd5,
                    sread = 3'd6;
//                    sstop = 3'd5;
parameter   CLK_DIV = 10;                    

reg [2:0] state;
reg [3:0] clk_cnt;
wire       sclk_clk;
reg [7:0] rdata;
wire     cmd; 
wire    bit_en;
reg [2:0]   bit_cnt;
reg [7:0]   sdata;

assign NCS = state == sidle || state == scmd_chk; // | state == sstart;
assign SCLK = ((state == sidle) || (state == scmd_chk)|| (state == scmd_rd)) ? 1'b0 : sclk_clk;
assign DOUT = sdata;

assign cmd = rdata[7];

//  spi master FSM
always @(posedge CLK, posedge RST)
begin
    if(RST) begin
        state <= sidle;
        RD <= 1'b0;
        WR <= 1'b0;
        bit_cnt <= 3'd7;
    end        
//    else if(bit_en) begin
    else begin            
        RD <= 1'b0;
        WR <= 1'b0;
        case (state)
            sidle : begin
                bit_cnt <= 3'd7;
                if(~EMPTY && bit_en) begin
                    state <= scmd_rd;
                    RD <= 1'b1;
                end else
                    state <= sidle;
            end
            scmd_rd :
                if(rd_d) 
                    state <= scmd;
                else
                    state <= scmd_rd;                    
            scmd : begin
                if(bit_en) begin
                    bit_cnt <= bit_cnt - 1;
                    if(bit_cnt == 3'd0)
                        state <= scmd_chk;
                    else
                        state <= scmd;                     
                end 
            end                
            scmd_chk : begin
                bit_cnt <= 3'd7;
                if(bit_en) begin
                    if(cmd)
                        state <= sread;
                    else begin
                        state <= sdata_rd;
                        RD <= 1'b1;
                    end
                end                                
            end
            sdata_rd :
                if(rd_d) 
                    state <= swrite;
                else
                    state <= sdata_rd;                    
            swrite : begin
                if(bit_en) begin
                    bit_cnt <= bit_cnt - 1;
                    if(bit_cnt == 3'd0)
                        state <= sidle;
                    else
                        state <= swrite;
                end                                            
            end
            sread : begin
                if(bit_en) begin
                    bit_cnt <= bit_cnt - 1;
                    if(bit_cnt == 3'd0) begin
                        state <= sidle;
                        WR <= ~FULL;
                    end else
                        state <= sread;
                end                                                            
            end
            default : state <= sidle;
        endcase
    end     //if(RST)    
end     //always fsm        

//SCLK gen
always @(posedge CLK)
begin
    if(RST)
        clk_cnt <= 4'd0;
    else if(clk_cnt == (CLK_DIV -1))
        clk_cnt <= 4'd0;
    else
        clk_cnt <= clk_cnt + 1;
end
assign sclk_clk = ( clk_cnt < CLK_DIV/2);
assign bit_en = clk_cnt == 3'd6;

// Parallel to serial MOSI
always @(state, bit_cnt)
begin
    if (state == swrite || state == scmd)
        MOSI = rdata[bit_cnt];
    else
        MOSI = 1'b0;        
end 

//Serial to parallel MISO
always @(negedge sclk_clk)
begin
    if(state == sidle)
        sdata <= 8'd0;
    else if(state == sread)
        sdata[bit_cnt] <= MISO;
end

reg rd_d;
always @(posedge CLK)
    rd_d <= RD;

always @(posedge CLK)
    if(state == sidle)
        rdata <= 8'd0;
    else if(rd_d)
        rdata <= DIN;        
    
endmodule
