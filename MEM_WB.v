//  BUFFER 4

`timescale 1ns/1ns

module MEM_WB(
    input clk,
    input [31:0]in_red,
    input [31:0]in_res,
    input [4:0]in_mux,
    output reg[31:0]ou_red,
    output reg[31:0]ou_res,
    output reg[4:0]ou_mux
);

always @(posedge clk) begin
    ou_red <= in_red;
    ou_res <= in_res;
    ou_mux <= in_mux;
end

endmodule