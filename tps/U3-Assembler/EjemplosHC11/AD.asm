OPTION		EQU	$1039
ADCTL		EQU	$1030
ADR1		EQU	$1031
LEDS		EQU	$1004
ROM		EQU	$C000
RESET		EQU	$FFFE


		ORG     ROM
		LDAA	#$80 ;; Bit 7 = A/D Power UP
		STAA	OPTION

		LDAA	#$30 ;; Bit 5 = Continuous Scan
			        ;; Bit 4= Multichannel
		STAA	ADCTL

LOOP:
		LDAA    ADR1
		CMPA	#$80
		BLO	APAGA
		LDAA	#01
		STAA	LEDS
		BRA	LOOP
APAGA
		CLR	LEDS
		BRA	LOOP
		ORG	RESET
		DW	ROM