module top_module (input x, input y, output z);

    wire t0,t1,t2,t3,t4,t5;
    
    A IA1 ( .x(x), .y(y), .z(t0) );
    A IA2 ( .x(x), .y(y), .z(t2) );
    B IB1 ( .x(x), .y(y), .z(t1) );
    B IB2 ( .x(x), .y(y), .z(t3) );
    
    assign t4 = t0 | t1;
    assign t5 = t2 & t3;
    assign z = t4 ^ t5;
    
endmodule

module A (input x, input y, output z);
    
    assign z = ( x ^ y ) & x;
    
endmodule
        
module B (input x, input y, output z);
    
    assign z = ~( x ^ y );
    
endmodule
