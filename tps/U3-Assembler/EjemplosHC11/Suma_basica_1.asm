*AQUI COMIENZA LA DEFINICION DE VARIABLES
                        ORG $0000
OP1                     RMB     1
OP2                     RMB     1
RESULTADO               RMB     2

*AQUI COMIENZA EL PROGRAMA

                        ORG $C000
INICIO
                        CLR     RESULTADO
                        LDAA    OP1
                        LDAB    OP2
                        ABA
                        STAA    RESULTADO+1
                        BCC     SIGUE
                        INC     RESULTADO
SIGUE

FIN                     BRA     FIN

*AQUI TERMINA EL PROGRAMA. A CONTINUACION LE ASIGNO VALORES A LAS VARIABLES

                        ORG     OP1
                        DB      $55,$35

*AQUI CARGO EL  VECTOR DE RESET QUE LE INDICA AL SIMULADOR EN QUE
*DIRECCION INICIA EL PROGRAMA

                        ORG     $FFFE
                        DW      INICIO
