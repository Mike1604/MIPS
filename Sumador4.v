`timescale 1ns/1ns

module Sumador4(
	input [31:0]A,
	output [31:0]B
);

assign B = A + 4;

endmodule