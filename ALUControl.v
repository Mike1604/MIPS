`timescale 1ns/1ns
module ALC(
    input [5:0] Ins,
    input [2:0] Code,
    output reg[2:0] OutAlu   
);
always @* 
begin
    if (Code == 001)
    begin
      case (Ins)
          6'b100000:
          begin
            OutAlu <= 3'd0;    
          end
          6'b100010:  
          begin
            OutAlu <= 3'd1;   
          end
          6'b100100:  
          begin
            OutAlu <= 3'd2;   
          end
          6'b100101:  
          begin
            OutAlu <= 3'd3;   
          end
          6'b101010:  
          begin
            OutAlu <= 3'd4;   
          end
        default
        begin
            OutAlu <= 3'dx;
        end
        endcase
    end
    else
    begin
      OutAlu <= 3'dx;
    end
end
endmodule