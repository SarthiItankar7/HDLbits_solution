module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire ac0;
    wire [31:16] sum1,sum_one;
    
    add16 A0 ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(ac0) );
    add16 A1C0 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum1[31:16]) );
    add16 A1C1 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum_one[31:16]) );
    
    always @(*)
        begin
           
            if(ac0 == 1'b0) sum[31:16] = sum1[31:16];
            else sum[31:16] = sum_one[31:16];
            
        end
    
endmodule
