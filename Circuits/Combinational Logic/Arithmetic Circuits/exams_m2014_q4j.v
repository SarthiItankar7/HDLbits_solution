module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	
    wire ac0,ac1,ac2;
    
    fa a0 (.a(x[0]), .b(y[0]), .cin(1'b0), .sum(sum[0]), .cout(ac0) );
    fa a1 (.a(x[1]), .b(y[1]), .cin(ac0), .sum(sum[1]), .cout(ac1) );
    fa a2 (.a(x[2]), .b(y[2]), .cin(ac1), .sum(sum[2]), .cout(ac2) );
    fa a3 (.a(x[3]), .b(y[3]), .cin(ac2), .sum(sum[3]), .cout(sum[4]) );
    
endmodule


module fa (
    input a,
    input b,
    input cin,

    output sum,
    output cout);
    
    assign {cout,sum} = a + b + cin;
    
endmodule