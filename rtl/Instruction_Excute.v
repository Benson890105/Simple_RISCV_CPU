`timescale 1ns/1ps

module Instruction_Excute (
    input [31:0] data_A,
    input [31:0] data_B,
    input [3:0] ALU_OP,
    output reg [31:0] ALU_OUT,
    output zero
);
    wire [31:0] add, sub, and_gate, or_gate, xor_gate, sll, srl;

    //Arithmetic operations
    add u0 (.a(data_A), .b(data_B), .sum(add)); // add
    sub u1 (.a(data_A), .b(data_B), .sum(sub)); // sub

    // Logic operations
    assign and_gate = data_A & data_B; // and
    assign or_gate = data_A | data_B; // or
    assign xor_gate = data_A ^ data_B; // xor
    assign sll = data_A << data_B; // shift left
    assign srl = data_A >> data_B; // shift right
    
    always @(add or sub or and_gate or or_gate or xor_gate or sll or srl or ALU_OP) begin
        case (ALU_OP)
           4'b0000 : ALU_OUT = and_gate; // and
           4'b0001 : ALU_OUT = or_gate; // or
           4'b0010 : ALU_OUT = xor_gate; // xor
           4'b0011 : ALU_OUT = sll; // shift lift logic
           4'b0100 : ALU_OUT = srl; // shift right logic
           4'b0101 : ALU_OUT = add; // add
           4'b0110 : ALU_OUT = sub; // sub
            default: ALU_OUT = 32'd0;
        endcase
    end

    assign zero = (ALU_OUT == 32'd0) ? 1 : 0;
endmodule