RWM		    EQU	$0000
ROM		    EQU	$C000
VRST	    EQU	$FFFE

		    ORG	RWM
NUMERO      RMB	1
CENTENAS	RMB	1
DECENAS		RMB	1
UNIDADES	RMB	1

	    	ORG	ROM
inicio	
		CLRA            ; limpio el Acc A (HH de registro D).
		LDAB	NUMERO  ; Cargo el Acc B con el numero a convertir
		LDX	#$A     ; Cargo en IX 10H
		IDIV		    ; Divido D / IX (las unidades quedan en D)
		STAB    UNIDADES ; guardo unidades
		XGDX		    ; cambio D con IX para trabajar sobre las decenas
		LDX	#$A     ; Cargo en IX 10H
		IDIV		    ; Divido D / IX (las centenas quedan en D)
		STAB	DECENAS ; guardo decenas
        XGDX            ; cambio D con IX para trabajar sobre las centenas
        STAB    CENTENAS ; guardo centenas
fin		BRA	fin

		ORG	VRST
		DW	inicio

        ORG RWM
        db $FF