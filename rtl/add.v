`timescale 1ns/1ps

module add 
#(parameter N = 32)(
    input [N-1:0] a, b,
    //input sw,
    output[N-1:0] sum
    //output cout,
    //output overflow
);
    wire [N-1:0] G, P;
    wire [N:0] c;
    wire [N-1:0] b_xor;
    wire sw = 0;
    //assign c[0] = sw;

    genvar i;
    generate
        for(i=0; i<N; i=i+1) begin
            assign b_xor[i] = sw ^ b[i];
            assign G[i] = a[i] & b_xor[i];
            assign P[i] = a[i] ^ b_xor[i];
            //carry
            assign c[0] = sw;
            assign c[i+1] = G[i] | P[i] & c[i];
            //assign cout = c[N];
            //sum
            assign sum[i] = P[i] ^ c[i];
        end
    endgenerate
    //assign overflow = c[N] ^ c[N-1];
endmodule