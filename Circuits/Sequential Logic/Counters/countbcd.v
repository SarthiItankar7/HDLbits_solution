module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    always @(posedge clk)
        begin
            if (reset) q <= 16'h0000;
            else
                begin
                    q <= q + 1'b1;
                    if (q[3:0] >=9 )
                        begin
                            q[3:0] <= 4'h0;
                            q[7:4] <= q[7:4] + 1'b1;
                        end
                    if (q[7:0] == 8'h99)
                        begin
                            q[7:4] <= 4'h0;
                            q[11:8] <= q[11:8] + 1'b1;
                        end
                    if (q[11:0] == 12'h999)
                        begin
                            q[11:8] <= 4'h0;
                            q[15:12] <= q[15:12] + 1'b1;
                        end
                    if (q == 16'h9999)
                        begin
                            q <= 16'h0000;
                        end
                end
        end
    
    assign ena = {(q[11:0] == 12'h999),(q[7:0] == 8'h99),(q[3:0] == 4'h9)};
endmodule

