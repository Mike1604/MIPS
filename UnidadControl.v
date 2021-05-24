`timescale 1ns/1ns
module UC(
    input [5:0]Opc,
    output reg Memtoreg,
    output reg RegWrite,
    output reg MemToWrite,
    output reg[2:0]ALUOp
);
always @* 
begin
    case (Opc)
    6'b000000:
    begin
      Memtoreg <= 1'b0;
      MemToWrite <= 1'b0;
      ALUOp <= 3'b001;
      RegWrite <= 1'b1;
    end
    default 
    begin
      Memtoreg <= 1'bx;
      MemToWrite <= 1'bx;
      ALUOp <= 3'bx;
      RegWrite <= 1'bx;
    end
    endcase
end
endmodule
