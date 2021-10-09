`timescale 1ns/1ps

module riscv (
    input clk,
    input reset,
    output [31:0] PC,
    output [31:0] ins
);
    wire [31:0] Instruction;
    wire [31:0] ALU_dataA;
    wire [31:0] ALU_dataB;
    wire [31:0] write_dataM;
    wire [31:0] write_dataPC4;
    wire [31:0] ALU_OUT;
    wire zero;
    wire [31:0] access;

    wire PCSrc;
    wire jalr;
    wire RegWrite;
    wire write_PC4;
    wire ALUSrc;
    wire shift_i;
    wire [3:0] ALU_OP;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;

    assign ins = Instruction;
    assign write_dataPC4 = PC + 32'd4;

    control c0 (
        .Instruction(Instruction),
        .zero(zero),
        .signed_bit(ALU_OUT[31]),
        .PCSrc(PCSrc),
        .jalr(jalr),
        .RegWrite(RegWrite),
        .write_PC4(write_PC4),
        .ALUSrc(ALUSrc),
        .shift_i(shift_i),
        .ALU_OP(ALU_OP),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg)
    );

    Instruction_Fetch u0 (
        .clk(clk),
        .reset(reset),
        .PCSrc(PCSrc), // #
        .jalr(jalr), // #
        .jalr_address(ALU_OUT),
        .PC(PC),
        .Instruction(Instruction)
    );

    Instruction_Decode u1 (
        .clk(clk),
        .reset(reset),
        .Instruction(Instruction),
        .write_dataR(access),
        .write_dataPC4(write_dataPC4),
        .RegWrite(RegWrite), // #
        .ALUSrc(ALUSrc), // #
        .shift_i(shift_i), // #
        .write_PC4(write_PC4), // #
        .ALU_dataA(ALU_dataA),
        .ALU_dataB(ALU_dataB),
        .write_dataM(write_dataM)
    );

    Instruction_Excute u2 (
        .data_A(ALU_dataA),
        .data_B(ALU_dataB),
        .ALU_OP(ALU_OP), // #
        .ALU_OUT(ALU_OUT),
        .zero(zero)
    );

    Memory_Access u3 (
        .clk(clk),
        .MemtoReg(MemtoReg), // #
        .Mem_address(ALU_OUT),
        .write_dataM(write_dataM),
        .MemWrite(MemWrite), // #
        .MemRead(MemRead), // #
        .access(access)
    );

endmodule