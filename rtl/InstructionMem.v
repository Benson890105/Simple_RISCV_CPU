`timescale 1ns/1ps

module InstructionMem (
    input [31:0] Instruction_address,
    output [31:0] Instruction
);
    reg [31:0] Mem [0:1023];

    assign Instruction = Mem[Instruction_address / 32'h4];

    initial begin
        $readmemb("data.txt", Mem);
    end
endmodule