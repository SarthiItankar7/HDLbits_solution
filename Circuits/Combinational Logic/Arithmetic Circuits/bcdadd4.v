module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire AC0,AC1,AC2;
    
    bcd_fadd A0 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(AC0));
    bcd_fadd A1 (.a(a[7:4]), .b(b[7:4]), .cin(AC0), .sum(sum[7:4]), .cout(AC1));
    bcd_fadd A2 (.a(a[11:8]), .b(b[11:8]), .cin(AC1), .sum(sum[11:8]), .cout(AC2));
    bcd_fadd A3 (.a(a[15:12]), .b(b[15:12]), .cin(AC2), .sum(sum[15:12]), .cout(cout));

endmodule
