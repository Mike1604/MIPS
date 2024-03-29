`timescale 1ns/1ns

module PC(
	input clk,
	input [31:0]Entrada,
	output reg [31:0]Salida


);

initial Salida = 32'b0;      
always @ ( posedge clk ) begin         
	if ( Entrada )
		Salida = Entrada;    
	else Salida = 32'b0;     
end
/*
initial begin
	Salida = 32'b0;
end

always@(posedge clk)
begin
	Salida = Entrada;
end
*/
endmodule
