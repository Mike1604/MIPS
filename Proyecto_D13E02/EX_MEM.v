//  BUFFER 3

`timescale 1ns/1ns

module EX_MEM(
    input clk,
    input [2:0]in_M,
    input [1:0]in_WB,
    input [31:0]in_add,
    input in_flag,
    input [31:0]in_res,
    input [31:0]in_dat2,
    input [4:0]in_mux,
    input [27:0]in_ShfJ,
    input J_in,
    output reg[31:0]ou_add,
    output reg ou_flag,
    output reg[31:0]ou_res,
    output reg[31:0]ou_dat2,
    output reg[4:0]ou_mux,
    output reg [2:0]ou_M,
    output reg[1:0]ou_WB,
    output reg [27:0]ou_ShfJ,
    output reg J_out
);

always @(posedge clk) begin
    ou_add = in_add;
    ou_flag = in_flag;
    ou_res = in_res;
    ou_dat2 = in_dat2;
    ou_mux = in_mux;
    ou_M = in_M;
    ou_WB = in_WB;
    J_out = J_in;
    ou_ShfJ = in_ShfJ;
end

endmodule
