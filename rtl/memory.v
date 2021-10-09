`timescale 1ns/1ps

module memory (
    input clk,
    input [31:0] address,
    input [31:0] write_data,
    input MemWrite, MemRead,
    output [31:0] Read_data
);
    reg [7:0] Mem [0:1024]; // 1KB

    assign Read_data = (MemRead) ? {Mem[address + 3], Mem[address + 2], Mem[address + 1], Mem[address]} : 32'dz;

    always @(posedge clk) begin
        if(MemWrite) begin
            Mem[address] <=  write_data[7:0];
            Mem[address + 1] <= write_data[15:8];
            Mem[address + 2] <= write_data[23:16];
            Mem[address + 3] <= write_data[31:24];
        end else begin
            Mem[address] <=  Mem[address];
            Mem[address + 1] <= Mem[address + 1];
            Mem[address + 2] <= Mem[address + 2];
            Mem[address + 3] <= Mem[address + 3];
        end
    end
endmodule