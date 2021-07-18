RAM			EQU	$0000
ROM			EQU	$C000
VRST			EQU	$FFFE

			ORG	RAM
var1			RMB	2
var2			RMB	2
res			RMB	3

			ORG	ROM
inicio			
			;modo inmediato
			ldaa	#127
			ldab	#'B
			ldd	#0017
			
			;directo - extendido
			ldaa	127
			ldab	'B
			ldd	17
			; Indexado X
			ldx	#$0017
			ldaa	0,x
			ldab	1,x
			ldd	2,x
		
			ldx	#$0017
			ldaa	0,x
			inx
			ldab	0,x
			inx	
			ldd	0,x
			




fin			bra	fin


			ORG	var1
			dw 	$7a3c,$f54a

			ORG	VRST
			dw	inicio			

