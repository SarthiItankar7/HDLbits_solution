module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] q0,q1,q2;
    
    bcdcount counter0 (clk, reset, c_enable[0], q0);
    bcdcount counter1 (clk, reset, c_enable[1], q1);
    bcdcount counter2 (clk, reset, c_enable[2], q2);
    
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (q0 == 4'd9)?1'b1:1'b0;
    assign c_enable[2] = ({q1,q0} == 8'h99)?1'b1:1'b0;
               
    assign OneHertz = ({q2,q1,q0} == 12'h999);
    
endmodule
