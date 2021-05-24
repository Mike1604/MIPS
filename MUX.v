module MUX(
    input [31:0]Memd,
    input [31:0]res,
    input dec,
    output reg[31:0]MuxOut
);
always @* 
begin
    case (dec)
        1'b0:
        begin
          MuxOut <= res;
        end
        1'b1:
        begin
          MuxOut <= Memd;
        end
    endcase
end
endmodule
