`timescale 1ns/1ps

module tb_riscv (
    
);
    reg clk;
    reg reset;
    wire [31:0] PC;
    wire [31:0] ins;

    riscv uut (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .ins(ins)
    );

    always #5 clk = ~clk;
    initial begin
        $dumpfile("riscv.vcd");
        $dumpvars(0, tb_riscv);
        $monitor("PC = 0x%h, Instruction = %b", PC, ins);
        clk = 0;
        reset = 0;

        #1 reset = 1;
        #1 reset = 0;

        #200 $finish;
    end
endmodule
