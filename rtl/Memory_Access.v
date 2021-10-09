`timescale 1ns/1ps

module Memory_Access (
    input clk,
    input MemtoReg,
    input [31:0] Mem_address,
    input [31:0] write_dataM,
    input MemWrite, 
    input MemRead,
    output [31:0] access
);
    wire [31:0] Read_data;

    memory u0 (
        .clk(clk),
        .address(Mem_address),
        .write_data(write_dataM),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Read_data(Read_data)
    );

    assign access = (MemtoReg) ? Read_data : Mem_address;
endmodule