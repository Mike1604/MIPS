#Decodificador
import os, sys, subprocess
from io import open
def inicio():
    os.system("cls")
    print("Bienvenido")
    print("Equipo 02")
    print("Fʟᴏʀᴇs Esᴛʀᴀᴅᴀ Aʙʀᴀʜᴀᴍ Mɪɢᴜᴇʟ Aɴɢᴇʟ")
    print("Guerra Lopez Paulina Estefania")
    print("Pᴇʀᴇᴢ ᴅᴇ ʟᴀ Tᴏʀʀᴇ Lᴇᴏɴᴀʀᴅᴏ Oᴄᴛᴀᴠɪᴏ\n")
    print("Este algoritmo resuelve las combinaciones posibles al escoger N elementos del total de N elementos\n")
    print("Para obtener el numero de combinatorias posibles se resta el a - b a el resultado despues se le obtendra")
    print("el factorial al igual que a y b. Despues b se multplicara por el factorial de la resta y el resultado")
    print("se usara para dividir el factorial de a por este")
    input("\nPresione enter para iniciar")
def DB (opc):
    numero_binario = 0
    multiplicador = 1

    while opc != 0:
        numero_binario = numero_binario + opc % 2 * multiplicador
        opc //= 2
        multiplicador *= 10
    return numero_binario
    
def MEMD(opc,sel):
    archivo_texto=open("MEMD.txt","w")
    opcs=str(opc)
    sels=str(sel)
    salt="\n"
    uno="1\n"
    archivo_texto.write(opcs)
    archivo_texto.write(salt)
    archivo_texto.write(sels)
    archivo_texto.write(salt)
    archivo_texto.write(uno)
    for i in range(29):
        archivo_texto.write("0\n")
    archivo_texto.close()

