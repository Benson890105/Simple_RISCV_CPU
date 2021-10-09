`timescale 1ns/1ps

module Instruction_Decode (
    input clk,
    input reset,
    input [31:0] Instruction,
    input [31:0] write_dataR,
    input [31:0] write_dataPC4,
    input RegWrite,
    input ALUSrc,
    input shift_i,
    input write_PC4,
    output [31:0] ALU_dataA,
    output [31:0] ALU_dataB,
    output [31:0] write_dataM
);
    wire [4:0] rs1 = Instruction[19:15];
    wire [4:0] rs2 = Instruction[24:20];
    wire [4:0] rd = Instruction[11:7];
    wire [31:0] write_data;
    wire [31:0] read_dataA;
    wire [31:0] read_dataB;
    wire [31:0] read_dataB1;
    wire [31:0] imm_out;

    assign write_data = (write_PC4) ? write_dataPC4 : write_dataR;

    Imm_Gen u0 (.Instruction(Instruction), .imm_out(imm_out));

    register_file u1 (
        .clk(clk),
        .reset(reset),
        .read_addressA(rs1),
        .read_addressB(rs2),
        .write_address(rd),
        .write_data(write_data),
        .RegWrite(RegWrite),
        .read_dataA(read_dataA),
        .read_dataB(read_dataB)
    );

    assign write_dataM = read_dataB;
    assign ALU_dataA = read_dataA;

    assign read_dataB1 = (ALUSrc) ? imm_out : read_dataB;
    assign ALU_dataB = (shift_i) ? {27'd0, rs2} : read_dataB1;
endmodule