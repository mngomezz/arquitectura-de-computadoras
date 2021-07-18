ROM		EQU	$C000
RAM		EQU	$0000
RESET		EQU	$FFFE

		ORG	RAM
CONTADOR	RMB	1

		ORG	ROM
		CLR	CONTADOR
		NOP
		NOP
		NOP
MAIN
		INC 	CONTADOR
		BRA	MAIN

		ORG	RESET
		DW	ROM