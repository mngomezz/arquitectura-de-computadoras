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
			ldd	var1
			addd	var2

			bcc	sigue
			inc     res
sigue
	 		std	res+1






fin			bra	fin


			ORG	var1
			dw 	$7a3c,$f54a

			ORG	VRST
			dw	inicio			

