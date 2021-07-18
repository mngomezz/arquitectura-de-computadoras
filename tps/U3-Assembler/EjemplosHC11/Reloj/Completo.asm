; Valores Constantes 
PORTB		EQU		$1004
PORTC		EQU		$1003
ROM		EQU		$C000
RAM		EQU		$0000
RESET		EQU		$FFFE
LCDDATA		EQU		$1040

Pulso		EQU		%10000000 ; Indica que paso un segudno
MasSegundo	EQU		%00000001 ; Incrementa cuenta en segundo
MenosSegundo	EQU		%00000010 ; Decrementa cuenta en segundo
MasMinuto	EQU		%00000100 ; Incrementa cuenta en minuto
MenosMinuto	EQU		%00001000 ; Decrementa cuenta en minuto
MasHora		EQU		%00010000 ; Incrementa cuenta en hora
MenosHora	EQU		%00100000 ; Decrementa cuenta en hora



		ORG		RAM
Segundos	RMB		1
Minutos		RMB		1
Horas		RMB		1

		ORG		ROM
Init:
		;Pone la hora inicial en 12:00:00
		LDAA		#$00
		STAA		Segundos
		STAA		Minutos
		LDAA		#$12
		STAA		Horas

Main:
		;; Comenzamos mostrando la hora en display
		JSR		MuestraHora

		;; Ahora esperamos el pulso o algun otro cambio
CambiaEstado:	JSR		LeeEstado ; El valor vuelve en el acumulador A
		BEQ		CambiaEstado
		;Mientras el estado sea 0, no cambia nada
		;Cuando el estado no es cero, esperamos a 
		;que el estado sea cero de nuevo
		TAB		; Guardamos el estado en B
CambioEstado0:	JSR		LeeEstado
		BNE		CambioEstado0 ; Mientras no sea 0, esperamos
		
		;Ahora tenemos un estado valido en B. necesitamos saber que hacer
		;asi que lo comparamos
		CMPB		#Pulso
		BEQ		CaseProcesarPulso
		CMPB		#MasSegundo
		BEQ		CaseIncrementaSegundo
		CMPB		#MenosSegundo
		BEQ		CaseDecrementaSegundo
		CMPB		#MasMinuto
		BEQ		CaseIncrementaMinuto
		CMPB		#MenosMinuto
		BEQ		CaseDecrementaMinuto
		CMPB		#MasHora
		BEQ		CaseIncrementaHora
		CMPB		#MenosHora
		BEQ		CaseDecrementaHora

		BRA		Main

CaseIncrementaSegundo
		JSR		IncrementaSegundo
		BRA		Main
CaseDecrementaSegundo
		JSR		DecrementaSegundo
		BRA		Main
CaseIncrementaMinuto
		JSR		IncrementaMinuto
		BRA		Main
CaseDecrementaMinuto
		JSR		DecrementaMinuto
		BRA		Main
CaseIncrementaHora
		JSR		IncrementaHora
		BRA		Main
CaseDecrementaHora
		JSR		DecrementaHora
		BRA		Main


CaseProcesarPulso:
		JSR		ProcesarPulso
		BRA		Main
