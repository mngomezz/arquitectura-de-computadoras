; Ejercicio tomado el 31/5/2019, turno mañana.
; Enunciado: 

********************************************************************************************
* Dado un vector en memoria de números signados de 8 bits, del que se conoce dónde está    *
* almacenada la dirección del primer elemento (DIRINI) y dónde está almacenada la cantidad *
* de elementos (CANT), codifique en ensamblador de Motorola 68HC11 una rutina para         *
* buscar el máximo y el mínimo dentro del vector. En una posición de memoria que           *
* denominará ELEMAX deberá guardar el valor máximo y en otra posición de memoria que       *
* denominará ELEMIN deberá guardar el valor mínimo. Además, guardará la dirección del      *
* primer cero que encuentre en el vector en una posición que deberá llamar PRIMCER (si no  *
* hay ningún cero, deberá guardar el valor FFFF). El algoritmo debe contemplar vectores de *
* mas de 500 elementos.                                                                    *
********************************************************************************************

RWM		EQU	$0
ROM		EQU	$C000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Declaración de variables: es muy importante que esto esté correcto.   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		ORG	RWM
dirini		RMB	2		; DEBEN ser 2 bytes (o HT), porque el bus de direcciones es de 16 bits.
cant		RMB	2		; DEBEN ser 2 bytes (o HT), porque debe contemplar vectores de hasta 500 elementos.
elemax		RMB	1		; DEBE ser 1 byte (o HT), porque se pide guardar el valor, no su dirección.
elemin		RMB	1		; DEBE ser 1 byte (o HT), porque se pide guardar el valor, no su dirección.
primcer		RMB	2		; DEBEN ser 2 bytes (o HT), porque se pide guardar la dirección.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fin de la declaración de variables, inicia el programa: ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		ORG	ROM
		LDD	#$FFFF		; Inicializo primcer=$ffff
		STD	primcer

		LDX	dirini		; Nótese que no va #dirini, porque me interesa el contenido de dirini, no su ubicación.
		LDAA	0,X		
		STAA	elemax		; Inicialmente considero que el primer elemento es el máximo
		STAA	elemin		; y también es el mínimo

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fin de la inicialización de variables ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
		
loop		LDAA	0,X		; La primera vez se va leer innecesariamente, pero repito la lectura para meterlo en un "while".
		BNE	no_es_cero	; verifico si el número es cero

; Si estoy acá, es que el número es un cero. 
; Ahora debería verificar que sea el primero. En ese caso, el valor de primcer debe ser $FFFF				
; Para lo cual, voy a utilizar el índice Y (así no "ensucio" los registros que estoy usando).

		LDY 	primcer
		CPY	#$FFFF
		BNE	no_es_primero	; Podría usar "no_es_cero", que apuntan al mismo lugar, pero esto es más descriptivo.
		STX	primcer		; Guardo la posición actual en primcer, porque si estoy acá, es el primero.
no_es_cero
no_es_primero  				

		CMPA	elemax		; Verifico si es mayor al mayor.
		BLE	no_es_max	; Utilizo BLE porque es signado, y quiero que salte también en caso de igualdad.
					; Si no utilizara BLE y utilizara BLT no estaría mal, sólo pisaría una y otra vez los valores repetidos.
					; Si fueran números no signados, debería usar BLS (o BLO, para que pise valores repetidos).
		STAA	elemax
no_es_max

		CMPA	elemin		; Verifico si es menor que el menor.
		BGE	no_es_min	; Ídem comentario anterior, pero para el caso opuesto.

		STAA	elemin
no_es_min
		INX	
		LDD	cant	
		SUBD	#1
		STD	cant
		BNE	loop

; NOTA: Utilizo la variable (de 16 bits) "cant" como contador. 
; Decremento (restando 1, no tenemos una instrucción inherente para eso) en 16 bits y salgo cuando dé cero.
; Podría también sumar el contenido de esa variable al dirini, y apuntaría al final.
; O usar una variable (de 16 bits, claro!) para eso, y no tocar las variables que venían en el enunciado. 
; Cualquiera de las opciones sería adecuada.

