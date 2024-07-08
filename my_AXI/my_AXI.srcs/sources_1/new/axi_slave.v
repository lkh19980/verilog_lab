`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/25 12:28:15
// Design Name: 
// Module Name: axi_slave
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


module axi_slave(
    input [4:0] Addr,
    input AdValid,
    output reg AdReady,
    
    output [7:0] Data,
    output reg DaValid,
    input DaReady,
    
    input clk,
    input rst
    
    //output CLK,
    //output ADDR,
    //input RDATA
    );


ROM32x8 rom (
  .clka(clk),    // input wire clka
  .addra(ADDR),  // input wire [4 : 0] addra
  .douta(Data)  // output wire [7 : 0] douta
);
parameter [1:0] sidle = 2'b00,
                saddr = 2'b01,
                srom = 2'b10,
                sdata = 2'b11;



reg[1:0] cstate, nstate;

wire [4:0] rom_addr;
wire [7:0] rom_data;

assign rom_addr = Addr;
assign AXI_DATA = rom_data;

always @(posedge clk)
    if(rst)
        cstate <= sidle;
    else
        cstate <= nstate;
        
always @ (cstate, AdValid, AdReady)
begin
    AdReady = 1'b0;
    AdValid = 1'b0;
    case (cstate)
        sidle : begin
            if(AdValid) begin
                nstate = saddr;
            end else
                nstate = sidle;
        end
        sadder : begin
                nstate = srom;
                AdReady = 1'b1;
        end
        srom : nstate = sdata;
        sdata : begin
            AdValid = 1'b1;
            if(AdReady) begin
                adValid = 1'b1;
                nstate = sidle;
            end else
                nstate = sdata;
        end
    endcase
end





/*
reg [1:0] tmp = 2'b10; // Data stop

always @ (posedge clk) begin
    if (AdValid) begin
        if (tmp >> 1 == 1'b1) begin
            AdReady = 1'b1;
            
            tmp
        end
    
    end

end

always @ (posedge clk) begin
    if( AdReady == 1'b1 && AdValid == 1'b1) begin
        Data = tmp[0];
*/
endmodule
