`timescale 1ns/1ns

module AND(
	input branch,
	input flag,
	output Salida

);

assign Salida = branch && flag;

endmodule