fin		BRA	fin


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Lleno el vector, en el ejemplo de 8 posiciones ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	ORG	cant
	DW	8		; Utilizo DW (o FDB) porque guardo 16 bits (ese 8 es $0008)
				; Si utilizara DB (o FCB) estaría mal, porque guardaría $08XX (siendo XX basura que tenga la memoria)
				; Cambiando este número, barremos el vector declarado hasta más adelante
				; (sí, hago un vector muy grande, y leemos hasta donde tengamos ganas).
	ORG	dirini
	DW	$D000		; (ídem comentario anterior)

;;; Con la ayuda de LibreOffice Calc, calculo (usando la fórmula aleatorio.entre(-128;127)) un montón de números aleatorios.
;;; Y con un poquito más de ayuda del editor de textos geany reamplazo \n por , (y cosas por el estilo) hasta llegar a esto:

	ORG	$D000
	DB	11,6,104,-98,-21,74,-61,-68,58,0,125,0,100,-46,5,84,95,45,49,109
	DB	34,-55,-93,-90,96,97,64,58,19,91,115,81,97,-32,98,-40,108,118,-14,-32
	DB	-12,-119,-59,8,-13,91,-12,87,-59,-49,-3,-12,96,18,-52,-14,35,89,13,-111
	DB	-74,60,87,72,0,108,90,31,-124,-107,-33,-10,57,96,73,-24,-110,-17,-13,70
	DB	4,-19,-8,-99,-120,107,90,20,89,-36,22,106,-81,-4,-112,103,60,-78,39,-127
	DB	-91,16,-86,82,-34,-32,119,-52,-109,-77,60,117,-107,-42,21,77,50,-61,5,47
	DB	42,-34,59,-58,55,-93,9,20,23,39,107,-85,44,90,-65,115,95,-126,46,85,33
	DB	108,-5,11,69,90,41,-8,121,14,-124,1,-38,104,14,-20,-72,-64,-109,-62,-45
	DB	-121,-45,105,-110,-34,50,-51,-112,12,-4,-115,123,-90,5,-74,105,-99,87,-106
	DB	-34,-15,69,-77,25,-77,1,-36,-40,117,11,37,41,25,94,15,72,86,120,21,123,8
	DB	-123,-93,2,-66,124,-6,-96,7,70,85,90,-74,-8,-125,50,-33,46,-5,-11,-39,77
	DB	-114,-95,-53,-117,19,-112,-113,117,-110,-74,20,-34,102,105,-102,-85,-1,28
	DB	-90,-73,-4,51,124,-9,29,-7,71,-39,-61,87,-123,77,81,-86,64,-4,4,20,101
	DB	-91,-31,43,-48,40,19,16,122,-99,28,54,119,45,-8,95,-51,116,-57,34,20,-56
	DB	-91,-126,9,55,58,-92,-58,119,-43,96,61,-120,-53,115,-38,112,-77,117,112,3
	DB	84,120,-124,81,-63,-12,-34,-105,27,-59,84,53,67,-92,0,-60,42,-65,57,22
	DB	-79,9,29,71,-11,122,42,100,73,124,-61,90,52,27,-70,125,-12,94,20,-87,-2
	DB	73,-117,24,32,40,118,-61,-82,-98,18,-123,-121,-92,-50,-29,65,-111,31,-55
	DB	-62,-93,-83,-91,-76,-41,4,11,-49,-2,-107,32,11,55,55,93,10,-74,124,-104
	DB	105,104,-90,-73,-102,42,-117,66,111,78,33,-30,46,-57,-127,-39,-72,-110,127
	DB	65,63,102,121,-111,55,34,-77,-104,75,71,90,-83,-120,62,88,24,-12,-54,-110
	DB	87,80,118,52,-83,87,90,102,48,-44,-26,-121,-38,-65,-59,-119,-14,-106,-73
	DB	34,89,-35,2,117,75,-86,120,49,-98,112,-39,3,92,-44,10,21,82,58,-36,-82
	DB	125,52,-17,-5,-12,-78,-6,-107,10,7,-30,121,-108,-127,-87,40,-121,-62,79
	DB	82,-76,-39,23,79,-105,-112,-116,-43,117,-112,122,54,58,-64,-76,30,104,-19
	DB	-105,60,14,33,-95,72,119,22,-67,-96,-80