def MEMIns(opc,sel):
    archivo_texto=open("MEMIns.txt","w")
    salt="\n"
    nop="00000000\n"
    lw="100011"
    dirb0="00\n000"
    dirb0_1="00000"
    dirb1="00\n001"
    dirb1_1="00001\n"
    dirb1_0="00001"
    dirb4="00\n100"
    dirb4_1="00100"
    dirb4_2="001\n00"
    dirb5="00101\n"
    dirb5_0="00101"
    dirb5_1="00\n101"
    dirb2="00\n010"
    dirb2_1="00010"
    dirb3="00011\n"
    dirb3_1="00\n011"
    dirb6="00110"
    dirb6_1="00\n110"
    R="000000"
    shif="000\n00"
    mul="011000"
    sub="100010"
    beq="000100"
    j="000010"
    jnop="00\n00000000"
    j1="00001010"
    j2="00010011"
    j3="00011100"
    beq1="00000101"
    div="011010"
    sw="101011"
    #Instruccion 0 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #instruccion 1 Carga el primer operando al banco de registros
    archivo_texto.write(lw)
    archivo_texto.write(dirb2)
    archivo_texto.write(dirb0_1)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(nop)
    #instruccion 2 Carga el segundo operando al banco de registros
    archivo_texto.write(lw)
    archivo_texto.write(dirb2)
    archivo_texto.write(dirb1_1)
    archivo_texto.write(nop)
    archivo_texto.write(nop)
    #instruccion 3 Carga el primer operando al banco de registros en otra direccion
    archivo_texto.write(lw)
    archivo_texto.write(dirb0)
    archivo_texto.write(dirb4_1)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(nop)
    #instruccion 4 Carga el segundo operando al banco de registros en otra direccion
    archivo_texto.write(lw)
    archivo_texto.write(dirb1)
    archivo_texto.write(dirb5)
    archivo_texto.write(nop)
    archivo_texto.write(nop)
    #Instruccion 5 Carga el numero 1 al banco de registros
    archivo_texto.write(lw)
    archivo_texto.write(dirb2)
    archivo_texto.write(dirb2_1)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(nop)
    #Instruccion 6 Carga el numero 1 al banco de registros
    archivo_texto.write(lw)
    archivo_texto.write(dirb2)
    archivo_texto.write(dirb3)
    archivo_texto.write(nop)
    archivo_texto.write(nop)
    #Instruccion 7
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 8
    for i in range(4):
        archivo_texto.write(nop)
    """
    Primer Factorial
    """
    #Instruccion 9 se resta un operando por el otro
    archivo_texto.write(R)
    archivo_texto.write(dirb4)
    archivo_texto.write(dirb5)
    archivo_texto.write(dirb6)
    archivo_texto.write(shif)
    archivo_texto.write(sub)
    archivo_texto.write(salt)
    #Instruccion 10 multiplica los operandos para calcular el factorial
    archivo_texto.write(R)
    archivo_texto.write(dirb0)
    archivo_texto.write(dirb4_1)
    archivo_texto.write(salt)
    archivo_texto.write(dirb0_1)
    archivo_texto.write(shif)
    archivo_texto.write(mul)
    archivo_texto.write(salt)
    #Instruccion 11 resta el operando por 1
    archivo_texto.write(R)
    archivo_texto.write(dirb4)
    archivo_texto.write(dirb2_1)
    archivo_texto.write(salt)
    archivo_texto.write(dirb4_1)
    archivo_texto.write(shif)
    archivo_texto.write(sub)
    archivo_texto.write(salt)
    #Instruccion 12 BEQ
    archivo_texto.write(beq)
    archivo_texto.write(dirb4)
    archivo_texto.write(dirb2_1)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(beq1)
    archivo_texto.write(salt)
    #Instruccion 13 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 14 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 15 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 16 J
    archivo_texto.write(j)
    archivo_texto.write(jnop)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(j1)
    archivo_texto.write(salt)
    #Instruccion 17 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 18 NOP
    for i in range(4):
        archivo_texto.write(nop)
    """
    Segundo Factorial
    """
    #Instruccion 19 multiplica los operandos para calcular el factorial
    archivo_texto.write(R)
    archivo_texto.write(dirb1)
    archivo_texto.write(dirb5)
    archivo_texto.write(dirb1_0)
    archivo_texto.write(shif)
    archivo_texto.write(mul)
    archivo_texto.write(salt)
    #Instruccion 20 resta el operando por 1
    archivo_texto.write(R)
    archivo_texto.write(dirb5_1)
    archivo_texto.write(dirb3)
    archivo_texto.write(dirb5_0)
    archivo_texto.write(shif)
    archivo_texto.write(sub)
    archivo_texto.write(salt)
    #Instruccion 21 BEQ
    archivo_texto.write(beq)
    archivo_texto.write(dirb3_1)
    archivo_texto.write(dirb5)
    archivo_texto.write(nop)
    archivo_texto.write(beq1)
    archivo_texto.write(salt)
    #Instruccion 22 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 23 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 24 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 25 J
    archivo_texto.write(j)
    archivo_texto.write(jnop)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(j2)
    archivo_texto.write(salt)
    #Instruccion 26 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 27 NOP
    for i in range(4):
        archivo_texto.write(nop)
    """
    Tercer Factorial
    """
    #Instruccion 28 multiplica los operandos para calcular el factorial
    archivo_texto.write(R)
    archivo_texto.write(dirb2)
    archivo_texto.write(dirb6)
    archivo_texto.write(salt)
    archivo_texto.write(dirb2_1)
    archivo_texto.write(shif)
    archivo_texto.write(mul)
    archivo_texto.write(salt)
    #Instruccion 29 resta el operando por 1
    archivo_texto.write(R)
    archivo_texto.write(dirb6_1)
    archivo_texto.write(dirb3)
    archivo_texto.write(dirb6)
    archivo_texto.write(shif)
    archivo_texto.write(sub)
    archivo_texto.write(salt)
    #Instruccion 30 BEQ
    archivo_texto.write(beq)
    archivo_texto.write(dirb3_1)
    archivo_texto.write(dirb6)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(beq1)
    archivo_texto.write(salt)
    #Instruccion 31 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 32 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 33 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 34 J
    archivo_texto.write(j)
    archivo_texto.write(jnop)
    archivo_texto.write(salt)
    archivo_texto.write(nop)
    archivo_texto.write(j3)
    archivo_texto.write(salt)
    #Instruccion 35 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 36 NOP
    for i in range(4):
        archivo_texto.write(nop)
    """
    Multiplicacion de factoriales
    """
    #Instruccion 37 Mul
    archivo_texto.write(R)
    archivo_texto.write(dirb1)
    archivo_texto.write(dirb2_1)
    archivo_texto.write(salt)
    archivo_texto.write(dirb4_1)
    archivo_texto.write(shif)
    archivo_texto.write(mul)
    archivo_texto.write(salt)
    """
    Division de Factoriales
    """
    #Instruccion 38 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 39 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 40 Div
    archivo_texto.write(R)
    archivo_texto.write(dirb0)
    archivo_texto.write(dirb4_1)
    archivo_texto.write(salt)
    archivo_texto.write(dirb5_0)
    archivo_texto.write(shif)
    archivo_texto.write(div)
    archivo_texto.write(salt)
    """
    Guarda el resultado en la memoria
    """
    #Instruccion 41 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 42 NOP
    for i in range(4):
        archivo_texto.write(nop)
    #Instruccion 43 Sw
    swoff="00000010"
    archivo_texto.write(sw)
    archivo_texto.write(dirb3_1)
    archivo_texto.write(dirb5)
    archivo_texto.write(nop)
    archivo_texto.write(swoff)
    archivo_texto.close()
