module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    always @(*)
        begin
            out = sel?b:a;        
        end
    
endmodule
