RAM			EQU	$0000
ROM			EQU	$C000
VRST			EQU	$FFFE

			ORG	RAM
var1			RMB	2
var2			RMB	2
res			RMB	3

			ORG	ROM
inicio			
                        clr	res ; pone en 00 la posicion de memoria RES
			ldaa	var1+1 ; carga el Acc A con el contenido de la posicion $0000
			adda	var2+1
			staa	res+2 ;sume la parte baja del numero
				        	;puede haber quedado el carry en 1
			ldaa	var1
			adca	var2  ;a +M+ cy	
			bcc	sigue
			inc     res
sigue
	 		staa	res+1






fin			bra	fin


			ORG	var1
			dw 	$5527,$f4cb

			ORG	VRST
			dw	inicio			

