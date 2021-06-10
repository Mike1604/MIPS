`timescale 1ns/1ns

module TB_DataPath();
reg Clk = 1'b0;

DataPath DUV(
	.CLK(Clk)

);

always #100 Clk = ~Clk;

initial begin
#8000
$stop;

end

endmodule
