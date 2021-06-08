//  BUFFER 3

`timescale 1ns/1ns

module IF_ID()
{
    input W_B,
    input M,
    input [32]sumador,
    input [32]Alu_Resu,
    input cero,
    input [32:0]dato_2
    output [32]ou_add,
    output [32]ou_insmem
};

reg [31:0] BU1 [0:31];

always @() begin
    in_add = ou_add;
    in_insmem = ou_insmem;
end

endmodule