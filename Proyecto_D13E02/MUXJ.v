`timescale 1ns/1ns

module MultiplexorJ(
	input [31:0]PC4,
    input [27:0]JAdd,
	input [31:0]OP0,
	input Dec,
	output reg[31:0]Salida
);

always@*
begin
  case(Dec)
	1'b1:
	begin
	  Salida = {PC4[31:28],JAdd[27:0]};
	end

	1'b0:
	begin
	  Salida = OP0;
	end	
  endcase
end
endmodule

