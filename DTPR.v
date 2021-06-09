`timescale 1ns/1ns

module DataPath(
	input CLK
);

wire [31:0]C1, C2, C3, C4, C5, C6, C7, C8, C9, C13, C14, C15, C16, C17;
wire [31:0]C16_1, C20, C22, C25, C27, C28, C31, C32, C33, C35;
wire [1:0]C10;
wire [2:0]C11;
wire [3:0]C12, C23;
wire [4:0]C18, C19, C24, C30, C34;
wire C21, C26, C29;

Multiplexor N(
	.OP0(C3),
	.OP1(C26),
	.Dec(C29),
	.Salida(C1)
);

PC CicloFetch(
	.clk(CLK),
	.Entrada(C1),
	.Salida(C2)
);

Instruction_Memory A(
	.Dir(C2),
	.Instruction(C4)
);

Sumador4 O(
	.A(C2),
	.B(C3)
);

IF_ID BUFFER1(
	.clk(CLK),
	.in_add(C3),
	.in_insmem(C4),
	.ou_add(C5),
	.ou_insmem(C6)
);

Unidad_Control B(
	.Opc(C6[31:26]),
	.WB(C10),
	.M(C11),
	.EX(C12)
);

Banco_Registros D(
	.ReadRegister1(C6[25:21]),
	.ReadRegister2(C6[20:16]),
	.WriteData(C35),
	.WriteRegister(C34),
	.RegWrite(C10),
	.ReadData1(C7),
	.ReadData2(C8)
);

SignExtend E(
	.SignInput(C6[15:0]),
	.Extend(C9)
);

ID_EX BUFFER2(
	.clk(CLK),
	.in_add(C6),
	.in_Dato1(C7),
	.in_Dato2(C8),
	.in_Extend(C9),
	.in_b20_16(C6),
	.in_b15_11(C6),
	.ou_add(C13),
	.ou_Dato_1(C15),
	.ou_Dato_2(C16),
	.ou_Extend(C17),
	.ou_b20_16(C18),
	.ou_b15_11(C19)
);

ShiftLeft L(
	.A(C17),
	.B(C14)
);

Sumador M(
	.A(C13),
	.B(C14),
	.C(C20)
);

Multiplexor F(
	.OP0(C16),
	.OP1(C17),
	.Dec(C12[3]),
	.Salida(C16_1)
);

ALU H(
	.EA(C15),
	.EB(C16_1),
	.sel(C23),
	.res(C22),
	.flag(C21)
);

ALUCONTROL G(
	.Instruction(C17[5:0]),
	.ALUOp(),
	.OutAlu(C12[2:1])
);

Multiplexor4B C(
	.OP0(C18),
	.OP1(C19),
	.RegDst(D12[0]),
	.Salida(C24)
);

EX_MEM BUFFER3(
	.clk(CLK),
	.in_add(C20),
	.in_flag(C21),
	.in_res(C22),
	.in_dat2(C16),
	.in_mux(C24),
	.ou_add(C25),
	.ou_flag(C26),
	.ou_res(C27),
	.ou_dat2(C28),
	.ou_mux(C30)
);

AND P(
	.branch(C11[0]),
	.flag(C26),
	.Salida(C29)
);

Memoria J(
	.Adress(C27),
	.WriteData(C28),
	.MemRead(MemRead),
	.MemWrite(C11[2]),
	.ReadData(C11[1])
);

MEM_WB BUFFER4(
	.clk(CLK),
	.in_red(C31),
	.in_res(C27),
	.in_mux(C30),
	.ou_red(C32),
	.ou_res(C33),
	.ou_mux(C34)
);

Multiplexor K(
	.OP0(C32),
	.OP1(C33),
	.Dec(C10[1]),
	.Salida(C35)
);

endmodule
