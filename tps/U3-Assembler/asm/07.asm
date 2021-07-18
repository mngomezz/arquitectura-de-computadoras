RAM     EQU		$0000
ROM	    EQU		$C000
RESET   EQU		$FFFE

        ORG		RAM
varN1	RMB		2
varN	RMB		1
varS	RMB		2

        ORG	ROM
init	CLR	varS    ; pone en $00 la posicion de memoria varS.
        LDX     #varN1  ; cargo en reg X la direccion del primer operando.
        LDAB    varN    ; cargo el acc. B la cantidad de sumandos.
        LDAA    0,X     ; cargo el acc. A con el primer sumando del reg X.
loop	
        INX             ; ahora el registro X apunta al proximo operando.
        ADDA    0,X     ; sumo el contenido del acum. con el contenido del registro X.
        BCC     carry0  ; si no hubo carry, salteo proxima linea.
        INC     varS    ; sumo (si hubo) el carry a la parte "high" de la direccion.
carry0  DECB    	; quito 1 a la cantidad de sumandos que restan sumar.
        BNE     loop    ; si el acc B != 0(faltan sumar numeros) entonces loopeo
        STAA    varS+1  ; dejo el contenido del acum. A en la direccion "low" de varS.
fin	BRA	fin     ; un BRA con offset -2 (loop infinito).

        ORG	RESET
        dw	init	; dw = dump word (creo)