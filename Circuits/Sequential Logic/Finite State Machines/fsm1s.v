// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg present_state, next_state;
    parameter A=1'b0, B=1'b1;

    always @(posedge clk) begin
        if (reset) begin  
            present_state = B;
        end 
        else begin
            case (present_state)
                A: next_state = in? A: B;
                B: next_state = in? B: A;
            endcase

            // State flip-flops
            present_state = next_state;   
		end
        case (present_state)
			A: out = A;
            B: out = B;
		endcase
        
    end

endmodule
