`timescale 1ns/1ns
module Unidad_Control(
    input [5:0]Opc,
    output reg [1:0] WB,
    output reg [2:0] M,
    output reg [3:0] EX
);

always @* 
begin
    case (Opc)
    /*
    6'b000000:
    begin
      MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 3'b001;
      RegWrite = 1'b1;
      MemRead = 1'b0;
      RegDst = 1'b1;
      branch = 1'b0;
      ALUSrc = 1'b0;
    end*/

    6'b100011
    begin
      WB[0] = 1:
      WB[1] = 1;
      M[0] = 0;
      M[1] = 0;
      M[2] = 0;
      EX[0] = 0:
      EX[2:1] = 2'B10;
      EX[3] = 1;
    end
    /*
    default 
    begin
      MemToReg = 1'bx;
      MemToWrite = 1'bx;
      ALUOp = 3'bx;
      RegWrite = 1'bx;
      MemRead = 1'bx;
      RegDst = 1'bx;
      branch = 1'bx;
      ALUSrc = 1'bx;
    end*/
    endcase
end
endmodule
