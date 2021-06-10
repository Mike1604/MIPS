`timescale 1ns/1ns
module Unidad_Control(
    input [5:0]Opc,
    output reg [1:0] WB,
    output reg [2:0] M,
    output reg [4:0] EX
);

always @* 
begin
    case (Opc)
  
    6'b000000:  //  FORMATO R
    begin
      EX[0] = 1'b1; //  RegDst
      EX[3:1] = 3'b010; //ALUOp
      EX[4] = 1'b0;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b1; //  MemtoReg
    end

    6'b100011:   //  LW
    begin
      EX[0] = 1'b0; //  RegDst
      EX[3:1] = 3'b000; //ALUOp
      EX[4] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b0; //  MemtoReg
      end

    6'b101011:  //  SW
    begin
      EX[0] = 1'bx; //  RegDst
      EX[3:1] = 3'b000; //ALUOp
      EX[4] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b1;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b0; //  RegWrite
      WB[1] = 1'bx; //  MemtoReg
    end

    6'b000100:  //  BEQ
    begin
      EX[0] = 1'bx; //  RegDst
      EX[3:1] = 3'b001; //ALUOp
      EX[4] = 1'b0;  //  ALUSrc
      M[0] = 1'b1;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b0; //  RegWrite
      WB[1] = 1'bx; //  MemtoReg
    end

    6'b001000:  //  ADDI
    begin
      EX[0] = 1'b0; //  RegDst
      EX[3:1] = 3'b000; //ALUOp
      EX[4] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b1; //  MemtoReg
    end
    
    6'b001010:  //  SLTI
    begin
      EX[0] = 1'b0; //  RegDst
      EX[3:1] = 3'b100; //ALUOp
      EX[4] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b1; //  MemtoReg
    end

    6'b001100:  //  ANDI
    begin
      EX[0] = 1'b0; //  RegDst
      EX[3:1] = 3'b101; //ALUOp
      EX[4] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b1; //  MemtoReg
    end

    6'b001101:  //  ORI
    begin
      EX[0] = 1'b0; //  RegDst
      EX[3:1] = 3'b111; //ALUOp
      EX[4] = 1'b1;  //  ALUSrc
      M[0] = 1'b0;  //  branch
      M[1] = 1'b0;  //  MemRead
      M[2] = 1'b0;  //  MemWrite
      WB[0] = 1'b1; //  RegWrite
      WB[1] = 1'b1; //  MemtoReg
    end
    
    endcase
end
endmodule
