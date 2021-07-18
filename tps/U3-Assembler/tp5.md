# Unidad 3: Introduccion a los lenguajes de programacion

## TP5: Programacion en Lenguaje Simbolico (procesador 68HC11)
 _____________________________________________________________________
|Indexado (IND,X e IND,Y) Seguida del offset a X,Y --> Ej: LDAA 1,X   |
|Extendido (EXT) Seguido de la DRO(HHLL)           --> Ej: LDAA $2001 |
|Directo (DIR) Operando en pagina 0 ($00-$FF)      --> Ej: LDAA $01   |
|Inmediato (IMM) Operando obtenido del PC          --> Ej: LDAA #01   |
|Relativo (REL) Saltos(BRA) al PC (-128,127)       --> Ej: BRA $FE    |
|Inherente (INH) No requiere accesos a memoria     --> Ej: INX        |
|_____________________________________________________________________|


### 01
- Indicar qué hace el procesador cuando ejecuta las siguientes instrucciones. Especificar los registros de la CPU, las posiciones de memoria involucradas, y los bits del registro de estado que se modifican. Escribir cada instruccion en lenguaje de maquina.
LDAB #$25  Carga el acum. B de manera inmediata.N,Z varian y V=0.
LDAB $25   Carga el acum. B de manera directa. N,Z varian y V=0.
LDAB 25    Carga el acum. B de manera directa. N,Z varian y V=0.
LDAB $2525 Carga el acum. B de manera extendida. N,Z varian y V=0.
LDAB $25,X Carga el acum. B de manera indexada a X. N,Z varian y V=0.
ADDA #$EA  Suma al acum. A lo obtenido de manera inmediata. H,N,Z,V y C varian
ADDA $EA   Suma al acum. A lo obtenido de manera directa. H,N,Z,V y C varian 
ADDA $EA,X Suma al acum. A lo obtenido de manera indexada a X. H,N,Z,V y C varian
ADDA $46EA Suma al acum. A lo obtenido de manera extendida. H,N,Z,V y C varian
CBA        Compara acum. A con acum. B. N,Z,V y C varian.
BCC $10    Salta si C = 0. No varia el estado.
BGE $F7    Salta si es mayor o igual (N+V=0). No varia el estado.
BSR $65    Salta a subrutina obtenida de manera directa. No varia el estado.


### 02 
- Indicar cual de las siguientes instrucciones son validas
LDAB 	#$25
LDAB 	$25
LDAB 	25
LDAB 	#$2525  INVALIDO
LDD		$225,X  INVALIDO
LDD		225,Y   INVALIDO
LDAA 	#$2525  INVALIDO
LDD 	#$2525
ADDA	#$EA
ADDA	$EA
ADDA	$EEAA,X INVALIDO
ADDA	$46EA
BCC 	$100    INVALIDO
BGE 	100
BSR 	#$65 INVALIDO


### 03
- Indicar contenidos de los acumuladores A y B y las posiciones de memoria 00F5, 00F7, 00F8 luego de la ejecucion de estas instrucciones si los contenidos iniciales de las direcciones de memoria son respectivamente 00F5:08, 00F7:12. Indicar que hace el programa 
INICIO  CLRA
        LDAB    $F5
otro    ADDA    $F7     
        DECB
        BNE     otro
        STAA    $F8
        BRA     *       
Al final del programa queda: A:A2 B:00 F5:08 F7:12 F8:A2.
El programa suma el contenido de 00F7(12) tantas veces como el numero de 00F5(8).
Para esto, usa los acumuladores A y B. Por ultimo, el resultado lo guarda en F8(A2).


### 04
- Interpretar los contenidos de las siguientes posiciones de memoria, en donde hay un fragmento de programa. Indicar cual es el contenido sucesivo de los registros del procesador. Indicar que posiciones de memoria sufren alteraciones en sus contenidos.
Los datos iniciales son:
PC:4000     SP:0080     IX:2000     A:55    B:FF    PSW:07
3000 4F C6 00 E7 00 08 5A 4A 81 00 26 F7 39
4000 BD 30 00 20 FE

Para los planteos que se detallan a continuación, se pide: 
    - Realizar los diagramas de flujo. KJKJ NI AHI
    - Plantear los programas en lenguaje simbólico (mnemónicos) y 
    - Escribir el programa en lenguaje de máquina, para una CPU del tipo del 68HC11. Indicar las suposiciones que se realizan y justificar el algoritmo empleado. 

