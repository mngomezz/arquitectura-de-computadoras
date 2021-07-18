RAM	    EQU	$0000
ROM	    EQU	$C000
RESET   EQU	$FFFE

        ORG	RAM
varN1	RMB	2
varN	RMB	1
varNp	RMB	1

        ORG	ROM
init			
loopE
        LDX     varN1 	; cargo direccion 1 del vector
	LDAA	varN	; cargo cantidad de elementos a ordenar
	STAA	varNp	; cargo esa cantidad en auxiliar (N prima)
loopI
        LDAA    0,X     ; cargo el acc A con el elemento apuntado por X
	LDAB	1,X	; cargo el acc B con el elemento siguiente
	CBA		; los comparo
	BLS	noCh	; salto si es menor o igual
	STAB	0,X	; cambio de lugar los elementos
	STAA	1,X	; cambio de lugar los elementos
noCh    INX             ; incremento el registro X
        DEC	varNp	; decremento cantidad de elementos a chequear
	BNE     loopI   ; si aun quedan elementos por chequear
	DEC	varN	; decremento cantidad de elementos a ordenar
	BNE	loopE	; si aun quedan elementos por ordenar
fin	BRA	fin     ; un BRA con offset -2 (loop infinito)

	ORG	RESET
        dw	init