//  BUFFER 2

`timescale 1ns/1ns

module IF_ID()
{
    input WB,
    input M,
    input EX,
    input Sumador,
    input [31:0]Dato_1,
    input [31:0]Dato_2,
    input [31:0]Extension,
    input [4:0]Instruccion,
    input [4:0]Instruccion1,
    output WB_1,
    output M_1,
    output EX_1,
    output Sumador_1,
    output [31:0]Dato_1,
    output [31:0]Dato_2,
    output  Extension_1;
    output [4:0]Instruccion_1,
    output [4:0]Instruccion1_1
};

reg [31:0] BU2 [0:31];

always @() begin
    in_add = ou_add;
    in_insmem = ou_insmem;
end

endmodule