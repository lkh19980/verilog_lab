`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 09:36:27
// Design Name: 
// Module Name: my_s2p
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


module my_s2p(
    input RST,
    input CLK,
    input DIN,
    input  SoF,
    output reg [7:0] Dout
    );
    
    reg [3:0] bit_count;
    
    initial
    begin
        bit_count = 4'b0;
        Dout = 7'b0;
    end
    
    always @(posedge CLK)
    begin
        if(RST)begin
            bit_count = 4'd0;
            Dout = 7'b0;
        end
    end
    
    always @(posedge CLK) 
    begin
        if(SoF)
        begin
            if (bit_count == 0) begin
                Dout[bit_count] = DIN;
                bit_count = bit_count +1;
            end
        end else
        if (bit_count>0) begin
            Dout[bit_count] = DIN;
            bit_count = bit_count +1;
        end 
        if (bit_count>7)
            bit_count = 0;

    end
/*
    always @(posedge CLK)
    begin
        Dout[bit_count] = DIN;
        bit_count = bit_count +1;
    end
*/
endmodule

module my_p2s(
    input RST,
    input CLK,
    input Start,
    input [7:0] Din,
    output reg Dout,
    output reg SoF
    );
    
    reg [7:0] data;
    reg [3:0] bit_count;
    
    initial
    begin
        bit_count = 4'd15;
    end
    
    always @(posedge CLK)
    begin
        if(RST)begin
            bit_count = 4'b0000;
        end
    end
    
    always @(posedge CLK) 
    begin
        if(Start == 1)
        begin
            data[7:0] = Din[7:0];
            bit_count = 4'b0;
        end
    
    
        if (bit_count < 15)
        begin
            SoF = 0;
            if(bit_count == 0)
                SoF = 1;
            Dout = data[bit_count];
            bit_count = bit_count + 1;
            if (bit_count == 8)
                bit_count = 15; 
        end
    end
endmodule