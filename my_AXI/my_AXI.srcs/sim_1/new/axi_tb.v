`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/25 15:08:44
// Design Name: 
// Module Name: axi_tb
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


module axi_tb();

axi_slave axi_slave0(
    .Addr(),
    .AdValid(),
    .AdReady(),
    
    .Data(),
    .DaValid(),
    .DaReady(),
    
    .clk(),
    .rst()
    
    //output CLK,
    //output ADDR,
    //input RDATA
    );
my_axi_master 
initial begin
    rst = 1'b1;
    #(CLK_PD * 10);
    rst = 1'b0;
end

initial clk = 1'b0;
always #(CLK_PD/2) clk = ~clk;

integer i;


initial begin
    start = 1'b0;
    addr = 5'd0;
    #(CLK_PD/2);
    wait (rst == 1'b0);
    // repeat(2) #(posedge clk);
    #(CLK_PD*10);
    for (i = 0; i<32; i= i+1)
    begin
        start = 1'b1;
        wait(axi_aready == 1'b1);
        start = 1'b0;
        wait(axi_valid);
        addr = addr + 1;
        #(CLK_PD*3);
    end
    #100;
    $finish;
end
    
endmodule
