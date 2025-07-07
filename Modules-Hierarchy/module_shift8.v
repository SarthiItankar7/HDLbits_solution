module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    
    wire [7:0] t0,t1,t2;
    
    // shift register
    my_dff8 d0( .clk(clk), .d(d), .q(t0) );
    my_dff8 d1( .clk(clk), .d(t0), .q(t1) );
    my_dff8 d2( .clk(clk), .d(t1), .q(t2) );
    
    //mux
    always @(*)
        begin
           
            if (sel == 2'b00) q = d;
            else if (sel == 2'b01) q = t0;
            else if (sel == 2'b10) q = t1;
            else q = t2;
            
        end

endmodule
