//  BUFFER 1

`timescale 1ns/1ns

module IF_ID()
{
    input CLK,
    input [32]in_add,
    input [32]in_insmem,
    output reg [32]ou_add,
    output reg [32]ou_insmem
};

always @(posedge CLK) begin
    ou_add <= in_add;
    ou_insmem <= in_insmem;
end

endmodule