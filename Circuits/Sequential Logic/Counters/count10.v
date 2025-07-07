module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q);

    initial q <= 4'd0;
    always @(posedge clk)
        begin
            if (reset) q <= 4'd0;
            else 
                begin
                    q <= q + 1'b1;
                    if (q >= 9) q <= 4'd0;
                end
        end
endmodule
