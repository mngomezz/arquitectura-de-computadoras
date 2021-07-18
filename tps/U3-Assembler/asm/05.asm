RAM	EQU	$0000
ROM	EQU	$C000
RESET   EQU	$FFFE

        ORG	RAM
varP	RMB	1
varQ	RMB	1
varR	RMB	1
varS	RMB	2

        ORG	ROM
init			
        CLR	varS    ; pone en $00 la posicion de memoria varS(MSB)
        LDAA	varP    ; carga el Acc A con el contenido de la posicion $0000(varP).
        ADDA	varQ    ; sumo el contenido de varQ a el acumulador A.
        BCC	notC    ; verifica que no haya carry
        INC	varS    ; hubo carry por eso le sumo 1 al contenido de la posicion varS
notC    SUBA    varR    ; resto el contenido de varR a el acumulador A.
        BCC     notB    ; verifica que no haya carry(Borrow)
        DEC     varS    ; hubo borrow por eso le resto 1 al contenido de la posicion varS
notB    STAA	varS+1  ; vuelco el Acc A en la parte baja de varS;
fin	BRA	fin     ; un BRA con offset -2 (loop infinito).

        ORG	var1    // Sirve unicamente en el simulador
        db 	$FF,$FF ;; db = dump byte (creo)

        ORG	RESET
        dw	init	;; dw = dump word (creo)