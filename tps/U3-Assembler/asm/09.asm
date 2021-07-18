RAM	    EQU	$0000
ROM	    EQU	$C000
RESET	EQU	$FFFE
NBYTES  EQU 15

        ORG	RAM
varP	RMB	NBYTES
varQ	RMB	NBYTES
varS	RMB	NBYTES+1

        ORG	ROM
init	
        CLR	varS             ; limpio los bytes donde se almacenara el resultado
        CLC	                 ; limpio el bit de carry, para no "contaminar" la cuenta
	LDX     #varP+(NBYTES-1) ; cargo en acumulador X el ultimo byte de varP (ver en excel)
        LDAB    #NBYTES 	 ; cargo longitud de los operandos en acc B
loop    
        LDAA    0,X	         ; cargo en A el contenido de X (byte de varP)
        ADCA    NBYTES, x    	 ; sumo el acc A con el contenido de X con offset NBYTES (byte de varQ)
	    STAA    (NBYTES*2)+1,x   ; deposito el acc A en el contenido de X con offset NBYTES*2 +1 (byte de varS)
        DEX                      ; decremento X  (direccion apuntada)
        DECB		 	 ; decremento cantidad de bytes que restan sumar.
        BNE     loop             ; continuo loopeando si la cant. de bytes que restan sumar es distinta a 0.
        BCC     fin              ; Si el ultimo carry es distinto a 1 salto al fin del programa
        INC     varS             ; agrego 1 al MSB de varS
fin	BRA	fin              ; un BRA con offset -2 (loop infinito)

        ORG	RESET
        dw	init	; dw = dump word