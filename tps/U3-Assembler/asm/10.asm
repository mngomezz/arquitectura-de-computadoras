RAM	    EQU	$0000
ROM	    EQU	$C000
RESET	EQU	$FFFE

        ORG	RAM
varN1	RMB	1
varN2	RMB	1
varN3	RMB	1
varMAX	RMB	1
        ORG	ROM
init	
        LDAA    varN1	; cargo en acc A con el primer numbero
	LDAB	varN2	; cargo el acc B con el segundo numero
	CBA		; comparo A(N1) con B(N2)
	BHS	sigo	; Si A es mayor  o igual a B
	TBA		; (si B es mayor) llevo B a A.
sigo	
	LDAB	varN3	; cargo el tercer numero en B
	CBA		; comparo A(max(N1,N2)) con B(N3)
	BHS	notN3	; Si A es mayor o igual a B
	TBA		; dejo el mayor(N3) en A
notN3
	STAA	varMAX	; guardo el mayor como maximo
fin	BRA	fin     ; un BRA con offset -2 (loop infinito)	

        ORG	RESET
        dw	init	; dw = dump word (creo)