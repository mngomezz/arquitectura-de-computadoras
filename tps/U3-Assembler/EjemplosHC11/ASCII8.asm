
;; Template: Esqueleto de programa ASM para MC68HC11
;;	Declaracion de valores fijos

RAM		EQU		$0000
ROM		EQU		$C000
RESET		EQU		$FFFE
LEDS		EQU		$1004
BOTONES		EQU		$1003
;; Declaro la posicion de memoria del LCD. Asegurarse que
;; este activo en el Memory Configuration Tool
LCD		EQU		$1040

		ORG		ROM
MAIN
		LDS		#$00FF
		LDX		#Frase1
		JSR		PrintLCD

		;;Leemos el numero de los botones
		LDAA		BOTONES
		;;Lo mostramos en los LEDS
		STAA		LEDS

		;;Imprimimos el numero
		LDX		#Frase2
		JSR		PrintLCD
		
		;; El numero esta en A, lo pasamos a B
		TAB
		JSR		PrintNum

		

		
FIN		BRA		FIN

;; Funcion PrintNum
;;    Recibe un numero en B y lo imprime en ASCII
;;    Usando el LCD
PrintNum:

		;;Dado que usamos varios registros (A,B,X)
		;;Los guardamos ya que seran modificados
		PSHA
		PSHB
		PSHX

		;;Preparamos los numeros
		CLRA
		LDX		#10
		IDIV
		ADDB		#$30
		PSHB
		XGDX
		LDX		#10
		IDIV
		ADDB		#$30
		PSHB
		XGDX
		LDX		#10
		IDIV
		ADDB		#$30

		;; Ahora podemos imprimir
		CMPB		#$30
		BEQ		PrintNum_skip
		STAB		LCD
		BRA		PrintNum_Decena
PrintNum_Skip
		;;Paso intermedio para verificar que el numero no sea 001, 002...009
		;; En este paso, las centenas son $30, por ende si la decena es $30
		;; Directamente mostramos la unidad
		PULB
		CMPB		#$30
		BEQ		PrintNum_Unidad
		STAB		LCD
		BRA		PrintNum_Unidad

PrintNum_Decena	PULB
		STAB		LCD
PrintNum_Unidad PULB
		STAB		LCD

		;;Dado que esta impreso el numero
		;;Recuperamos los valores del stack
		PULX
		PULB
		PULA
		RTS
	


;; Funcion PrintLCD
;;    Recibe en X la direccion de memoria del texto
;;    que debe finalizar con 0. 
PrintLCD:

	;;Dado que el estado de X y A va a ser modificado
	;;Guardamos los mismos en el stack para volver
	;;Con los valores originales y reiniciamos el LCD
		PSHA
		PSHX
		CLR		LCD

	;; Ahora comenzamos a imprimir el texto
PrintLCD_Loop:
		LDAA		0,X
		BEQ		PrintLCD_FIN
		STAA		LCD
		INX
		BRA		PrintLCD_Loop

PrintLCD_FIN
		PULX
		PULA
		RTS		



Frase1		FCC		"Ingrese un numero:"
		DB		0

Frase2		FCC		"Su numero es:"
		DB		0

		ORG		RESET
		dw		main