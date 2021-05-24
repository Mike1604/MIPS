`timescale 1ns/1ns
module DTPR(
    input [31:0]Inst,
    output ZeF 
);
wire c1,c2,c3;
wire [2:0]c4;
wire[2:0]selCa;
wire [31:0]op1;
wire[31:0]op2;
wire [31:0]resCa;
wire [31:0]EAMux;
wire [31:0]BrRes;
UC DTPR(
    .Opc(Inst[31:26]),
    .Memtoreg(c1),
    .RegWrite(c2),
    .MemToWrite(c3),
    .ALUOp(c4)
);
BR DTPR2(
    .RA1(Inst[25:21]),
    .RA2(Inst[20:16]),
    .RWrite(c2),
    .Di(BrRes),
    .Dir(Inst[15:11]),
    .Dr1(op1),
    .Dr2(op2)
);
ALC DTPR3(
    .Ins(Inst[5:0]),
    .Code(c4),
    .OutAlu(selCa)
);
ALU DTPR4(
    .EA(op1),
    .EB(op2),
    .sel(selCa),
    .res(resCa),
    .flag(ZeF)
);
MEM DTPR5(
    .Ewr(c3),
    .Dir(resCa),
    .alu(op2),
    .OUT(EAMux)
);
MUX DTPR6(
    .Memd(EAMux),
    .res(resCa),
    .dec(c1),
    .MuxOut(BrRes)
);
endmodule
