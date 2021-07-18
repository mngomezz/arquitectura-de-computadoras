RAM		EQU	$0000
ROM		EQU	$C000
RESET	EQU	$FFFE

		ORG	RAM
vecIni	RMB	2
vecFin	RMB	2
numMax	RMB	1
cantMax RMB 1

		ORG	ROM
inicio	
		CLR		numMax 	; seteo maximo = 0
		LDX		vecIni 	; cargo direccion de inicio
loop	CPX		vecFin 	; chequeo si estoy en el final del array
		BHI		fin		; si ya me sali del array
		LDAA	0,X		; cargo el dato actual del array
		INX				; incremento el array
		CMPA	numMax	; comparo con el actual maximo
		BLT		loop	; si es menor al maximo, entonces sigo loopeando
		BEQ		sameNum	; si es igual al maximo, salto a sameNum _
		STAA	numMax  ; si es mayor, entonces actualizo maximo  | MAYOR
		CLRB			; limpio contador de numeros maximos     _|  _
sameNum	INCB			; incremento cantidad de maximos encontrados _| IGUAL
		BRA		loop

		
fin		STAB	cantMax ; actualizo cantidad de maximos en memoria
		BRA		fin

		ORG	$0000
		db	$00,$30,$00,$3f
		ORG	$0030
		db	96,5,4,18,2,89,89,89,23,65,64,35,32,76,9,95