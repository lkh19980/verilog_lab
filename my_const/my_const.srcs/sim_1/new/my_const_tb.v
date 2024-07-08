`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/12 14:31:36
// Design Name: 
// Module Name: my_const_tb
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


module my_const_tb();
wire [15:0] data;
my_const #(.DEPTH(4))
uut0(.address(32'd1),
.rd_wr(1'b0),
.cs(1'b0),
.data(data)
);
my_const #(.DEPTH(8))
uut1(.address(32'd1),
.rd_wr(1'b0),
.cs(1'b0),
.data(data)
);
my_const #(.DEPTH(16))
uut2(.address(32'd1),
.rd_wr(1'b0),
.cs(1'b0),
.data(data)
);
my_const #(.DEPTH(32))
uut3(.address(32'd1),
.rd_wr(1'b0),
.cs(1'b0),
.data(data)
);
my_const #(.DEPTH(64))
uut4(.address(32'd1),
.rd_wr(1'b0),
.cs(1'b0),
.data(data)
);
my_const #(.DEPTH(128))
uut5(.address(32'd1),
.rd_wr(1'b0),
.cs(1'b0),
.data(data)
);
endmodule

