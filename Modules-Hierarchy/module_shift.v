module top_module ( input clk, input d, output q );
	
    wire t0,t1;
    
    my_dff d0( .clk(clk), .d(d), .q(t0) );
    my_dff d1( .clk(clk), .d(t0), .q(t1) );
    my_dff d2( .clk(clk), .d(t1), .q(q) );
    
endmodule
