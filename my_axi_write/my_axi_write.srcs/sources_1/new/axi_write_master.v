`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/26 10:35:38
// Design Name: 
// Module Name: axi_write_master
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


module axi_write_master(
    input RST,
    input CLK,
    input START,
    input [4:0] ADDR,
    input [7:0] DATA,
    output [4:0] AWADDR,
    output reg AWVALID,
    input AWREADY,
    output [7:0] WDATA,
    output reg WVALID,
    input WREADY,
    input BRESP,
    input BVALID,
    output reg BREADY,
    output reg ERROR
    );
parameter [1:0] sidle = 2'b00,
                saddr = 2'b01,
                sdata = 2'b10,
                sresp = 2'b11;
reg [1:0] cstate, nstate;

assign AWADDR = ADDR;
assign WDATA = DATA;

always @(posedge CLK)
    if(RST)
        cstate <= sidle;
    else
        cstate <= nstate;

always @(cstate, START, AWREADY, WREADY, BVALID)
begin
    AWVALID = 1'b0;
    WVALID = 1'b0;
    BREADY = 1'b0;
    case(cstate)
        sidle : begin
            if(START)
                nstate = saddr;
            else
                nstate = sidle;
        end
        saddr : begin
            AWVALID = 1'b1;
            nstate = sdata;
        end
        sdata : begin
            WVALID = 1'b1;
            if(WREADY)
                nstate = sresp;
            else
                nstate = sdata;
        end
        sresp : begin
            BREADY = 1'b1;
            if(BVALID) begin
                ERROR = ~BRESP;
                nstate = sidle;
            end else
                nstate = sresp;
        end
        default : nstate = sidle;
    endcase
end
endmodule