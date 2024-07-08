`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/27 09:51:45
// Design Name: 
// Module Name: spi_master
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


module spi_master(
    output reg nCS,
    output reg SCLK, //12.5MHz 1M to 50MHz
    output reg MOSI,
    input MISO,
    
    input CLK,
    input RST,
    input EMPTY,
    output reg RD,
    input [7:0] DIN,
    
    input FULL,
    output WR,
    output [7:0] DOUT
    );

parameter   idle = 3'b000,
            RxDIN = 3'b001,
            send = 3'b010,
            stop = 3'b011,
            receive = 3'b100;

reg [2:0] cstate,  nstate;
reg [15:0] tmpDIN =1'b0;
wire nSCLK= ~SCLK;

always @(posedge CLK)
    if(RST)
        cstate = idle;
    else
        cstate = nstate;

integer i = 0;
integer j= 0;//I want to know how long the integer takes memory. 
integer RW = 3'b0;
always @ (posedge CLK) begin
//always @ (posedge CLK, DIN) begin    
    
    case(cstate)
    idle : begin
        RD = 1'b1;
        if(DIN)begin
            tmpDIN[7:0] = DIN[7:0];
            nstate = RxDIN;
        end
        else
        //$display("not");
            nstate = idle;
    end
    RxDIN : begin
        //tmpDIN[7:0] = DIN[7:0];
        RD = 1'b0;
        if(tmpDIN[0])begin//READ 
            nstate = send;
            RW = 8;
            nCS = 1'b0;
        end
        else begin//Write
            //RD = 1'b1;
            //if(DIN) begin
                tmpDIN[15:8] = DIN[7:0];
                RD = 1'b0;
                nstate = send;
                RW = 16;
                nCS = 1'b0;
            //end
        //else
        //        nstate = RxDIN;
        end
    end
    send : begin
        if(nCS)begin
            nstate = stop;
            
        end
    end
    stop : begin
        nCS = 1'b1;
        SCLK=1'b0;
        j=0;
        
        nstate = idle;
    end
    receive : begin
        j = j +1;
        if(j >(5*8 + 8)) begin
            nCS = 1'b1;
            SCLK = 1'b0;
            j = 0;
        end
        nstate = idle;
    end
    endcase
end


//SCLK 1/10 clk

initial SCLK = 1'b0;
always @(posedge CLK) begin
if(!nCS) begin
    i= i+1;
    if(i==5) begin
        SCLK = ~SCLK;
        i = 0;
    end
end
end

//
always @(posedge SCLK) begin
if(cstate == send) begin
    //SCLK = inSCLK;
    MOSI = tmpDIN[j];
    j=j+1;
    if(j > RW) begin 
        if(RW ==8)
            nstate = receive;
        else
        nstate = stop;
    end
    end
end

endmodule
