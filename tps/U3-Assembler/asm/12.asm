RAM	    EQU	$0000
ROM	    EQU	$C000
RESET   EQU	$FFFE

        ORG	RAM
varN1	RMB	2
varNN	RMB	2

        ORG	ROM
init			
loopE
        LDX     varN1 	; cargo en reg X la direccion del primer operando
loopI
        LDAA    0,X     ; cargo el acc A con el elemento apuntado por X
	LDAB	1,X	; cargo el acc B con el elemento siguiente
	CBA		; los comparo
	BLS	noCh	; salto si es menor o igual
	STAB	0,X	; cambio de lugar los elementos
	STAA	1,X	; cambio de lugar los elementos
noCh    INX             ; incremento el registro X
        CPX     varNN   ; comparo con la direccion del ultimo operando
        BNE     loopI   ; si aun no se llego a varNN, entonces sigo sumando
	DEX		; decremento el final del vector (parte ordenada)
	STX	varNN	; guardo nuevo final del vector (desordenado)
	CPX	varN1	; comparo este nuevo final con el principio
	BNE	loopE	; si no son iguales, loopeo hasta que si
fin	BRA	fin     ; un BRA con offset -2 (loop infinito)
	
        ORG	RESET
        dw	init	; dw = dump word (creo)