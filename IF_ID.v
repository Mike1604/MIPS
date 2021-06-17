//  BUFFER 1

`timescale 1ns/1ns

module IF_ID(
    input clk,
    input [31:0]in_add,
    input [31:0]in_insmem,
    output reg [31:0]ou_add,
    output reg [31:0]ou_insmem
);
/*
initial begin
	ou_add = 32'h00000000;
    ou_insmem = 32'h00000000;
end*/

always @(posedge clk) begin
    ou_add = in_add;
    ou_insmem = in_insmem;
end

endmodule