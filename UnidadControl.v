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
  
    6'b000000:  //  FORMATO R
    begin
      EX[0] = 1'b1; //  RegDst
      EX[2:1] = 2'b10 //ALUOp
      EX[3] = 1'b0;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b0; //  MemtoReg
    end

    6'b100011:   //  LW
    begin
      EX[0] = 1'b0; //  RegDst
      EX[2:1] = 2'b00 //ALUOp
      EX[3] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b1;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b1; //  MemtoReg
      end

    6'b101011:  //  SW
    begin
      EX[0] = 1'bx; //  RegDst
      EX[2:1] = 2'b00 //ALUOp
      EX[3] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b1;  //  MemWrite
      WB[0] = 1'b0; //  RegWrite
      WB[1] = 1'bx; //  MemtoReg
    end

    6'b000100:  //  BEQ
    begin
      EX[0] = 1'bx; //  RegDst
      EX[2:1] = 2'b01 //ALUOp
      EX[3] = 1'b0;  //  ALUSrc
      M[0] = 1'b1;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b0; //  RegWrite
      WB[1] = 1'bx; //  MemtoReg
    end
    
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
    end
    endcase
end
endmodule