MEMORIA OPCODE  MNEMONICO   QUE-HACE
4000    BD      JSR         Salta a subrutina con direccionamiento extendido.
4001    ..      30          'hh' de la direccion a donde se salta.
4002    ..      00          'll' de la direccion a donde se salta.
4003    20      BRA         Salta siempre. Direccionamiento relativo.
4004    ..      FE          offset aplicado al PC a donde se salta(-2).
------------------------------------subrutina------------------------------------
3000    4F      CLRA        Limpia el acumulador A.
3001    C6      LDAB        Carga el acumulador B con lo apuntado por el PC.
3002    ..      00          operador a cargar en el acumulador B.

3003    E7      STAB        Guarda el contenido de B en la direccion del reg.X + offset.
3004    ..      00          Offset aplicado al indice X.
3005    08      INX         Incrementa el registro X.
3006    5A      DECB        Decrementa el registro B.
3007    4A      DECA        Decrementa el registro A.
3008    81      CMPA        Compara el acumulador A con lo apuntado por el PC.
3009    ..      00          operador a comparar con el acumulador A.
3010    26      BNE         Salta si no son iguales (Z=0).
3011    ..      F7          offset aplicado al PC a donde se salta(-9).
3012    39      RTS         Retorna desde la subrutina.


### 05
- Realizar  la  operación  s  =  p  +  q  -  r,  siendo los  datos  las  posiciones  de memoria  en  donde  se  hallan  los  operandos  y  en  donde  se  almacena  el resultado.

[Resolucion 05](./asm/05.asm)

### 06
- Realizar la sumatoria s = n1 + n2 + n3 + ... + nn, siendo datos las direcciones de n1, nn y s.

[Resolucion 06](./asm/06.asm)

### 07
- Idem anterior, siendo datos las direcciones de n, n1 y s. (n = cantidad de sumandos).

[Resolucion 07](./asm/07.asm)

### 08
- Realizar la operación s = p + q, siendo p y q números de 16 bits. Los datos son las direcciones del MSB de p, de q y de s. (MSB : byte más significativo)

[Resolucion 08](./asm/08.asm)

### 09
- Realizar  la  suma  de  dos  números  binarios  de  cualquier  longitud.  Los operandos pueden ser positivos o negativos. Los datos son las direcciones de los MSB de los operandos y del resultado, y la dirección en donde se halla la longitud de los operandos.

[Resolucion 09](./asm/09.asm)

### 10
- Dados 3 números binarios sin signo, hallar el máximo.

[Resolucion 10](./asm/10.asm)

### 11
- Dado  un  número  con  signo,  devolver  el  módulo  o  valor  absoluto  del mismo. Suponer que los negativos se almacenan en complemento a la base. 

[Resolucion 11](./asm/11.asm)

### 12
- Dada  una  lista  de  números  binarios  en  memoria, ordenarlos  en  forma creciente en los mismos lugares de memoria, siendo conocidas las direcciones del primer y del último dato en memoria.

[Resolucion 12](./asm/12.asm)

### 13
- Repetir  el  ejercicio  anterior  considerando  conocidas  la  dirección  del primer dato y la cantidad total de datos.

[Resolucion 13](./asm/13.asm)

### 14
- Dado  un  número  binario  de  8  bits,  almacenado  en  una  posición  de memoria conocida, convertir el mismo en dos caracteres ASCII representativos de los dos dígitos hexadecimales que lo forman. (las representaciones literales de  los  6  últimos  dígitos  hexadecimales  deberán  ser  letras  mayúsculas).  Los resultados se almacenan en direcciones de memoria también conocidas.

[Resolucion 14](./asm/14.asm)

### 15
- Se  desea  convertir  a  decimal  un  numero  binario  de  ocho  bits almacenado  en  la  posición  de  memoria  $0000.  El  resultado  debe  quedar almacenado de la siguiente forma:

Posición $0001 = CENTENAS.
Posición $0002 = DECENAS
Posición $0003 = UNIDADES.

[Resolucion 15](./asm/15.asm)

### 16
- Se desea evaluar el dato almacenado en la posición de memoria $0000. Para ello en la posición de memoria $0001 debe aparecer almacenado: 
- “>” si el valor es mayor que 128.
- “=” si el valor es 128.
- “<” si el valor es menor a 128.

[Resolucion 16](./asm/16.asm)

### 17
- Dado un vector formado por elementos numéricos naturales, del que se conocen la dirección de su primer elemento y la dirección del ultimo elemento, encontrar el valor máximo incluido en el mismo. Si el valor dado se encuentra una sola vez, indicar la posición del mismo dentro del vector. Si se encuentra más de una vez, indicar la posición en que se lo encontró por primera vez y la cantidad de veces que se repite dicho elemento.

[Resolucion 17](./asm/17.asm)

