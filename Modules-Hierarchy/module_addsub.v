module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire ac0;
    reg [31:0] temp_b;
    
    //xor gate as a 2:1 mux connected to an iverter
    always @(*)
        begin
            
            if (sub == 1'b0) temp_b = b;
            else temp_b = ~b;
            
        end
    
    //adder-subtracter
    add16 AS0 ( .a(a[15:0]), .b(temp_b[15:0]), .cin(sub), .sum(sum[15:0]), .cout(ac0) );
    add16 AS1 ( .a(a[31:16]), .b(temp_b[31:16]), .cin(ac0), .sum(sum[31:16]) );

endmodule
