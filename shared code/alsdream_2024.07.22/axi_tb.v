`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Copyright (c) 2024 WeDu Solution Co., Ltd.
// This work may not be copied, modified, re-published, uploaded, executed, or
// distributed in any way, in any medium, whether in whole or in part, without
// prior written permission from WeDu Solution Co., Ltd.
//------------------------------------------------------------------------------
// Title   : AXI SIM
//------------------------------------------------------------------------------
// Project    : AXI
// File       : axi_sim.v
// Author     : lebits 
// Created    : March 25, 2023
//------------------------------------------------------------------------------
// Description : 
//------------------------------------------------------------------------------
// $Revision: 0.001 $
//------------------------------------------------------------------------------


module axi_sim ();

//***********************************************
//    Parameter
//***********************************************
parameter CLK_PERIOD = 10.0;
parameter dly       =1;

//***********************************************
//    Signal 
//***********************************************

reg    rstn;
reg     clk;            // 125Mhz

reg	    [31:0]		axi_awaddr, axi_wdata;
wire	[2:0]		axi_awprot;
reg     			axi_awvalid;
wire                axi_awready;
wire	[3:0]		axi_wstrb;
reg 				axi_wvalid;
wire                axi_wready;
wire	[1:0]		axi_bresp;
wire				axi_bvalid;
reg                 axi_bready;

reg     [31:0]		axi_araddr;
wire    [31:0]      axi_rdata;
wire	[2:0]		axi_arprot;
reg 				axi_arvalid;
wire                axi_arready;
wire	[1:0]		axi_rresp;
wire				axi_rvalid;
reg                 axi_rready;

//***********************************************
//    UUT instantiation
//***********************************************
assign axi_wstrb = 4'hf;
//----------------------------
//    AXI 
//----------------------------
axi_slave_S_AXI uut (

    .S_AXI_ACLK             (clk), //clock
    .S_AXI_ARESETN          (rstn),//Address reset negative
    // axi read chanel
    .S_AXI_ARADDR           (axi_araddr),//address read 
    .S_AXI_ARREADY          (axi_arready),//addr ready
    .S_AXI_ARVALID          (axi_arvalid),//addr valid
    .S_AXI_ARPROT           (axi_arprot), //addr prot
    .S_AXI_RDATA            (axi_rdata), // read data
    .S_AXI_RREADY           (axi_rready), // read ready
    .S_AXI_RVALID           (axi_rvalid), // read valid
    .S_AXI_RRESP            (axi_rresp), //read response
    // axi write channel
    .S_AXI_AWADDR           (axi_awaddr), //addr write
    .S_AXI_AWREADY          (axi_awready), // addr write ready
    .S_AXI_AWVALID          (axi_awvalid),//addr write valid
    .S_AXI_AWPROT           (axi_awprot),//addr write prot
    .S_AXI_WDATA            (axi_wdata), //write data
    .S_AXI_WREADY           (axi_wready),//write ready
    .S_AXI_WVALID           (axi_wvalid),//write valid
    .S_AXI_WSTRB            (axi_wstrb),//write strb
    .S_AXI_BRESP            (axi_bresp),//write response
    .S_AXI_BREADY           (axi_bready),//write resp ready
    .S_AXI_BVALID           (axi_bvalid),//write respvalid
    //user port to SPI
    .ncs                    (ncs)
    );
spi_top spi_0(
    //default system input
    .RST(~rstn),//input
    .CLK(clk),//input
    //custom port
    .FULL(full),//output
    .WR(wen),//input
    .DIN(din),//8bit input
    .EMPTY(empty),//output
    .RD(ren),//input
    .DOUT(dout),//8bit,output
    .ncs(ncs)//output
//    output      sclk,
//    output      mosi,
//    output      miso
    );


//***********************************************
//    Stimulus
//***********************************************
//----------------------------
//    Clock/Reset
//----------------------------
initial begin
	rstn = 1'b0;
	repeat (5)  @(posedge clk);
	rstn = 1'b1;
	$display("[%t] Reset Released", $realtime);
end	

// 100Mhz
initial clk = 1'b0;
always #(CLK_PERIOD/2) clk = ~clk;

//----------------------------
//    Main Simulation Sequence
//----------------------------
integer i;
reg [4:0] cnt;

initial begin
    cnt = 4'd0;  
    wait (rstn == 1'b1);
    repeat (5) @(posedge clk);
    for(i=0; i < 6; i = i+1) begin
        TSK_AXI_WRITE(cnt, cnt/4);
        cnt = cnt+ 4;
    end       // for
    cnt = 4'd0;    
    repeat (10) @(posedge clk);  
    for(i=0; i < 6; i = i+1) begin
        TSK_AXI_READ(cnt);
        cnt = cnt + 4;
    end
    #(CLK_PERIOD*30);
    $finish;        
end  


/************************************************************
Task : TSK_AXI_READ
Inputs : none
Outputs : none
Description : Read AXI data
*************************************************************/
task TSK_AXI_READ(input [31:0] addr);
  begin
        axi_araddr = 32'd0;
        axi_arvalid = 1'b0;
        @(posedge clk);
        #(dly);
	    axi_arvalid = 1'b1;
	    axi_araddr = addr;
        wait (axi_arready)
        @(posedge clk)
        #(dly);
        axi_arvalid = 1'b0;
        @(posedge clk)
	    #(dly)
        axi_rready = 1'b1;
        wait (axi_rvalid);
        @(posedge clk)
	    #(dly)
        axi_rready = 1'b0;
	    $display("[INFO] AXI Read %h", axi_rdata);
end
endtask // TSK_AXI_READ
/************************************************************
Task : TSK_AXI_WRITE
Inputs : none
Outputs : none
Description : Write AXI data
*************************************************************/
task TSK_AXI_WRITE(input [31:0] addr, data);
  begin
        axi_awvalid = 1'b0;
        axi_awaddr = 32'd0;
        axi_wdata = 32'd0;
        axi_wvalid = 1'b0;
        axi_bready = 1'b0;
        @(posedge clk);
        #(dly);
	    axi_awvalid = 1'b1;
	    axi_awaddr = addr;
	    axi_wdata = data;//32bit -> 0*16 + 8(data) + 8(addr)
        wait (axi_awready);
        @(posedge clk);
        #(dly);
        axi_awvalid = 1'b0;
        axi_wvalid = 1'b1;
        wait (axi_wready);
        @(posedge clk);
        #(dly);
        axi_wvalid = 1'b0;
        axi_bready = 1'b1;
        wait (axi_bvalid);
        axi_bready = 1'b0;
    $display("[INFO] AXI Write addr: %h, data: %h",addr, data);
end
endtask // TSK_TX_MEMORY_WRITE_32

endmodule