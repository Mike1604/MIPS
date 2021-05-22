`timescale 1ns/1ns
module ALU(
    input [31:0]EA,
    input [31:0]EB,
    input [2:0]sel,
    output reg[31:0]res,
    output reg flag 
);
always @*
begin
    case(sel)
    3'd0:
    begin 
        res <= (EA + EB);
    end
    3'd1:
    begin
        res <= (EA - EB);
    end
    3'd2:
    begin
        res <= (EA & EB);
    end
    3'd3:
    begin
        res <= (EA | EB);
    end
    3'd4:
    begin
        res <= (EA<EB)?1'b1 : 1'b0;
    end
    default
    begin
        res <= 17'bx;
    end
    endcase
    if (res!=0) 
    begin
        flag <= 0;
    end
    else
    begin
        flag <= 1;
    end
end
endmodule
