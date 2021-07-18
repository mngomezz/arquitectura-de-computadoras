RWM		EQU	$0000
ROM		EQU	$C000
* Suma de dos numeros de 32 bits
		ORG 	RWM
NUM1		RMB	4	; RMB = reserve memory bytes
NUM2		RMB	4	; etiqueta se traduce a la direccion de la parte alta
RES		RMB	5	
		ORG	NUM1
		DB	1,2,3,4		; define byte
		ORG	NUM2
		DW	$0056,$0078	; define word
		ORG	ROM 
		CLR	RES		; limpia el primer byte de RES
		LDX	#(NUM1+3)
		CLC
		LDAB	#4
loop		LDAA	0,x
		ADCA	4,x
		STAA	9,x
		DEX
		DECB
		BNE	loop
		BCC	fin
		INC	RES
FIN		BRA	FIN