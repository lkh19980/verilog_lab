`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/25 14:52:13
// Design Name: 
// Module Name: my_axi_master
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


module my_axi_master(
    input RST,
    input CLK,
    
    input AXI_READY,
    output ADDR,
    output AXI_AVALID,
    
    input DaReady,
    output Data,
    output DaValid
    );
    
always @(cstate, START_AXI_AREADY, AXI_VALID)
begin
    AXI_AVALID = 1'b0;
    AXI_READY = 1'b0;
    
    
    case (cstate)
        sidle : begin
            if(START) begin
                nstate = saddr;
            end else
                nstate = sidle;
        end
        saddr : begin
            AXI_AVALID = 1'b1;
            if(AXI_AREADY)
                nstate = sdata;
            else
                nstate = saddr;
        end
        sdata : begin
            AXI_READY = 1'b1;
            if(AXI_VALID)
                nstate = sidle;
            else
                nstate = sdata;
        end
        default : nstate = sidle;
    endcase
end
endmodule

    
endmodule
