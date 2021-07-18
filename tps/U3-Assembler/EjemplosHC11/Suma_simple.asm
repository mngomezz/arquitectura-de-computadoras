RAM			EQU	$0000
ROM			EQU	$C000
VRST			EQU	$FFFE

			ORG	RAM
var1			RMB	1
var2			RMB	1
res			RMB	2

			ORG	ROM
inicio			
                        clr	res ; pone en 00 la posicion de memoria RES
			ldaa	var1 ; carga el Acc A con el contenido de la posicion $0000
			adda	var2
			bcc	sigue ; verifica que no haya carry
			inc	res   ,hubo carry por eso le sumo1 al contenido de la posicion RES
sigue			
			staa	res+1

fin			bra	fin


			ORG	var1
			db 	$55,$27

			ORG	VRST
			dw	inicio			

