		ORG 	$0000
NUM1		RMB	2	; RMB = reserve memory bytes
NUM2		RMB	2	; etiqueta se traduce a la direccion de la parte alta
RES		RMB	3	
* case insensitive (CLR == clr == Clr == CLr == cLR)

		ORG	$C000 ; C000 como el PC !
		CLR	RES		; limpia el primer byte de RES
		LDD	NUM1		;
		ADDD	NUM2		; D + M:M+1
		BCC	no_carry	; si no hay acarreo, salto
		INC 	RES		; RES++ (solo el primer byte)
no_carry	STD	RES+1	; guardo 2do y 3er bytes de RES
FIN		BRA	FIN		; pudrete flanders!