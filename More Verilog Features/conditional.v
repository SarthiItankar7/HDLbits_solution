module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] t0,t1;
    
    assign t0 = (a<b)? a : b;
    assign t1 = (c<d)? c : d;
    assign min = (t0<t1)? t0 : t1;

endmodule
