module top_module (
    input clk,
    input reset,
    output reg [3:0] q);
    initial q = 4'h1;
    always @(posedge clk)
        begin
            if (q >= 4'd10) q = 4'h0;
            q = q + 1'b1;
            if (reset) q = 4'h1;
        end
endmodule

