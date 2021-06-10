//  BUFFER 2

`timescale 1ns/1ns

module ID_EX(
    input clk,
    input [4:0]in_EX,
    input [31:0]in_add,
    input [31:0]in_Dato1,
    input [31:0]in_Dato2,
    input [31:0]in_Extend,
    input [4:0]in_b20_16,
    input [4:0]in_b15_11,
    output reg[31:0]ou_add,
    output reg[31:0]ou_Dato_1,
    output reg[31:0]ou_Dato_2,
    output reg[31:0]ou_Extend,
    output reg[4:0]ou_b20_16,
    output reg[4:0]ou_b15_11,
    output reg[4:0]ou_EX
);

always @(posedge clk) begin
    ou_add = in_add;
    ou_Dato_1 = in_Dato1;
    ou_Dato_2 = in_Dato2;
    ou_Extend = in_Extend;
    ou_b20_16 = in_b20_16;
    ou_b15_11 = in_b15_11;
    ou_EX = in_EX;
end

endmodule