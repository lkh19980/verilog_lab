`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/01 11:34:41
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
    
    //output ram_clk,
    //output reg WEN
    //output [7:0]DOUT,
    //input [7:0] DIN
    );
parameter   idle = 2'b0,
            RxDIN = 2'b1,
            ram = 2'b10,
            send = 2'b11;
reg WEN;
reg [15:0] tmpMOSI=1'b0;
reg [3:0] index=4'b0;
wire nSCLK = !SCLK;
reg [3:0] len = 0;
reg [1:0] cstate = 2'b1;//start RxDIN
reg [0:4] ADDR = 0;
wire [7:0] DOUT;
reg [0:7] DIN = 0;
blk_mem_gen_0 ram32x8 (
    .clka(nSCLK),    // input wire clka
    .wea(WEN),      // input wire [0 : 0] wea
    .addra(ADDR),  // input wire [4 : 0] addra
    .dina(DIN),    // input wire [7 : 0] dina
    .douta(DOUT)  // output wire [7 : 0] douta
);

always @(posedge SCLK) begin
    case(cstate)
    idle : begin
        WEN <= 1'b0;
        index <= 0;
        DIN <= 1'b0;
        ADDR <= 1'b0;
        tmpMOSI <= 16'b0;
        cstate <= RxDIN;
    end
    RxDIN : begin //Starting Point
        //if(!nCS)begin
            tmpMOSI[index] <= MOSI;
            if(tmpMOSI[0]) begin //Read
                len <= 7;//4bit max 7
            end
            else begin
                //tmpMOSI[index] = MOSI; //Write
                len <= 15;//4bit max 15
            end
            
            if(index == len) begin
                cstate <= ram;
                //WEN = 1'b1;
            end
            index <= index + 1;
        //end
    end
    ram: begin
        //nSCLK
    end
    send: begin
        
        MISO = DOUT[index];
        index = index +1;
        if(index == 8) begin
            cstate = idle;
        end
    end
    endcase
end


always @(nSCLK) begin
    if(cstate == ram) begin
        index = 1'b0;
        if(len == 7) begin//read
            WEN=1'b0;
            ADDR<= tmpMOSI[7:3];
            cstate = send;
        end
        else begin//write
            ADDR <= tmpMOSI[7:3];
            DIN <= tmpMOSI[15:8];
            WEN=1'b1;
            tmpMOSI = 16'b0;
            cstate = idle;
        end
        
    end
    
 
end
endmodule