### 18
- Dado un vector formado por elementos numéricos naturales, del que se conocen la dirección de su primer elemento y la dirección del ultimo elemento, determinar si el mismo contiene un valor numérico que se conoce como dato. Si el valor dado se encuentra una sola vez, indicar la posición del mismo dentro del vector. Si se encuentra más de una vez, indicar la posición en que se lo encontró por primera vez y la cantidad de veces que se repite dicho elemento. Si no se lo encuentra, indicar dicha circunstancia de alguna forma visible.

* Similar al 17...cambiarian un par de cositas
[Resolucion 18](./asm/18.asm)

### 19
- Dado un vector formado por caracteres ASCII, del que se conocen la dirección  de  su  primer  elemento  y  la  cantidad  de  elementos,  obtener  otro vector en el que solamente se incluyan aquellos caracteres del primero que representen letras y/o números. 

[Resolucion 19](./asm/19.asm)

### 20
-  Mediante  el  uso  de  un  vector,  programar  un  decodificador  BCD  a  7 segmentos, de acuerdo con lo visto en la práctica de circuitos combinatorios. Cuantos elementos requiere el vector en cuestión?

### 21
- Desarrollar un programa que funcione como “reloj de tiempo real”. Con tal  objetivo  se  requerirá  que  almacene  en  BCD  las  horas  (en  formato  24), minutos  y  segundos,  valiéndose  del  cambio  de  estado  de  la  posición  de memoria $0000  (la  que,  de alguna manera que no nos interesa, cambia  su valor entre 0 y 1 cada 500 mseg). Tomando ese cambio como base de tiempo, realizar las rutinas para hacer funcionar el programa como un reloj. Cuando se produce  un  cambio  es  necesario  almacenar  un  $00  para poder  esperar  el próximo cambio.

### 22
-  Una  computadora  basada  en  el  microcontrolador  68HC11  tiene conectados  ocho  pulsadores  en  un  dispositivo  mapeado  en  la  posición  de memoria  $0080.  Al  leer  esa  posición  de  memoria,  si  un pulsador  esta presionado, fuerza un cero lógico en el bit asociado y cuando no lo está, se lee un uno lógico. Cada pulsador está conectado a cada uno de los bits de esa posición  de  memoria. Se  desea  generar  un  programa  que  mediante  las instrucciones BRSET y BRCLR permita discriminar qué pulsador está presionado, teniendo en cuenta que al detectarse más de un pulsador presionado escriba un código de error en la posición de memoria $0000 (“E”). En caso contrario, deberá escribir en la posición mencionada el código ASCII correspondiente al número del pulsador seleccionado (entre 0 y 7).

### 23
- Una  empresa  desea  construir  un  tablero  de  BINGO  basado  en  un microcontrolador 68HC11. Como elemento de entrada se informa el número de la  bolilla  extraída,  el  que  aparece  expresado  en  BCD  empaquetado  en  la posición de memoria $0000.  A medida que van saliendo las bolillas deberá ponerse en uno un bit que se corresponda con el número de bolilla. Es decir que se dispone de tantos BITS de memoria como bolillas existen en el juego del BINGO. Cada bit puesto en 1 enciende una lámpara. Al comenzar el juego todos los bits deben estar en cero y se pueden utilizar las posiciones de memoria necesarias a partir de la posición de memoria $0002. En caso de detectarse dos veces la misma bolilla debe escribirse en la posición de memoria $0001 la letra “E”, caso contrario esa posición de memoria debe tener una “N”. Se recomienda utilizar instrucciones BSET y BCLR. 
Se pide:  
    - determinar cuántas bolillas tiene un juego de BINGO.
    - cuántas posiciones de memoria son necesarias.
    - Escribir el programa que administre el funcionamiento del tablero.

## TP6: Programacion en Lenguaje Simbolico II. Programacion avanzada.
- Introducción al problema 
Una variable es una posición de memoria que puede ser leída y escrita. Desde un lenguaje de  alto nivel se le indica  al compilador el tipo de dato al que pertenece una variable. El tipo de dato indica el tamaño a reservar, es decir, la cantidad  de  bits  que  debe  ocupar  la  variable  y  cómo  se  decodificará  el patrón de bits hallado en esa posición de memoria. La misma palabra binaria tiene significado diferente dependiendo del tipo de dato de la variable. Para la electrónica son solo señales representadas por ceros y unos, es el programador el que asigna un sentido especial a cada palabra de ceros y unos.

- Objetivos
Relacionar el concepto de tipo de dato en alto nivel con bajo nivel. Evidenciar los  efectos  de  intentar  sobrepasar  la  capacidad  en bits  de  una  variable declarada de un tipo. Afirmar el concepto de overflow en la representación interna de números enteros y caracteres.

- Enunciados

