module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] ac;
    
    bcd_fadd adder0( .a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(ac[0]) );
    
    generate 
        
        genvar i;
        
        for (i=4; i<400; i=i+4)
            begin :Adder_BCD
               
                bcd_fadd adder( .a(a[i+3:i]), .b(b[i+3:i]),  .sum(sum[i+3:i]), .cin(ac[(i/4)-1]), .cout(ac[i/4]) );
                
            end
        
    endgenerate

	assign cout = ac[99];

endmodule
