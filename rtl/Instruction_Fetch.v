`timescale 1ns/1ps

module Instruction_Fetch (
    input clk,
    input reset,
    input PCSrc,
    input jalr,
    input [31:0] jalr_address,
    //input [31:0] branch_jump_address,
    output [31:0] PC,
    output [31:0] Instruction
);
    //wire [31:0] Instruction_address;
    wire [31:0] branch_jump_address;
    wire [31:0] PC_offset;
    wire [6:0] opcode = Instruction[6:0];
    wire [31:0] imm_B = {{20{Instruction[31]}}, Instruction[7], Instruction[30:25], Instruction[11:8], 1'b0};
    wire [31:0] imm_J = {{12{Instruction[31]}}, Instruction[19:12], Instruction[20], Instruction[30:21], 1'b0};

    //assign PC = Instruction_address;
    
    PC u0 (
        .clk(clk),
        .reset(reset),
        .PCSrc(PCSrc),
        .branch_jump_address(branch_jump_address),
        .Instruction_address(PC)
    );

    InstructionMem u1 (
        .Instruction_address(PC),
        .Instruction(Instruction)
    );

    assign PC_offset = (opcode == 7'b1101111) ? imm_J : imm_B;
    assign branch_jump_address = (jalr) ? jalr_address : (PC + PC_offset);
endmodule