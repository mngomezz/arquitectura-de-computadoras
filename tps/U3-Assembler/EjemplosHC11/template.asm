
;; Template: Esqueleto de programa ASM para MC68HC11
;;	Declaracion de valores fijos

RAM		EQU		$0000
ROM		EQU		$C000
RESET		EQU		$FFFE
LEDS		EQU		$1004
BOTONES		EQU		$1003

		ORG		ROM
MAIN
		LDAA		BOTONES
		STAA		LEDS
		BRA		MAIN

		ORG		RESET
		dw		main