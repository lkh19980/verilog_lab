`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/03 10:30:43
// Design Name: 
// Module Name: my_fifo
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


module my_fifo(
    input RST,
    input CLK,
    input [7:0] DIN,
    input WR_EN,
    output FULL,
    output reg [7:0] DOUT,
    input RD_EN,
    output EMPTY
    );

reg [7:0] ram [0:31]; 
reg [4:0] wr_addr, rd_addr;
wire    addr_pos;      // full, empty check

// Data write 
always @(posedge CLK)
begin
    if (RST)
        wr_addr <= 5'd0;
    else if(WR_EN && !FULL)
        wr_addr <= wr_addr + 1;        
end // always 

always @(posedge CLK)
    if(WR_EN && !FULL)
        ram[wr_addr] <= DIN;

//data read
always @(posedge CLK)
begin
    if (RST) begin 
        rd_addr <= 5'd0;
        DOUT <= 8'd0;
    end else if(RD_EN && !EMPTY) begin 
        rd_addr <= rd_addr + 1;
        DOUT = ram[rd_addr];
    end        
end  //always

//assign DOUT = ram[rd_addr-1];

wire addr_equ = wr_addr[3:0] == rd_addr[3:0];     // check address equal
assign addr_pos = wr_addr[4] ^ rd_addr[4];

assign FULL = addr_equ & (addr_pos);
assign EMPTY = addr_equ & ~addr_pos;
                   
endmodule
