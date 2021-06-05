`timescale 1ns/1ns

module IF_ID()
{
    input [32]in_add,
    input [32]in_insmem,
    output [32]ou_add,
    output [32]ou_insmem
};

reg [31:0] BU1 [0:31];

always @() begin
    in_add = ou_add;
    in_insmem = ou_insmem;
end

endmodule