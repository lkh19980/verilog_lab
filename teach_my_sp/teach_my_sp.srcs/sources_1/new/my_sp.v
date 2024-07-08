`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 11:55:26
// Design Name: 
// Module Name: my_sp
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


module my_p2s(
    input RST, CLK, START,
    input [7:0] DIN,
    output SOF,
    output DOUT
    );
reg [2:0] bit_cnt;

assign DOUT = DIN[bit_cnt];
assign SOF = bit_cnt == 3'd0;

always @(posedge CLK)
begin
    if(RST)
        bit_cnt <= 3'd7;
    else if (START)
        bit_cnt <= 3'd0;
    else if(bit_cnt < 3'd7)
        bit_cnt <= bit_cnt +1;
end
 
  
endmodule


module my_s2p (
    input RST, CLK, SOF,
    input DIN,
    output reg [7:0] DOUT
    );
reg [2:0] bit_cnt;
reg data_reg;

always @( posedge CLK)
begin
    if(RST) begin
        DOUT <= 8'd0;
        data_reg <= 1'b0;
    end else begin
        DOUT[bit_cnt] <= data_reg;
        data_reg <= DIN;
    end
end

always @(posedge CLK)
begin
    if(RST)
        bit_cnt <= 3'd7;
    else if(SOF)
        bit_cnt <= 3'd0;
    else if(bit_cnt < 3'd7)
        bit_cnt <= bit_cnt + 1;
end     
endmodule