### 01
-  Dado  el  programa  en  C++  que  se  adjunta,  realizar  su  equivalente  en lenguaje  simbólico  y  lenguaje  de  máquina  del  HC11(operaciones  y asignaciones,  no  entradas  y  salidas).  Observar  las salidas  de  C++  y  que  los únicos  mensajes  del  compilador  se  refieren  al  warning  “Conversion may lose significant digits”. Explicar y mostrar la razón de las salidas obtenidas. 


/**/
#include <iostream.h>
#include <conio.h>
#include <math.h>
//Ejemplos de overflow
void main(void)
{
    short i;
    int ii;
    long l;
    float f;
    char c;
    cout << "Presionar cualquier tecla para avanzar" << endl; getch();
    i = 32767;
    i++;
    cout << endl << "32767 + 1 como short da " << i << endl; getch();
    ii = 32767;
    ii++;
    cout << endl << "32767 + 1 comoint da " << ii << endl; getch();
    ii = pow(2, 31);
    ii++;
    cout << endl << "2^31 como int da " << ii << endl; getch();
    l = pow(2, 31);
    l++;
    cout << endl << "2^31 como long da " << l << endl; getch();
    i = -32768;
    i--;
    cout << endl << "-32768 - 1 como short da " << i << endl; getch();
    i = 45000;
    cout << endl << "i = 45000 como short da " << i << endl; getch();
    i = 32000 + 25000;
    f = i;
    cout << endl << "32000 + 25000 como entero ==> " << i << endl;
    cout << endl << "32000 + 25000 como real ==> " << f << endl; getch();
    f = 32000 + 25000;
    i = f;
    cout << endl << "32000 + 25000 como entero ==> " << i << endl;
    cout << endl << "32000 + 25000 como real ==> " << f << endl; getch();
    c = 'A';
    cout << endl << "la A como char da " << c << endl; getch();
    c = 65;
    cout << endl << "c = 65 como char da " << c << endl;
    c = 321;
    cout << endl << "c = 321 como char da " << c << endl;
    c = -191;
    cout << endl << "c = -191 como char da " << c << endl;
    c = 128;
    cout << endl << "c = 128 como char da " << c << endl;
    c = -128;
    cout << endl << "c = -128 como char da " << c << endl;
    cout << endl << "Tama" << char(164) << "o de short, int, long, float, char = " 
    << sizeof(short) << ", " 
    << sizeof(int) << ", " 
    << sizeof(long) << ", "
    << sizeof(float) << ", "
    << sizeof(char) << " respectivamente " << endl;
    cout << endl << "Presionar cualquier tecla para terminar" << endl; getch();
}

- Introducción al problema
Los  algoritmos  típicos  para  calcular  productos  y  multiplicaciones  por  sumas sucesivas  o  restas  sucesivas,  pueden  resultar  de  baja  performance  en velocidad cuando se trata de operandos binarios y lenguaje a nivel máquina. Se desarrollan algoritmos alternativos que permitan estadísticamente un mejor desempeño,  basados  en  operaciones  sencillas  para  la  electrónica  y  en  la menor cantidad de iteraciones posibles para llegar al resultado con suficiente precisión.

- Objetivo
Investigar,  analizar  ventajas  y  desventajas  e  implementar  algoritmos  para multiplicar en lenguaje de máquina.

- Enunciados

### 02
- Plantear los algoritmos para multiplicar números de 16 bits, sin signo y con signo, por medio de sumas sucesivas. Implementar en el lenguaje del 68HC11.

### 03
- Plantear los algoritmos para multiplicar números de 16 bits, sin signo y con signo, por medio de sumas y desplazamientos. Implementar en el lenguaje del 68HC11.

### 04
- Existen  varios  métodos  que  permiten  realizar la  operación  de multiplicación  a  bajo  nivel,  cuando  no  se  dispone  de la  instrucción  de multiplicación, que tienden a utilizar operaciones sencillas y a buscar buena performance en velocidad.  Entre ellos se destaca el algoritmo de Booth, cuyo funcionamiento se basa en que, cuando en el multiplicador existen secuencias de ceros o unos, no se requieren sumas sino solamente desplazamientos. Las sumas se realizan cuando se detecta una transición de 0 a 1 o de 1 a 0. Se pide implementar este algoritmo para números de 16 bits, sin signo y con signo, en el lenguaje del HC11.

### 05
- Implementar el algoritmo de multiplicación de números de 16 bits sin y con signo, utlizando la instrucción MUL del H11.

### 06
- Comparar las implementaciones resultantes en los puntos anteriores en cuanto a velocidad (ciclos de máquina), en cuanto a tamaño del programa, utilización de memoria y de registros internos de la CPU. Analizar las ventajas y las desventajas. Establecer los rangos de aplicación y analizar la calidad en legibilidad.