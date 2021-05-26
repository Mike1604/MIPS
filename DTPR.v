`timescale 1ns/1ns

module DataPath(
	input Clk
);

wire [31:0]ADDMUX, ADDMUX1, Instruction, MUXPC, Dir, DirMem, SignExtend, ReadData1, ReadData2, SalidaMuxF,ReadDataMem, WriteData, ShiftLeftB;
wire [5:0]Opc;
wire [4:0]Mux4B;
wire [3:0]OutAlu;
wire [2:0]ALUOp;
wire flag;
wire RegDst;
wire MemToReg;
wire MemRead; 
wire RegWrite;
wire MemToWrite;
wire branch;
wire ALUSrc;
wire AND;

PC CicloFetch(
	.clk(Clk),
	.Entrada(MUXPC),
	.Salida(Dir)
);

Instruction_Memory A(
	.Dir(Dir),
	.Instruction(Instruction)
);

Unidad_Control B(
	.Opc(Instruction[31:26]),
        .MemToReg(MemToReg),
        .MemRead(MemRead),
        .RegWrite(RegWrite),
        .MemToWrite(MemToWrite),
        .RegDst(RegDst),
        .branch(branch),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp)
);


Multiplexor4B C(
	.OP0(Instruction[20:16]),
	.OP1(Instruction[15:11]),
	.RegDst(RegDst),
	.Salida(Mux4B)
);


Banco_Registros D(
	.ReadRegister1(Instruction[25:21]),
	.ReadRegister2(Instruction[20:16]),
	.WriteData(WriteData),
	.WriteRegister(Mux4B),
	.RegWrite(RegWrite),
	.ReadData1(ReadData1),
	.ReadData2(ReadData2)
);


SignExtend E(
	.SignInput(Instruction[15:0]),
	.Extend(SignExtend)
);


Multiplexor F(
	.OP0(ReadData2),
	.OP1(SignExtend),
	.Dec(ALUSrc),
	.Salida(SalidaMuxF)
);


ALUCONTROL G(
	.Instruction(Instruction[5:0]),
	.ALUOp(ALUOp),
	.OutAlu(OutAlu)
);


ALU H(
	.EA(ReadData1),
	.EB(SalidaMuxF),
	.sel(OutAlu),
	.res(DirMem),
	.flag(flag)
);


Memoria J(
	.MemRead(MemRead),
	.Adress(DirMem),
	.WriteData(ReadData2),
	.ReadData(ReadDataMem)

);


Multiplexor K(
	.OP0(DirMem),
	.OP1(ReadDataMem),
	.Dec(MemToReg),
	.Salida(WriteData)
);


ShiftLeft L(
	.A(SignExtend),
	.B(ShiftLeftB)
);


Sumador M(
	.A(ADDMUX),
	.B(ShiftLeftB),
	.C(ADDMUX1)
);


Multiplexor N(
	.OP0(ADDMUX),
	.OP1(ADDMUX1),
	.Dec(AND),
	.Salida(MUXPC)
);


Sumador4 O(
	.A(Dir),
	.B(ADDMUX)
);


AND P(
	.branch(branch),
	.flag(flag),
	.Salida(AND)

);
endmodule
