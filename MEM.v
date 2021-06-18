`timescale 1ns/1ns
module Memoria(
    input MemRead,
    input MemWrite,
    input [31:0]Adress,
    input [31:0]WriteData,
    output reg[31:0]ReadData
);
reg [31:0] MEM1 [0:31];

initial begin
    $display("Datos cargados en memoria...");
    $readmemb("MEMD", MEM1);
    
end

always @*
begin
    if(MemRead!=0)
    begin
        MEM1[Adress] = WriteData;
        ReadData = 32'dx;
    end
    else
    begin
        ReadData = MEM1[Adress];
    end
end

endmodule

