`timescale 1ns/1ps

module register_file (
    input clk,
    input reset,
    input [4:0] read_addressA,
    input [4:0] read_addressB,
    input [4:0] write_address,
    input [31:0] write_data,
    input RegWrite,
    output [31:0] read_dataA,
    output [31:0] read_dataB
);
    reg [31:0] regfile [0:31];
    integer i;

    assign read_dataA = (read_addressA == 0) ? 32'd0 : regfile[read_addressA];
    assign read_dataB = (read_addressB == 0) ? 32'd0 : regfile[read_addressB];

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(i=0; i<32; i=i+1)begin
                regfile [i] <= 32'd0;
            end
        end
        else if(RegWrite)
            regfile[write_address] <= write_data;
        else
            regfile[write_address] <= regfile[write_address];
    end

endmodule