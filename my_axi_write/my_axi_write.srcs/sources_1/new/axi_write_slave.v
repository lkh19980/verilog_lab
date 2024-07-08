`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/26 09:42:17
// Design Name: 
// Module Name: axi_write_slave
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


module axi_write_slave(
    input [4:0] AWADDR,
    input AWVALID,
    output reg AWREADY,
    
    input [7:0] WDATA,
    input WVALID,
    output reg WREADY,
    
    input BREADY,
    output reg BVALID,
    output reg BRESP,
    
    output [4:0] Addr,
    output [7:0] data_in,
    output WEA,
    input [7:0] data_out,
    
    input CLK,
    input RST
    );
    
parameter [2:0] sidle = 3'b00,
                saw_chk = 3'b01,
                sdata = 3'b10,
                sw_chk = 3'b11,
                sresp = 3'b100;
reg [1:0] cstate, nstate;

ram32x8 ram0 (
  .clka(CLK),    // input wire clka
  .wea(WEA),      // input wire [0 : 0] wea
  .addra(Addr),  // input wire [4 : 0] addra
  .dina(data_in),    // input wire [7 : 0] dina
  .douta(data_out)  // output wire [7 : 0] douta
);

wire [4:0] addr;
wire [7:0] data;
wire wea;
//valid &REAdy

assign Addr = AWADDR;
assign data_in = WDATA;
assign wea = WVALID & WREADY;

always @(posedge CLK)
    if(RST)
        cstate <= sidle;
    else
        cstate <= nstate;
        
always @(cstate, AWVALID, AWREADY)
begin
    BVALID = 1'b0;
    AWREADY = 1'b0;
    WREADY = 1'b0;
    BRESP = 1'b0;
    case (cstate)
        sidle : begin
            if(AWVALID)
                nstate = saw_chk;
            else
                nstate = sidle;
        end
        saw_chk : begin
            AWREADY = 1'b1;
            nstate = sdata;
        end
        sdata : begin
            if(WVALID)
                nstate = sw_chk;
            else
                nstate = sdata;
        
        end
        sw_chk : begin
            WREADY = 1'b1;
            nstate = sresp;
        end
        sresp : begin
            BVALID = 1'b1;
            BRESP = 1'b1;
            if(BREADY)
                nstate = sidle;
            else
                nstate = sresp;
                
        end
        default : nstate = sidle;
    endcase
end

endmodule
