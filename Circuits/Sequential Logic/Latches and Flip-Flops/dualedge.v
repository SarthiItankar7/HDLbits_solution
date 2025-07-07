module top_module (
    input clk,
    input d,
    output q
);
    reg qn,qp;
    always @(posedge clk) qp <= d^qn;
    always @(negedge clk) qn <= d^qp;
    assign q = qp^qn; 
endmodule
