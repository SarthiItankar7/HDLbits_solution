module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=1'b0, B=1'b1; 
    reg state, next_state;

    always @(in or state) begin    // This is a combinational always block
        // State transition logic
        case(state)
            A: if (in == 1'b1) next_state = A; else next_state = B;
            B: if (in == 1'b1) next_state = B; else next_state = A;
            default: next_state = B;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset) state <= B;
        else state <= next_state;
    end

    // Output logic
    assign out = (state == A)? 1'b0: 1'b1;

endmodule