RAM     EQU		$0000
ROM	    EQU		$C000
RESET   EQU		$FFFE

        ORG		RAM
varP	RMB		2
varQ	RMB		2
varS	RMB		3

        ORG	ROM
init	CLR	varS    ; pone en $000000 la posicion de memoria varS
        LDAA    varP+1  ; cargo parte "low" de varP en acumulador A
        ADDA    varQ+1  ; sumo el contenido del acc A con varQ+1(low varQ)
        STAA    varS+2  ; guardo data del acumulador A en low varS(varS+2)
        LDAA    varP    ; cargo parte "high" de varP
        ADCA    varQ    ; sumo con carry el contenido de acc A con varQ(high)
        BCC     carry0  ; si no hubo carry, salteo proxima linea
        INC     varS    ; sumo (si hubo) el carry a la parte "high" de la direccion
carry0  STAA    varS+1  ; dejo el contenido del acum. A en el segundo byte de varS
fin	BRA	fin     ; un BRA con offset -2 (loop infinito)

        ORG	RESET
        dw	init	; dw = dump word (creo)