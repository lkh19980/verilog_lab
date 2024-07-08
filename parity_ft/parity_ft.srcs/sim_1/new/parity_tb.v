module parity_tb();

parameter width = 8;

reg[width-1:0] data;
wire[width:0] dout;

//my_parity #(.width(8))
my_parity #(.width(width))
    uut (
    .d_word(data),
    .data_frame(dout)
    );

initial begin
    data = 32'd0;
    repeat(256)
    begin
        #10;
        $display(" data : %b  parity %b", data, dout[0]);
        data = data +1;
    end
end

initial begin
    #(10+256);
    $finish;
end

endmodule



/*
module parity_tb();
    reg cnt = 0;
    always 
    begin
        
    
    if(cnt<255)
    $finish
    end

endmodule
*/