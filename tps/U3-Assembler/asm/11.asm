RAM	    EQU	$0000
ROM	    EQU	$C000
RESET	EQU	$FFFE

        ORG	RAM
varP	RMB	1
varABS	RMB	1

	ORG	ROM
init	
        LDAA    varP	; cargo en acc A con el numero en cuestion
	BPL	notN	; si es positivo, no hago nada
	COMA		; calculo el complemento del acc A
notN	 STAA	varABS	; guardo el valor absoluto
fin	BRA	fin     ; un BRA con offset -2 (loop infinito)	

        ORG	RESET
        dw	init	; dw = dump word (creo)