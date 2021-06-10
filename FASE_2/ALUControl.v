`timescale 1ns/1ns
module ALUCONTROL(
    input [5:0] Instruction,
    input [2:0] ALUOp,
    output reg[3:0] OutAlu   
);
always @* 
begin
    case (ALUOp)
    3'b010: //  Instrucciones tipo-R
    begin
      case (Instruction)
          6'b100000:
          begin
            OutAlu = 4'd0;    
          end
          6'b100010:  
          begin
            OutAlu = 4'd1;   
          end
          6'b100100:  
          begin
            OutAlu = 4'd2;   
          end
          6'b100101:  
          begin
            OutAlu = 4'd3;   
          end
          6'b101010:  
          begin
            OutAlu = 4'd4;   
          end
	        6'b000000:  
          begin
            OutAlu = 4'd5;   
          end
	        6'b011000:  
          begin
            OutAlu = 4'd6;   
          end
	        6'b011010:  
          begin
            OutAlu = 4'd7;   
          end
        default
        begin
            OutAlu = 4'dx;
        end
        endcase
    end
    3'b000:   //LW-SW-ADD
    begin
      OutAlu = 4'd0;
    end

    3'b001:  //BEQ
    begin
      OutAlu = 4'd1;
    end

    3'b100:  //SLTI
    begin
      OutAlu = 4'd4;
    end

    3'b101:  //ANDI
    begin
      OutAlu = 4'd2;
    end

    3'b111:  //ORI
    begin
      OutAlu = 4'd3;
    end
  endcase

end
endmodule
