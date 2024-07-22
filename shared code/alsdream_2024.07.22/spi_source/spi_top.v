`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/27 12:23:31
// Design Name: 
// Module Name: spi_master_top
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


module spi_top(
    input RST,
    input CLK,
    output FULL,
    input WR,
    input [7:0] DIN,
    output EMPTY,
    input RD,
    output [7:0] DOUT,
    output      ncs
//    output      sclk,
//    output      mosi,
//    output      miso
    );
wire    empty_spi, rd_spi, full_spi, wr_spi;
wire [7:0] din_spi, dout_spi;    

wire    sclk, mosi;
(* dont_touch="true" *)
 wire    miso;
    
my_fifo tx_fifo_0 (.RST(RST), .CLK(CLK), .DIN(DIN),.WR_EN(WR),.FULL(FULL), .DOUT(dout_spi), .RD_EN(rd_spi), .EMPTY(empty_spi));    
my_fifo rx_fifo_0 (.RST(RST), .CLK(CLK), .DIN(din_spi),.WR_EN(wr_spi),.FULL(full_spi), .DOUT(DOUT), .RD_EN(RD), .EMPTY(EMPTY));

spi_master master_0 ( .RST(RST), .CLK(CLK), .EMPTY(empty_spi), .RD(rd_spi), .DIN(dout_spi), .FULL(full_spi),
            .WR(wr_spi), .DOUT(din_spi), 
            .NCS(ncs), .SCLK(sclk), .MOSI(mosi), .MISO(miso));

spi_slave slave_0 (
    .nCS    (ncs),
    .SCLK   (sclk),
    .MOSI   (mosi),
    .MISO   (miso)
    );


endmodule
