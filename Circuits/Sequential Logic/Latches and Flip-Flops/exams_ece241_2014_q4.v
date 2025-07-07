module top_module (
    input clk,
    input x,
    output z
); 
    reg [2:0]q,qb;
    initial 
        begin
           q <= 3'b000;
           qb <=3'b111;
        end
    always @(posedge clk)
        begin
            q[0] <= x ^ q[0];
            qb[0] <= ~(x ^ q[0]);
            
            q[1] <= x & qb[1];
            qb[1] <= ~(x & qb[1]);
            
            q[2] <= x | qb[2];
            qb[2] <= ~(x | qb[2]);
        end
    assign z = ~(|q);
endmodule
