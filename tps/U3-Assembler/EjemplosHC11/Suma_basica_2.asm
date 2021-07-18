			ORG $0000
OP1			RMB	1
OP2			RMB	1
RESULTADO		RMB	2



			ORG $C000
INICIO
			CLR	RESULTADO
			LDAA	OP1
			ADDA OP2
			STAA	RESULTADO+1

			BCC	SIGUE
			INC	RESULTADO
SIGUE

FIN			BRA	FIN



			ORG	OP1
			DB	$87,$A0


			ORG	$FFFE
			DW	INICIO


















