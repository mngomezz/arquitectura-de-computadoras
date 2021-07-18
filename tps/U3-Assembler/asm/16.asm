RWM		EQU	$0000
ROM		EQU	$C000
VRST	EQU	$FFFE
MASK128 EQU %10000000 ; si al aplicar mascara NUM != $00 => NUM >= 128
MENOR   EQU $3C
IGUALES EQU $3D
MAYOR   EQU $3E

		
        ORG	RWM
NUMERO  RMB 1
REL128	RMB	1

		ORG	ROM
		LDAB    NUMERO ; cargo numero en Acc. A
        ANDB    #MASK128 ; aplico mascara para saber si es menor a 128
        BEQ     esMenor ; si me da $00 entonces es menor
        ; aca ya se que es igual o mayor a 128
        LDAA    NUMERO  ; vuelvo a cargar el numero
        SBA             ; resto el numero con el resultado de aplicar la mascara
        BNE     esMayor ; si al restarle 128 (o mas) no me da $00, entonces es mayor   
        LDAA    #IGUALES ; si no realize un salto previo, entonces es igual
        STAA    REL128 ; guardo dato
        BRA fin
esMayor
        LDAA    #MAYOR
        STAA    REL128 ; guardo dato
        BRA     fin
esMenor
        LDAA    #MENOR
        STAA    REL128 ; guardo dato
		
fin		BRA	fin

        ORG RWM
        db  $80 ; NUMERO