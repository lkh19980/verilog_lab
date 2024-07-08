`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/27 11:05:50
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


module spi_master_top(
    input RST,
    input CLK,
    
    input [7:0] DIN,
    input WR,
    output FULL,
    
    input RD,
    output EMPTY,
    output [7:0] DOUT

    );
wire [7:0] DIN_spi;
wire nCS;
wire SCLK;
wire MISO;
wire MOSI;
    
fifo TX_FIFO (
.RST (RST),
.CLK (CLK),
.DIN (DIN),
.WR_EN (WR),
.FULL (FULL),

.DOUT (DIN_spi),
.RD_EN (RD_spi),
.EMPTY (EMPTY_spi)
);

fifo RX_FIFO (
.RST (RST),
.CLK (CLK),
.DIN (DOUT_spi),
.WR_EN (WR_spi),
.FULL (FULL_spi),
.DOUT (DOUT),
.RD_EN (RD),
.EMPTY (EMPTY)
);

spi_master spi_master0(
    .nCS (nCS),
    .SCLK (SCLK), //12.5MHz 1M to 50MHz
    .MOSI (MOSI),
    .MISO (MISO),
    
    .CLK (CLK),
    .RST(RST),
    .EMPTY(EMPTY_spi),
    .RD (RD_spi),
    .DIN (DIN_spi),
    
    .FULL (FULL_spi),
    .WR (WR_spi),
    .DOUT (DOUT_spi)
    );
    
    
spi_slave spi_slave0 (
    .nCS(nCS),
    .SCLK(SCLK),
    .MOSI(MOSI),
    .MISO(MISO)
    );
    
endmodule
