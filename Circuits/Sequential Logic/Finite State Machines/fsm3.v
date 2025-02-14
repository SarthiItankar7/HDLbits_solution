module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state,nxt_state;

    // State transition logic
    always @(state,in) begin
      case (state)
        A: nxt_state = in?B:A;
        B: nxt_state = in?B:C;
        C: nxt_state = in?D:A;
        D: nxt_state = in?B:C;
        default: nxt_state = A;
      endcase
    end

    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
      if (areset) state <= A;
      else state <= nxt_state;
    end

    // Output logic
    assign out = &state;

endmodule
