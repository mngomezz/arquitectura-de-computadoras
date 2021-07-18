C - Ordenamiento y alineamiento
Bit ordering (big/little endian) | Direccion a guardar
01. big | mas alta
	nro: 4600 -> 0x1234
		0xFE -> $12
		0xFF -> $34
02. big | mas baja
	nro: 305419896 -> 0x12345678
		0x000 -> $12
		0x001 -> $34
		0x002 -> $56
		0x003 -> $78	
03. little | mas baja
	nro: 305419896 -> 0x12345678
		0x000 -> $78
		0x001 -> $56
		0x002 -> $34
		0x003 -> $12
04. big | mas alta
	nro: 305419897 -> 0x12345679
		0xFFC -> $12
		0xFFD -> $34
		0xFFE -> $56
		0xFFF -> $79	
05. little | mas alta
	nro: 305419897 -> 0x12345679
		0xFFC -> $79
		0xFFD -> $56
		0xFFE -> $34
		0xFFF -> $12
06. little | empieza en mitad
	nro: 305419896 -> 0x12345678
		0x7FF -> $78
		0x800 -> $56
		0x801 -> $34
		0x802 -> $12
07. little | termina en mitad
	nro: 305419896 -> 0x12345678
		0x7FC -> $78
		0x7FD -> $56
		0x7FE -> $34
		0x7FF -> $12

08. con dos bytes por palabra simplemente se acortaria las direcciones a la mitad,
    por lo tanto quedarian en cada direccion 4 numeros (ej: $1234 y $5678).
    
09. Tam. de palabra(bytes) | Direccion | Alineada
	4 | 0x00001202 | No
	2 | 0x00001202 | Si
	2 | 0x00001201 | No
	1 | 0x00001200 | Si
	1 | 0x00001201 | Si
	4 | 0x00001204 | Si
	4 | 0x00001205 | No
	2 | 0x00001205 | No

10. palabra de 32 bits (4 bytes)
	LOAD 0xF000 Si
	LOAD 0xF001 No
	LOAD 0xF002 No
	LOAD 0xF003 No
	LOAD 0xF004 Si
	LOAD 0xF005 No

11.
	A. 
		2 accesos a memoria.
		struct Persona { char InicialNombre; char InicialApellido; unsigned int DNI; };
		Dir. 1 = |char|char|int|int|
		Dir. 2 = |int|int|xxxx|xxxx|
	B. 
		2 accesos a memoria.
		struct Persona { char InicialNombre; unsigned int DNI; char InicialApellido; };
		Dir. 1 = |char|int|int|int|
		Dir. 2 = |int|char|xxxx|xxxx|
	C. 
		1 acceso a memoria.
		struct Persona { unsigned int DNI; char InicialNombre; char InicialApellido; };	
		Dir. 1 = |int|int|int|int|
		Dir. 2 = |char|char|xxxx|xxxx|

12.
	A. 
		struct Persona { char InicialNombre; char InicialApellido; unsigned int DNI; };
		Dir. 1 = |char|char|RELLENO|RELLENO|
		Dir. 2 = |int|int|int|int|
	B. 
		struct Persona { char InicialNombre; unsigned int DNI; char InicialApellido; };
		Dir. 1 = |char|RELLENO|RELLENO|RELLENO|
		Dir. 2 = |int|int|int|int|
		Dir. 3 = |char|RELLENO|RELLENO|RELLENO|
	C. 
		struct Persona { unsigned int DNI; char InicialNombre; char InicialApellido; };	
		Dir. 1 = |int|int|int|int|
		Dir. 2 = |char|char|RELLENO|RELLENO|









