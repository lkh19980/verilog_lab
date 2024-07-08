`timescale 1ns/1ps


module counter_tb();
prameter clk_period = 10;
reg CLK;

counter_count_prj uut(
    .CLK (CLK)
    .clk_out (clk_out)
    );

initial begin
RST = 1'b1;
#(clk_period*20);
RST=1'b0;
end

initial CLK = 1'b0;
always #(clk_period) CLK = ~CLK;

endmodule