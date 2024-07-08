`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/27 15:28:54
// Design Name: 
// Module Name: my_ram_tb
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


module my_ram_tb();
parameter CLK_PD = 8.0;
reg rst, clk, rw;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;
integer i;
my_ram my_ram (
    .RST (rst),
    .CLK (clk),
    .ADDR(addr),
    .DIN(din),
    .DOUT(dout),
    .RW (rw)
    );
    
initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

initial begin
rst = 1'b1;
#(CLK_PD*10)
rst = 1'b0;
end

initial begin
addr = 4'b0;
din = 1'b0;
rw = 1'b1;
wait (rst == 1'b0);
#(CLK_PD *20);
rw = 1'b0;
for ( i=0;i<16;i= i + 1) begin
    addr = i;
    din = i;
    #(CLK_PD);
    end
#(CLK_PD * 20);
rw = 1'b1;
for(i = 0; i< 16; i = i + 1) begin
addr = i;
#(CLK_PD);
end

#1000;
$finish;
end //initial


endmodule
