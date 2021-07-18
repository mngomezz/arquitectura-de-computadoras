IRQ		EQU	$FFF2
XIRQ	EQU	$FFF4
ROM		EQU	$C000
RAM		EQU	$0000
RESET	EQU	$FFFE
CONFIG	EQU	$1039

MASKNMI	EQU	%10111111
MASKIRQ	EQU	%11101111
MASKEDGE EQU %00100000 ; IRQ por flanco

		
		ORG	ROM
		;;Cargo el CCR en A
		TPA
		ANDA	#(MASKNMI&MASKIRQ)
		TAP
		;; IRQ por flanco
		LDAA	CONFIG
		ORAA	#MASKEDGE
		STAA	CONFIG
		

FIN		BRA	FIN

IRQ_ISR
		NOP
		NOP
		RTI
NMI_ISR	
		NOP
		NOP
		RTI

		ORG	IRQ
		DW	IRQ_ISR
		ORG	XIRQ
		DW	NMI_ISR
		ORG	RESET
		DW	ROM

