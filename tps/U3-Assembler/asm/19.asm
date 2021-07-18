RWM		EQU	$0000
ROM		EQU	$C000
RESET	EQU	$FFFE

		ORG	RWM
VEC_INI		RMB	2 ; direccion de inicio del vector
VEC_SIZE	RMB	1 ; cantidad de elementos del vector a recorrer
VEC_PTR		RMB 2 ; puntero al nuevo vector que voy a generar

		ORG	ROM
inicio
		LDX		VEC_INI ; Cargo en IX la posicion de inicio del vector
		LDAB	VEC_SIZE ; cargo en B el total de elementos a recorrer
loop
		LDAA	0,X ; carga elemento del vector en Acc. A
* -----------------------------CHEQUEO SI ES MINUSCULA-----------------------------	
		CMPA	#'a
		BLT		isMayus	; si es mas chico que 'a chequeo si es mayuscula
		CMPA	#'z
		BLT		Agrega	; si es mas chico que 'z (y mas grande que 'a) agrego a nuevo vec
* -----------------------------CHEQUEO SI ES MAYUSCULA-----------------------------
isMayus	CMPA	#'A
		BLT		isNum	; si es mas chico que 'A chequeo si es numero
		CMPA	#'Z
		BLT		Agrega	; si es mas chico que 'Z (y mas grande que 'A) agrego a nuevo vec
* -----------------------------CHEQUEO SI ES UN NUMERO-----------------------------
isNum	CMPA	#'0	
		BLT		next	; si es mas chico que '0 no agrego y chequeo siguiente
		CMPA	#'9
		BLT		Agrega	; si es mas chico que '9 (y mas grande que '0) agrego a nuevo vec
* -----------------------------PASO AL SIGUIENTE ELEMENTO-----------------------------
next	CMPB	#0		; chequeo si hay elementos por recorrer
		BEQ		fin		; si no, entonces salgo
		DECB			; decremento elementos restantes por recorrer
		INX				; incremento indice del array (IX)
		BRA		loop

* -----------------------------AGREGO ELEMENTO A NUEVO VECTOR-----------------------------
Agrega	LDY	VEC_PTR		; cargo puntero a vector nuevo en IY
		STAA	0,Y		; meto elemento actual del vector recorrido en el nuevo vector
		INY				; incremento Y (puntero a vector nuevo)
		STY	VEC_PTR		; guardo nueva posicion del puntero a vector nuevo (incrementada)
		BRA	next		; chequeo siguiente

fin		BRA	fin


		ORG	RWM
		dw	$0030	; direccion del vector
		db	$10		; tamaño del vector
		dw  $0050	; direccion del vector a generar
		ORG	$0030
		db	'0,'@,'h,'=,'},'O,'<,'>,'L,'{,'/,'a,'1,'4,'?,'s