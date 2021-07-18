RAM	EQU	$0000
ROM	EQU	$C000
RESET   EQU	$FFFE

        ORG	RAM
varN1	RMB	2
varNN	RMB	2
varS	RMB	2

        ORG	ROM
init			
        CLR	varS    ; pone en $00 la posicion de memoria varS
        CLC             ; limpio el bit de carry por si las dudas
        LDX     #varN1  ; cargo en reg X la direccion del primer operando
        LDAA    0,X     ; cargo el acc. A con lo obtenido del registro X
loop
        INX             ; incremento el registro X
        ADDA    0,X     ; sumo el contenido del acc A con el contenido del reg X
        BCC     carry0  ; si no hubo carry, salteo proxima linea.
        INC     varS    ; sumo el carry a la parte "high" de la direccion.
carry0  CPX     varNN   ; comparo con la direccion del ultimo operando
        BNE     loop    ; si aun no se llego a varNN, entonces sigo sumando
        STAA    varS+1  ; guardo contenido de acc A en la dir "low" de varS.
fin	BRA	fin     ; un BRA con offset -2 (loop infinito).

        ORG	RESET
        dw	init	; dw = dump word (creo)