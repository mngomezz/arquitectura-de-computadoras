RWM		EQU	$0000
ROM		EQU	$C000
VRST	EQU	$FFFE

		ORG	RWM
NUM		RMB	1
ASCII1	RMB	1
ASCII2	RMB	1

		ORG	NUM
		DB	$f9

		ORG	ROM
inicio	
		CLRA		 ; limpio el Acc A
		LDAB	NUM	 ; Cargo el Acc B con el numero a convertir
		LDX		#$10 ; Cargo en IX 10H
		IDIV		 ; Divido D / IX (las unidades quedan en D)
		CMPB	#$a	 ; comparo con 10(HEXA) para saber si es numero o letra en ASCII.
		BLO		unidadEsNum ; Si es menor a 10 salta y suma 30H
		ADDB	#$37	; $37 es el offset necesario para representar mayusculas en ASCII
		BRA		guardoUnidad
unidadEsNum
		ADDB	#$30
guardoUnidad
		STAB	ASCII2 ; guardamos las unidades
	
		XGDX		; cambio D con IX para trabajar sobre las decenas
		CMPB	#$a	; repito el procedimiento anterior
		BLO		decenaEsNum
		ADDB	#$37 
		BRA		guardoDecena
decenaEsNum
		ADDB	#$30 ; $30 es el offset necesario para representar numeros en ASCII
guardoDecena
		STAB	ASCII1

fin		BRA	fin

		ORG	VRST
		DW	inicio