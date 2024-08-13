`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/13 16:03:00
// Design Name: 
// Module Name: bram_inf
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


module bram_inf(
    input RST,
    input CLK,
    input BRAM_START,
    
    output reg READY,
    output reg [31:0] DOUT,
    output reg [31:0] ADDR,
    output reg [3:0] WE
    );
reg [1:0] state = 1'b0;
reg [7:0] cnt = 1'b0;
parameter   idle = 2'b00,
            start = 2'b01;
always @(posedge CLK) begin
if(RST) begin
    state <= idle;
    DOUT <= 32'b0;
    ADDR <= 32'b0;
    WE <= 4'b0;
    READY <= 1'b1;
    end
else begin
    case(state)
    idle : begin
        if(BRAM_START) begin
            state <= start;
            WE <= 4'b1111;
            READY <= 1'b0;
            cnt<= 1'b0;
            end
        else begin
            state <= idle;
            WE <= 4'b0000;
            READY <= 1'b1;
            cnt<= 1'b0;
            end
    end
    start : begin
        ADDR<={cnt,2'b00};
        DOUT<={cnt,2'b00};
        cnt <= cnt +1;
        if(cnt == 99)
            state <= idle;         
       
    end

 
    endcase


    

end

end



endmodule
