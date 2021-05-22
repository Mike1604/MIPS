`timescale 1ns/1ns
module MEM(
    input Ewr,
    input [4:0]Dir,
    input [31:0]alu,
    output reg[31:0]OUT
);
reg [31:0] MEM1 [0:31];
always @*
begin
    if(Ewr!=0)
    begin
        MEM1[Dir] <= alu;
        OUT <= 32'dx;
    end
    else
    begin
        OUT <= MEM1[Dir];
    end
end

endmodule

