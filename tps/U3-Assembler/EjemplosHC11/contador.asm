
;; Template: Esqueleto de programa ASM para MC68HC11
;;	Declaracion de valores fijos

RAM		EQU		$0000
ROM		EQU		$C000
RESET		EQU		$FFFE
LEDS		EQU		$1004
BOTONES		EQU		$1003

		ORG		ROM
MAIN
		CLRB
		LDAA		BOTONES
		
		;; Sacamos el primer bit
		LSLA		;; Ingresa 0 en LSB y sale MSB a carry
		BCC		Bit2
		ROLB		
Bit2		LSLA
		BCC		Bit3
		ROLB
Bit3		LSLA
		BCC		Bit4
		ROLB
Bit4		LSLA
		BCC		Bit5
		ROLB
Bit5		LSLA
		BCC		Bit6
		ROLB
Bit6		LSLA
		BCC		Bit7
		ROLB
Bit7		LSLA
		BCC		Bit8
		ROLB
Bit8		LSLA
		BCC		Fin
		ROLB
Fin

		STAB		LEDS
		BRA		MAIN

		ORG		RESET
		dw		main