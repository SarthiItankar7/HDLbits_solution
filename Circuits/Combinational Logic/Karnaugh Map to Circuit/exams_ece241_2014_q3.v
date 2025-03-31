module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    reg [1:0]com;
    always
        begin
            com = {c,d};
            case(com) 
                0: mux_in = {1'b0,1'b1,1'b0,1'b0};
                1: mux_in = {1'b0,1'b0,1'b0,1'b1};
                2: mux_in = {1'b0,1'b1,1'b0,1'b1};
                3: mux_in = {1'b1,1'b0,1'b0,1'b1};
                default: mux_in = {1'b0,1'b0,1'b0,1'b0};
            endcase
        end

endmodule
