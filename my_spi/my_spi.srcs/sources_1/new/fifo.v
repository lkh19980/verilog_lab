`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/27 10:57:33
// Design Name: 
// Module Name: fifo
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


module fifo(
    input RST,
    input CLK,
    (* mark_debug = "true" *)
    input [7:0] DIN,
    //(* mark_debug = "true" *)
    input WR_EN,
    (* mark_debug = "true" *)
    output FULL,
    (* mark_debug = "true" *)
    output [7:0] DOUT,
    //output reg [7:0] DOUT,
    (* mark_debug = "true" *)
    input RD_EN,
    (* mark_debug = "true" *)
    output EMPTY
    );
//(* mark_debug = "true" *)    
reg [7:0] ram [0:15]; //define memory
(* mark_debug = "true" *)
reg [4:0] wr_addr = 5'b0, rd_addr = 5'b0; // write /read address defined
(* mark_debug = "true" *)
wire addr_pos;  // parameter for full/empty signal generation 


/*
always @ (posedge CLK) begin
    if(RST) begin
        wr_addr <= 5'b0;
        rd_addr <= 5'b0;
    end else if (WR_EN & (~FULL)) begin
       ram[wr_addr[3:0]] <= DIN;
       wr_addr <= wr_addr + 1;
    end
    else if (RD_EN & (~EMPTY)) begin
        DOUT <= ram[rd_addr[3:0]];
        rd_addr <= rd_addr + 1;
    end
end
*/
always @ (posedge CLK) begin
    if(RST) begin
        wr_addr <= 5'b0;
    end else if (WR_EN & (~FULL)) begin
       ram[wr_addr[3:0]] <= DIN;
       wr_addr <= wr_addr + 1;
    end
end
always @ (posedge CLK) begin
    if(RST) begin
        rd_addr <= 5'b0;
    end else if (RD_EN & (~EMPTY)) begin
//        DOUT = ram[rd_addr[3:0]];
        rd_addr <= rd_addr + 1;
    end
end
assign    DOUT = ram[rd_addr[3:0]];

//assign DOUT = ram[rd_addr[3:0]];
/* // EMPTY and FULL output 
always @ (posedge CLK) begin
    if (RST)
        wr_addr <= 5'b0;
        rd_addr <= 5'b0;
        EMPTY <= 1'b0;
    else if (wr_addr == rd_addr) begin
        EMPTY = 1'b1;
    end
    else if (wr_addr - rd_addr
        
end
*/
wire addr_equ = wr_addr[3:0] == rd_addr[3:0]; //check address equal => empty
//wire addr_equ = wr_addr == rd_addr;
assign addr_pos = wr_addr[4] ^ rd_addr[4];
assign EMPTY = addr_equ & (~addr_pos); //addr_equ
//assign FULL = addr_pos && (wr_addr[3:0] == rd_addr[3:0]);
assign FULL = addr_equ & addr_pos;
//full empty output cannot save and read data
//position and rotation count

endmodule
