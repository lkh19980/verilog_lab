`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/01 09:29:15
// Design Name: 
// Module Name: spi_slave
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


module spi_slave(
    input nCS,
    input SCLK,
    input MOSI,
    output reg MISO
    );
// signal declaration

reg   [7:0] data;       // received data
reg    phase = 0;    //  1: command, 0: data;
reg    cmd;       // 0: write, 1: read
reg [4:0] addr;
reg  [2:0]  bit_cnt = 3'd0;

// ram interface
wire clk = nCS | SCLK;
wire [7:0]  rdata;
reg        wen;    

// implemantation
always @(negedge nCS)
    phase <= ~phase;        // 1: command, 0: data

// bit cnt
always @(posedge clk, posedge nCS)
begin
    if(nCS == 1'b1)
        bit_cnt <= 3'd7;
    else        
        bit_cnt <= bit_cnt - 1;
end                 
    
always @(posedge clk)
    if (nCS == 1'b1)
        data <= 8'd0;
    else        
        data[bit_cnt] <= MOSI;

always @(posedge clk)
begin
    if(phase && bit_cnt == 3'd5)
        cmd <= data[7];
end     //always

// address gen
always @(posedge nCS)
    if(phase)
        addr = data[4:0];
                            
//wen gen
always @(posedge clk)
begin
    if(phase == 1'b0 && bit_cnt == 3'd0 && cmd == 0)
        wen <= 1'b1;
    else
        wen <= 1'b0;        
end //always                        

// MISO gen
initial MISO = 1'b0;
always @(posedge clk)
    if(cmd == 1'b1 && phase == 1'b0)
        MISO <= rdata[bit_cnt];

    
ram_32x8 ram_0 (
  .clka         (clk),    // input wire clka
  .wea          (wen),      // input wire [0 : 0] wea
  .addra        (addr),  // input wire [4 : 0] addra
  .dina         (data),    // input wire [7 : 0] dina
  .douta        (rdata)  // output wire [7 : 0] douta
);
   
endmodule
