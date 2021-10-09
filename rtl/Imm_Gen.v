`timescale 1ns/1ps

module Imm_Gen (
    input [31:0] Instruction,
    output [31:0] imm_out
);
    wire [31:0] imm_I;
    wire [31:0] imm_S;
    wire [6:0] opcode;
    assign opcode = Instruction[6:0];
    
    assign imm_I = {{21{Instruction[31]}}, Instruction[30:20]};
    assign imm_S = {{21{Instruction[31]}}, Instruction[30:25], Instruction[11:7]};
    

    assign imm_out = (opcode == 7'b0000011) ? imm_I : 
                        (opcode == 7'b0010011) ? imm_I : 
                        (opcode == 7'b0100011) ? imm_S : 32'd0;
    
endmodule