`timescale 1ns/1ps

module control (
    input [31:0] Instruction,
    input zero,
    input signed_bit,
    output reg PCSrc,
    output jalr,
    output reg RegWrite,
    output write_PC4,
    output reg ALUSrc,
    output reg shift_i,
    output reg [3:0] ALU_OP,
    output MemRead,
    output MemWrite,
    output MemtoReg
);
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;

    assign opcode = Instruction[6:0];
    assign funct3 = Instruction[14:12];
    assign funct7 = Instruction[31:25];

    //PCSrc Signal
    always @(opcode or funct3 or zero or signed_bit) begin
        case (opcode)
           7'b1101111 : PCSrc = 1; // jal
           7'b1100111 : PCSrc = 1; // jalr
           7'b1100011 : 
                case ({funct3, zero, signed_bit})
                   5'b000_1_x : PCSrc = 1; // beq
                   5'b001_0_x : PCSrc = 1; // bne
                   5'b100_0_1 : PCSrc = 1; // blt
                   5'b101_x_0 : PCSrc = 1; // bge
                    default: PCSrc = 0;
                endcase
            default: PCSrc = 0;
        endcase
    end

    // jalr Signal
    assign jalr = (opcode == 7'b1100111) ? 1 : 0;

    //RegWrite Signal
    always @(opcode) begin
        case (opcode)
           7'b0110011 : RegWrite = 1; // R-type
           7'b0010011 : RegWrite = 1; // addi、xori、ori、andi、slli、srli
           7'b0000011 : RegWrite = 1; // lw
            default: RegWrite = 0;
        endcase
    end

    //write_PC4 Signal
    assign write_PC4 = (opcode == 7'b1101111) ? 1 :
                        (opcode == 7'b1100111) ? 1 : 0;
    
    //ALUSrc Signal
    always @(opcode) begin
        case (opcode)
           7'b0010011 : ALUSrc = 1; // addi、xori、ori、andi、slli、srli
           7'b0000011 : ALUSrc = 1; //lw
           7'b0100011 : ALUSrc = 1; // sw
            default: ALUSrc = 0;
        endcase    
    end

    //shift_i Signal
    always @(opcode or funct3 or funct7) begin
        case ({funct7, funct3, opcode})
           17'b0000000_001_0010011 : shift_i = 1; // slli
           17'b0000000_101_0010011 : shift_i = 1; // srli
            default: shift_i = 0;
        endcase    
    end

    //ALU_OP Signal
    always @(opcode or funct3 or funct7) begin
        case (opcode)
           7'b0110011 : 
                case ({funct7, funct3})
                   10'b0000000_000 : ALU_OP = 4'b0101; // add
                   10'b0100000_000 : ALU_OP = 4'b0110; // sub
                   10'b0000000_111 : ALU_OP = 4'b0000; // and
                   10'b0000000_110 : ALU_OP = 4'b0001; // or
                   10'b0000000_100 : ALU_OP = 4'b0010; // xor
                   10'b0000000_001 : ALU_OP = 4'b0011; // sll
                   10'b0000000_101 : ALU_OP = 4'b0100; // srl
                    default: ALU_OP = 4'bxxxx;
                endcase
           7'b0010011 :
                case ({funct3})
                   3'b000 : ALU_OP = 4'b0101; // addi
                   3'b100 : ALU_OP = 4'b0010; // xori
                   3'b110 : ALU_OP = 4'b0001; // ori
                   3'b111 : ALU_OP = 4'b0000; // andi
                   3'b001 : ALU_OP = 4'b0011; // slli
                   3'b101 : ALU_OP = 4'b0100; // srli
                    default: ALU_OP = 4'bxxxx;
                endcase
           7'b0000011 : ALU_OP = 4'b0101; // lw
           7'b0100011 : ALU_OP = 4'b0101; // sw
           7'b1100111 : ALU_OP = 4'b0101; // jalr
           7'b1100011 : ALU_OP = 4'b0110; // beq、bne、blt、bge
            default: ALU_OP = 4'bxxxx;
        endcase
    end

    //MemRead Signal "lw"
    assign MemRead = (opcode == 7'b0000011) ? 1 : 0;

    //MemWrite Signal "sw"
    assign MemWrite = (opcode == 7'b0100011) ? 1 : 0;

    //MemtoReg Signal "lw"
    assign MemtoReg = (opcode == 7'b0000011) ? 1 : 0;

endmodule