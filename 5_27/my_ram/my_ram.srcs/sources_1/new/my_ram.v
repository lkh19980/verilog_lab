`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/27 15:13:35
// Design Name: 
// Module Name: my_ram
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


module my_ram(
    input RST,
    input CLK,
    input [3:0] ADDR,
    input [7:0] DIN,
    //output reg [7:0] DOUT,
    output [7:0] DOUT,
    input RW
    );
    
    reg [7:0] mem [0:15];

assign DOUT = mem[ADDR];
//assign mem[ADDR] = DIN;

///*
initial begin
//DOUT<= 8'b0;
mem[0] <= 8'b0;
end
always @ (posedge CLK) begin
if (RST) begin
    //ADDR <= 4'b0;
    //DOUT <= 8'b0;
end else
if(RW == 1'b0)begin
    mem[ADDR] <= DIN;
    //DOUT<=8'b0;
    end
//else
    //DOUT <= mem[ADDR];

end
/*
always @ (posedge CLK)
begin
    if(RW == 1'b0)
        mem[ADDR] <= DIN;
end
//*/
endmodule
