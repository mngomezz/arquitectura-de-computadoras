			ORG $0000
; organizar la memoria
var_1			RMB	1 ; DE 8 BITS A PARTIR DE LA POSICION DE MEMORIA DE ORG $0000
;unsigned char  var_1;

var_2			RMB     2
;unsigned int var_2;

vector			RMB	20 ;
;unsigned char vector [20];

tabla			db	$34,$55,'B
;unsigned char const tabla[] = {0x34, 0x55, 'B'};

tabla1			dw	$f456,$8900,16532,127
;unsigned sort const tabla1[] = {0xf456,0x8900,16532,127}


;#define  WORD		2
WORD			EQU 	2

			



			ORG $C000



main			LDAA  #'A 



			ORG	$fffe
			dw	MAIN