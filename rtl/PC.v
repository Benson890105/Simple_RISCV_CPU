`timescale 1ns/1ps

module PC (
    input clk,
    input reset,
    input PCSrc,
    input [31:0] branch_jump_address,
    output reg [31:0] Instruction_address
);
    always @(posedge clk or posedge reset) begin
        if(reset)
            Instruction_address <= 32'd0;
        else if(PCSrc)
            Instruction_address <= branch_jump_address;
        else
            Instruction_address <= Instruction_address + 32'd4;
    end
endmodule