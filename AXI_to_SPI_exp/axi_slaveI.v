
`timescale 1 ns / 1 ps

	module myip_S_AXI #
	(
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 5
	)
	(
        input           FULL,       // from TX fifo
        output  [7:0]   DOUT,       // to TX fifo
        output reg      WEN,        // to TX fifo
                
        input           EMPTY,      // From RX fifo
        input   [7:0]   DIN,        // From RX fifo
        output   reg    REN,        // to RX fifo
        
		input wire  S_AXI_ACLK,
		input wire  S_AXI_ARESETN,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		input wire [2 : 0] S_AXI_AWPROT,
		input wire  S_AXI_AWVALID,
		output wire  S_AXI_AWREADY,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		input wire  S_AXI_WVALID,
		output wire  S_AXI_WREADY,
		output wire [1 : 0] S_AXI_BRESP,
		output wire  S_AXI_BVALID,
		input wire  S_AXI_BREADY,

		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		input wire [2 : 0] S_AXI_ARPROT,
		input wire  S_AXI_ARVALID,
		output wire  S_AXI_ARREADY,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		output wire [1 : 0] S_AXI_RRESP,
		output wire  S_AXI_RVALID,
		input wire  S_AXI_RREADY
	);

    wire        clk = S_AXI_ACLK;
    wire        rstn = S_AXI_ARESETN;

    reg        axi_awready, axi_wready;
    wire        axi_awvalid;
    reg         axi_bvalid;
    wire [1:0]   axi_bresp;
    wire        axi_wvalid;

    wire        axi_arvalid;
    reg        axi_arready, axi_rvalid;
    reg [7:0]  axi_wdata, axi_rdata;

assign  S_AXI_AWREADY = axi_awready;
assign  axi_wvalid = S_AXI_WVALID;
assign  S_AXI_WREADY = axi_wready;
assign  S_AXI_BVALID = axi_bvalid;
assign  S_AXI_BRESP = axi_bresp;

assign  axi_arvalid = S_AXI_ARVALID;
assign  S_AXI_ARREADY = axi_arready;
assign  S_AXI_RVALID = axi_rvalid;
assign  S_AXI_RDATA = {24'd0, axi_rdata};

assign axi_awvalid = S_AXI_AWVALID;
    
    //=====================================================    
  

//write channel 
always @(posedge clk)
begin
    if(rstn == 1'b0) begin
        axi_awready <= 1'b0;
        axi_wready <= 1'b0;
    end else begin
        axi_awready <= ~FULL;
        axi_wready <= ~FULL;
    end
end     //always                     

assign DOUT = axi_wdata;
always @(posedge clk)
begin
    if(rstn == 1'b0) begin
        axi_wdata <= 8'd0;
        WEN <= 1'b0;
    end else if(axi_awready && axi_awvalid) begin
        axi_wdata <= S_AXI_WDATA[7:0];
        WEN <= 1'b1;
    end else
        WEN <= 1'b0;        
end     // always        

// write channel axi_resp
assign axi_bresp = 2'b0;
   
always @(posedge clk)
begin
    if(rstn == 1'b0)
        axi_bvalid <= 1'b0;
     else begin
         if(axi_awvalid && axi_awready && ~axi_bvalid)
             axi_bvalid <= 1'b1;
         else 
             axi_bvalid <= 1'b0;
     end
end // always                        
                                
// axi read channel
always @(posedge clk)
begin
    if(rstn == 1'b0) begin
        axi_arready <= 1'b0;
        axi_rvalid <= 1'b0;
    end else begin
        axi_arready <= ~EMPTY;
        axi_rvalid <= ~EMPTY;
    end
end     // always

always @(posedge clk)
begin
    if(rstn == 1'b0)
        REN <= 1'b0;
    else if(axi_arready && axi_arvalid)
        REN <= 1'b1;
    else
        REN <= 1'b0;
end //always                                                              

always @(posedge clk)
begin
    if(rstn == 1'b0)
        axi_rdata <= 8'd0;
    else if(REN)
        axi_rdata <= DIN;
end //always                
    
	endmodule
