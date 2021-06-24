`timescale 1ns/1ns

module ShiftLeftJ(
	input [25:0]A,
	output [27:0]B

);

assign B=A<<2;

endmodule

