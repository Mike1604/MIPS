`timescale 1ns/1ns

module Instruction_Memory(
	input [31:0]Dir,
	output reg [31:0]Instruction

);
reg [7:0]M[0:399];

initial begin

	$display("Datos cargados en Instruction Memory...");
    $readmemb("Insmemf2", M);
end

always@*
begin
	
	  Instruction = {M[Dir],M[Dir+1],M[Dir+2],M[Dir+3]};
		
end
endmodule
