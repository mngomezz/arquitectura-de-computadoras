* ENUNCIADO
* Escriba una subrutina para el HC11 (llamada COMPFLOAT) que reciba en IX la
* direccion de NUM1. NUM1 ocupa 4 bytes (NUM1+0, NUM1+1, NUM1+2, NUM1+3) y
* almacena un numero en punto flotante IEEE 754 de 32 bits. NUM1+0 posee el bit de
* signo en su bit mas significativo, y el numero se almacena en el formato
* tradicional de Bit de signo, luego exponente, luego mantisa. En Y se recibe NUM2
* (mismo formato). La subrutina debe retornar en el acumulador A el valor ASCII
* '>' si NUM1>NUM2, '=' si NUM1=NUM2 y '<' si NUM1<NUM2. Si necesita espacio de
* RWM puede utilizar la etiqueta AUX que tiene reservados 10 bytes de RWM.

RWM		EQU	$0000
ROM		EQU	$C000
VRST	EQU	$FFFE
MASK_N  EQU %10000000 ; con esta mascara se si es negativo
MENOR   EQU $3C ; '<'
IGUALES EQU $3D ; '='
MAYOR   EQU $3E ; '>'

		
        ORG	RWM
NUM1	RMB 4
NUM2    RMB 4
AUX		RMB	10

		ORG	ROM
		LDX	#NUM1
        LDY #NUM2
		JSR	COMPFLOAT
fin		BRA	fin

; Subrutina COMPFLOAT
;	Recibo: en IX -> NUM1: direccion de un numero IEEE 754 de 4 bytes (32bits)
;           en IY -> NUM2: direccion de un numero IEEE 754 de 4 bytes (32bits)
;	Devuelve: '>', + '=' o '<' (ASCII) segun NUM1 sea mayor igual o menor que NUM2.
;	Descripcion: Comparo numeros recibidos en formato IEEE 754 y retorno valores
;                ASCII segun su diferencia
;	NOTA: Cambia el CCR, Solo guarda los registros A y B en el Stack
COMPFLOAT	
	; Guardamos los registros A, B y X
	; El registro Y no lo guardo porque es el 
	; registro que elegi para retornar el contador
	PSHB
	PSHX
    PSHY

	; primero chequeo bit de signo, si uno es negativo, ya se cual es mayor
    LDAA 0,X
    ANDA #MASK_N
    TAB
    LDAA 0,Y
    ANDA #MASK_N
    CBA
	BHI esMayor ; si NUM1 es positivo y el otro negativo
    BLO esMenor ; si NUM1 es negativo y el otro positivo
	STAA AUX    ; guardo signo de numeros (00 => + ; 80 => -)
	
	;chequeo exponentes
    LDD 0,X
    LSLD
    STAA AUX+1
    LDD 0,Y
    LSLD
    CMPA AUX+1
    BNE sonDistintos ; un exponente es mayor a otro

    ;chequeo mantisa
    LDAA 1,X
    CMPA 1,Y
    BNE sonDistintos ; un numero es mayor
    LDAA 2,X
    CMPA 2,Y
    BNE sonDistintos ; un numero es mayor
    LDAA 3,X
    CMPA 3,Y
    BNE sonDistintos ; un numero es mayor
    LDAA #IGUALES
	BRA routineEnd

sonDistintos
	TPA	; guardo CCR en A para luego analizarlo.
	LDAB AUX ; cargo en B el signo de los numeros. 80 = Negativos, 00 = Positivos
	BNE sonNegativos ; si el signo es != 00 (80)
	TAP
    BLO esMenor ; si es mayor salto, sino cargo valor de menor
	BRA esMayor ; si no es menor, es mayor
sonNegativos
	TAP
    BLO esMayor ; si es mayor salto, sino cargo valor de menor
	BRA esMenor ; si no es menor, es mayor

esMayor
    LDAA #MAYOR
    BRA routineEnd
esMenor
    LDAA #MENOR
routineEnd
	; Recuperamos valores originales de registros en orden inverso
    PULY
	PULX
	PULB
	RTS ; Terminamos, retornamos de la subrutina
	
* Escritura de valores en memoria (SE USA PARA TESTEAR EL PROGRAMA)
		ORG	VRST
		dw	COMPFLOAT

        ORG RWM
        db  $05,$03,$45,$22 ; NUM1
        db  $05,$03,$45,$22 ; NUM2