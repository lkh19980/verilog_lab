`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/26 12:31:56
// Design Name: 
// Module Name: axi_write_tb
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


module axi_write_tb();
parameter CLK_PD = 10.0;
reg rst, clk;
reg start;
reg [4:0] addr;
reg [7:0] data;

wire [4:0] awaddr;
wire [7:0] wdata;
wire awvalid, awready, wvalid, wready, bvalid, bready, bresp;
wire error;

axi_write_master mst_0 (
    .RST (rst),
    .CLK (clk),
    .START (start),
    .ADDR (addr),
    .DATA (data),
    .AWADDR (awaddr),
    .AWVALID (awvalid),
    .AWREADY (awready),
    .WDATA (wdata),
    .WVALID (wvalid),
    .WREADY (wready),
    .BRESP (bresp),
    .BVALID (bvalid),
    .BREADY (bready),
    .ERROR (error)
    );
axi_write_slave slv_0 (
    .RST (rst),
    .CLK (clk),
    .AWADDR (awaddr),
    .AWVALID (awvalid),
    .AWREADY (awready),
    .WDATA (wdata),
    .WVALID (wvalid),
    .WREADY (wready),
    .BRESP (bresp),
    .BVALID (bvalid),
    .BREADY (bready)
    );
//RESET, CLK gen
initial begin
    rst = 1'b1;
    #(CLK_PD * 10);
    rst = 1'b0;
end

initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;
//start, addr, data gen
integer i;

initial begin
    start = 1'b0;
    addr = 5'd0;
    data = 8'd0;
    wait (rst == 1'b0);
    repeat (5) @(posedge clk);
    
    for(i= 0; i< 32; i= i+1) begin
        start = 1'b1;
        wait(bvalid);
        start = 1'b0;
        #(CLK_PD*3);
        addr = addr + 1;
        data = data + 1;
    end
    #(CLK_PD*20);
    $finish;
end
endmodule
