RWM		EQU	$0000
ROM		EQU	$C000
BYTES	EQU	3
* Suma de dos numeros de xx bits
		ORG 	RWM
NUM1		RMB	BYTES	; RMB = reserve memory bytes
NUM2		RMB	BYTES	; etiqueta se traduce a la direccion de la parte alta
RES		RMB	BYTES+1	
		ORG	NUM1
		DB	1,2,3,4,5		; define byte
		ORG	NUM2
		DB	1,2,3,4,5
		ORG	ROM 
		CLR	RES		; limpia el primer byte de RES
		LDX	#(NUM1+BYTES-1)
		CLC
		LDAB	#BYTES
loop		LDAA	0,x
		ADCA	BYTES,x
		STAA	(BYTES*2+1),x	; no hay necesidad de usar hexa
		DEX
		DECB
		BNE	loop
		BCC	fin
		INC	RES
FIN		BRA	FIN