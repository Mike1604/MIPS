`timescale 1ns/1ns
module BR(
    input [4:0]RA1,
    input [4:0]RA2,
    input [31:0]Di,
    input [4:0]Dir,
    input RWrite,
    output reg[31:0]Dr1,
    output reg[31:0]Dr2
);
reg [31:0] BRM [0:31];
initial begin
    $readmemb("BR.MEM",BRM);
    $100;
end
always @*
begin
    if (RWrite!=0)
    begin
        BRM[Dir] <= Di;
    end
    Dr1 <= BRM[RA1];
    Dr2 <= BRM[RA2];
end
endmodule
