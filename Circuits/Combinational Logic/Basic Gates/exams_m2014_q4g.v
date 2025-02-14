module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    wire t;
    
    assign t = ~( in1 ^ in2 );
    assign out = in3 ^ t;

endmodule
