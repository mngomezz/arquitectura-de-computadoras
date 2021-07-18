			ORG $0000
OP1			RMB	5
RESULTADO		RMB	2

*ESTO SUMA 5 NUMEROS

			ORG $C000
INICIO
			CLR	RESULTADO
			LDAB #4
			LDX	#OP1	
			LDAA	0,X
LOOP
			INX
			ADDA 0,X
			STAA RESULTADO+1
			BCC	SIGUE
			INC	RESULTADO
SIGUE
			DECB
			BNE 	LOOP
FIN			BRA	FIN



			ORG	OP1
			DB	218,96,224,216,136



			ORG	$FFFE
			DW	INICIO


















