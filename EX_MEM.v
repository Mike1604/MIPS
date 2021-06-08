//  BUFFER 3

`timescale 1ns/1ns

module EX_MEM()
{
    input clk,
    input [31:0]in_add,
    input in_flag,
    input [31:0]in_res,
    input [31:0]in_dat2,
    input [4:0]in_mux
    output reg[31:0]ou_add,
    output reg ou_flag,
    output reg[31:0]ou_res,
    output reg[31:0]ou_dat2,
    output reg[31:0]ou_mux
};

always @(posedge clk) begin
    ou_add <= in_add;
    ou_flag <= in_flag;
    ou_res <= in_res;
    ou_dat2 <= in_dat2;
    ou_mux <= in_mux;
end

endmodule