def Ens():
    archivo_texto=open("AlgoritmoEns.txt","w")
    Ens1="Nop	$0	$0	#0\n Lw	$0	$2	#0\n Lw	$1	$2	#0\nLw	$4	$0	#0\nLw	$5	$1	#0\nLw	$2	$2	#0\nLw	$3	$2	#0\nNop	$0	$0	$0\n"
    Ens2="Nop	$0	$0	$0\nSub	$6	$4	$5\nMul	$0	$0	$4\nSub	$4	$4	$2\nBeq	$4	$2	#5\nNop	$0	$0	$0\nNop	$0	$0	$0\nNop	$0	$0	$0\n"
    Ens3="J	$10		\nNop	$0	$0	$0\nNop	$0	$0	$0\nMul	$1	$1	$5\nSub	$5	$5	$3\nBeq	$3	$5	#5\nNop	$0	$0	$0\nNop	$0	$0	$0\n"
    Ens4="Nop	$0	$0	$0\nJ	$19	   \nNop	$0	$0	$0\nNop	$0	$0	$0\nMul	$2	$2	$6\nSub	$6	$6	$3\nBeq	$3	$6	#5\nNop	$0	$0	$0\n"
    Ens5="Nop	$0	$0	$0\nNop	$0	$0	$0\nJ	$28		\nNop	$0	$0	$0\nNop	$0	$0	$0\nMul	$4	$1	$2b\nNop	$0	$0	$0\nNop	$0	$0	$0\n"
    Ens6="Div	$5	$0	$4\nNop	$0	$0	$0\nNop	$0	$0	$0\nSw	$5	$3	#2"
    archivo_texto.write(Ens1)
    archivo_texto.write(Ens2)
    archivo_texto.write(Ens3)
    archivo_texto.write(Ens4)
    archivo_texto.write(Ens5)
    archivo_texto.write(Ens6)
    archivo_texto.close() 
def deco():
    print(inicio())
    os.system("cls")
    try:
        print("Para este algoritmo unicamente se pueden usar numeros enteros, el numero de opciones posibles maximo es 10\n")
        opc=int(input("\nIngrese el numero de opciones posibles: \n"))
        sel=int(input("Ingrese que opciones fueron seleccionadas: \n"))
        if ((opc<0) or (sel<0)):
            print("Las opciones no pueden ser negativas")
            input("Presiona enter para continuar")
            deco()
        if(opc>10):
            print("Recuerda que el algoritmo unicamente soporta hasta factoriales de 10....")
            input("Presiona enter para continuar")
            deco()
        if (opc>sel):
            opcM=DB(opc)
            selM=DB(sel)
            MEMD(opcM,selM)
            MEMIns(opc,sel)
            Ens()
            print("Archivo de instrucciones, Ensamblador, Memoria de datos generados correctamente......")
            input("Presiona enter para salir")
        else:
            print("El numero de elementos seleccionados no puede ser menor que el numero de elementos totales")
            input("Presiona enter para continuar")
            deco()
    except:
        print("Debes ingresar numeros enteros")
        input("Presiona enter para continuar")
        deco()
deco()
