# EDA 19/05/21
#### DNI : **.***.**8

## 1. 
cant. operaciones = 2^(bits de palabra) = 2^4
bus de direcciones = 8
acceso primer operando = indirecto
acceso segundo operando = indirecto
bus de datos = palabra = bus de direcciones / 2 = 4
frecuencia de reloj = ? => freq/17c = 4MIPS => freq = 4*17 => freq = 68
eficiencia = 4 MIPS
ejecucion = 3 ciclos
decodificacion = 2 ciclos
acceso memoria = 1 ciclo

Formato instruccion = Cod. op (4 bits) | Dir DRO OP1 (8) | Dir. DRO OP2 (8)
|etapa | m | c |
|------|---|---|
|fetch | 1 | 1 |
|decod | 0 | 2 |
|DirDRO| 2 | 2 |
|DRO O1| 2 | 2 |
|O1    | 1 | 1 |
|DirDRO| 2 | 2 |
|DRO O2| 2 | 2 |
|O2    | 1 | 1 |
|ejecu | 0 | 3 |
|store | 1 | 1 | Al no especificarse donde se guarda lo dejo en la direccion del OP2
|------|---|---|
|total | 12| 17|

## 2.
	1)
	xx= 1.9Volts
	zz= 8,9Volts
	
	2)
	Utilizaria 'zz'.
	
	3)
	 Ya que tiene una alta tolerancia al ruido.
	 En cambio, con 'xx' con un ruido de 2V esta ya no seria util.
	
	4)
	Con un ruido de 1V no ocurriria nada en ningun circuitos.
	
	5)
	Con un ruido de 10V ambos circuitos serian inutiles.
	Esto se debe a que no diferencian una entrada Low de una High.

## 3.
2^41 = 2^1 * 2^40 = 2 * 1TB = 2TB

## 4.
Algunas lineas del bus de direcciones se usan para memoria y otras para E/S.
El espacio de direccionamiento de memoria y E/S esta compartido.

## 5.
Mi DNI = 41920908
0x41920908 en big endian
8 bits = 1 byte = 2 digitos hexa
direcciona 1M palabras = 2^20 => 5 caracteres hexa

0xFFFFC -> $41
0xFFFFD -> $92
0xFFFFE -> $09
0xFFFFF -> $08

## 6.
MIN = 0ns (ej: un cable que conecte una entrada directamente con F)
MAX = 3*41ns = 123ns (ej:siguiente cuadrito)
   41ns  41ns     41ns = 123ns	
		 ___		
A--|>o--|AND\____
B-------|___/	 |__ 
		 ___	  __)>--- F
C-------|AND\____|
D-------|___/
     ___
A --|   |
B --|   |__ F  
C --|   |
D --|___|

## 7.
En el tipo estrella los distintos bloques funcionales se relacionan entre si a travez de canales individuales. Esto significa que la MP se relaciona con la CPU de manera individual y a su vez estos 2 tmb se conectan individualmente con las entradas y salidas del sistema.
Por otro lado, en el esquema tipo bus la MP y las interfaces de E/S comparten un bus con el cual se comunican a travez de este con la CPU

## 8.
El Registro de Instruccion (IR) tiene la funcion de almacenar el Codigo de Operacion obtenido durante la etapa fetch de la instruccion. Este es luego enviado al decodificador para proseguir con la siguiente etapa.
Este pertenece a la estructura, ya que no es accesible al programador.
Este es unidireccional (recibe data proveniente del MBR a traves del bus interno de la cpu) y la envia hacia la el decodificador.
No requiere tercer estado.
Se utiliza durante la etapa fetch (la primera) de la instruccion.

## 9.
4 buses.
memoria 2 ciclos
E/S 100 ciclos.
Conviene usar buses sincronicos ya que su implementacion es mas simple (no requiere señales master slave las cuales son dificiles de implementar).
No se adapta al bloque mas lento ya que usa un esquema de 4 buses, señales de control indican si se accede a MP o E/S.

## 10.
indexado = utiliza un registro indice al cual se le suma un offset. Este puede admitir un offset positivo o tambien admitir negativos. Depende la computadora.

paginado = utiliza un registro de pagina al cual se le concatena un offset. La parte alta de la direccion (contenida en el registro de pagina) actua como pagina y la parte baja (offset) actua como linea dentro de cada pagina.

## 11.
FO = 2

Modelo 1. Imposible implementarlo debido al Fan Out (La NOT se conecta a mas de 2 compuertas cuando su Fan Out es 2)

Modelo 2. Se puede conectar ya que ninguna salida de una compuerta se conecta con mas de 2 entradas. Sin embargo, el retardo de las compuertas AND es distinto. El retardo de la compuerta AND con entrada A es inferior al de la compuerta AND con entrada B. Lo mismo sucede con la ultima AND (la de la entrada C).

Modelo 3. Es el modelo idoneo ya todas las compuertas son validas (su FO jamas supera a 2) y el retardo de las AND es el mismo.
--------------------------------------------------------------------------------
## 1.
La CPU requiere intrucciones especiales para acceder a E/S
El direccionamiento de memoria principal y E/S esta separado.

## 2.
R0 = R1

Instruccion ALU = 00001001

## 3.
tension de alimentacion = 5V
corriente en alto = 41ma
corriente en bajo = 08ma
FF D operan con flanco descendente
señal A con 50% dc.


A|FF1|FF2|FF3|FF4|OR |NOR1|NOR2|AND|NOT|
-|---|---|---|---|---|----|----|---|---|
1| 0 | 0 | 0 | 0 | 1 | 1  |  1 | 1 | 1 |(0)
0| 1 | 0 | 0 | 0 | 0 | 0  |  1 | 0 | 1 |(1)
1| 1 | 0 | 0 | 0 | 0 | 0  |  1 | 0 | 1 |(2)
0| 0 | 1 | 0 | 0 | 0 | 0  |  1 | 0 | 1 |(3)
1| 0 | 1 | 0 | 0 | 0 | 0  |  1 | 0 | 1 |(4)
0| 0 | 0 | 1 | 0 | 0 | 1  |  0 | 0 | 1 |(5)
1| 0 | 0 | 1 | 0 | 0 | 1  |  0 | 0 | 1 |(6)
0| 0 | 0 | 0 | 1 | 1 | 1  |  0 | 1 | 0 |(7)
1| 0 | 0 | 0 | 1 | 1 | 1  |  0 | 1 | 0 |(8)
0| 1 | 0 | 0 | 0 | 0 | 0  |  1 | 0 | 1 |(9)
...De aca en mas repite patron

Por lo tanto el dutycicle de la compuerta NOT
es 80% en High y 20% en Low.

Potencia disipada es 5V . (0,8 * 41ma + 0,2 * 08ma) = 172mW

