			ORG $0000
OP1			RMB	1
OP2			RMB	1
RESULTADO		RMB	2



			ORG $C000
INICIO
			CLR	RESULTADO
			LDX	#OP1	


			LDAA	0,X
			ADDA 1,X
			STAA 3,X

			BCC	SIGUE
			INC	2,X
SIGUE

FIN			BRA	FIN



			ORG	OP1
			DB	$97,224



			ORG	$FFFE
			DW	INICIO


