;; Subrutina Muestra Hora
;;	Toma los valores de Hora:Minuto:Segundo
;;	y los muestra por el display
MuestraHora:

		;;Guardo A
		PSHA
	
		;;Limpio el LCD
		CLR		LCDDATA
		;;Empiezo convirtiendo Hora a Ascii
		LDAA		Horas
		LSRA
		LSRA
		LSRA
		LSRA
		ADDA		#$30
		STAA		LCDDATA ; Muestra el digito mas significativo de hora
		LDAA		Horas
		ANDA		#$0F    ; Borro los 4 bits superiores
		ADDA		#$30
		STAA		LCDDATA
		LDAA		#':'
		STAA		LCDDATA

		;;Repito para minuto

		LDAA		Minutos
		LSRA
		LSRA
		LSRA
		LSRA
		ADDA		#$30
		STAA		LCDDATA ; Muestra el digito mas significativo de Minuto
		LDAA		Minutos
		ANDA		#$0F    ; Borro los 4 bits superiores
		ADDA		#$30
		STAA		LCDDATA
		LDAA		#':'
		STAA		LCDDATA

		;;Repito para Segundo

		LDAA		Segundos
		LSRA
		LSRA
		LSRA
		LSRA
		ADDA		#$30
		STAA		LCDDATA ; Muestra el digito mas significativo de hora
		LDAA		Segundos
		ANDA		#$0F    ; Borro los 4 bits superiores
		ADDA		#$30
		STAA		LCDDATA

		;;Recupero A
		PULA
		RTS
		
;; Subrutina LeeEstado
;;	Devuelve en el acumulador A el valor de entrada
LeeEstado:	LDAA		PORTC
		RTS

;; Subrutina ProcesarPulso
;;	Esta subrutina incrementa el valor de segundo.
;;		Si el valor es 60, pone en 0 e incremenenta minuto
;;		Si el valor es 60, pone en 0 e incrementa hora
;;		Si el valor es 24, pone en cero

ProcesarPulso:
		;;Guardamos A
		PSHA
		
		LDAA		Segundos
		INCA		
		DAA
		STAA		Segundos
		CMPA		#$60
		BNE		FinPulso
		CLR		Segundos
		LDAA		Minutos
		INCA
		DAA
		STAA		Minutos
		CMPA		#$60
		BNE		FinPulso
		CLR		Minutos
		LDAA		Horas
		INCA
		DAA
		STAA		Horas
		CMPA		#$24
		BNE		FinPulso
		CLR		Horas

FinPulso:
		PULA
		RTS	

;; Subrutinas de incremento y decremento. Son todas muy parecidas
IncrementaSegundo:
		PSHA
		LDAA		Segundos
		INCA
		DAA
		STAA		Segundos
		CMPA		#$60
		BNE		FinIncSeg
		CLR		Segundos
FinIncSeg	PULA
		RTS

DecrementaSegundo:
		PSHA
		LDAA		Segundos
		LDAB		#$59
		JSR		DecrementaBCD
		STAA		Segundos
FinDecSeg	PULA
		RTS


IncrementaMinuto:
		PSHA
		LDAA		Minutos
		INCA
		DAA
		STAA		Minutos
		CMPA		#$60
		BNE		FinIncMin
		CLR		Minutos
FinIncMin	PULA
		RTS

DecrementaMinuto:
		PSHA
		LDAA		Minutos
		LDAB		#$59
		JSR		DecrementaBCD
		STAA		Minutos
FinDecMin	PULA
		RTS


IncrementaHora:
		PSHA
		LDAA		Horas
		INCA
		DAA
		STAA		Horas
		CMPA		#$24
		BNE		FinIncHor
		CLR		Horas
FinIncHor	PULA
		RTS

DecrementaHora:
		PSHA
		LDAA		Horas
		LDAB		#$23
		JSR		DecrementaBCD
		STAA		Horas
FinDecHor	PULA
		RTS

;;	Subrutina DecrementaBCD
;;		Recibe un numero BCD en A, y el valor a reemplazar
;;		cuando decrementa 00 en el acumulador B
DecrementaBCD:
		CMPA		#$00
		BNE		NoEsCero
		TBA
		RTS

NoEsCero:
		TAB
		ANDA		#$0F
		BNE		Decrementa
		;; El valor es xxxx0000, asi que necesitamos 0000xxxx
		TBA
		LSRA
		LSRA
		LSRA
		LSRA
		DECA
		LSLA
		LSLA
		LSLA
		LSLA
		ADDA		#$09
		RTS

Decrementa	
		TBA
		DECA
		RTS

		ORG		RESET
		DW		Init