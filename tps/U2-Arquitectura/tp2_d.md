---------------------- D - Modos de direccionamiento y eficiencia -----------------------
01.
	Absoluto: En la instruccion recibo la DRO.
	Relativo: En la instruccion recibo un offset aplicado a una dir. de referencia.
	Directo: En la instruccion recibo el registro en el cual recide el operando.
	Indirecto: En la instruccion recibo la dir. de la DRO.
	Implicito (o inherente): No recibo operando ya que no lo preciso.
	
02.
	Paginado: Utilizo un registro de pagina y un offset dentro de esa pagina.
	Inmediato: Utilizo como base al PC y aplico un offset nulo (leo del PC)
	Indexado: Utilizo un registro indice al cual le aplico un offset.
	Registro base y desplazamiento: aplico un offset a un reg. base.
	
03.
	clock       -> 10MHz
	instruccion -> 10 ciclos
	eficiencia  -> 10MHz / 10 ciclos = 1 MIPS

04.
	clock 		-> 2MIPS * 4 ciclos = 8MHz
	instruccion -> 4 ciclos
	eficiencia  -> 2MIPS

05.
	clock       -> 50MHz
	instruccion -> 50MHz/x = 10MIPS => 50=x*10 => x=50/10 => x=40 ciclos
	eficiencia  -> 10MIPS

06.
	address bus -> 16b
	data bus 	-> 16b
	cod. op.	-> 12b
	registros	-> 4b(16)
	palabra		-> 16b
	1er op. 	-> registro.
	2do op. 	-> memoria(modo indirecto).
	resultado   -> registro.
	decodif.	-> 1 ciclo
	ejecucion	-> 1 ciclo
	memoria		-> 1 ciclo
	eficiencia  -> 25Mhz / 6 ciclos = 4,16 MIPS
	frequencia  -> 25MHz
	formato 	-> | Cod. op(12) | Registro(4) | Dir. de DRO(16) |
						 __________________________
						| Etapa |Acc. Mem.| Ciclos |
						|-------|---------|--------|
						| fetch | 	1	  |   1	   |
						| decod | 	0	  |   1	   |
						| oper1 |	0	  |   0	   |
						| oper2 | 	3	  |	  3	   |
						| ejecu | 	0	  |	  1	   |
						|-------|---------|--------|
						| total |	4	  |   6	   |
						|_______|_________|________|

07. 
	Info. Gral:
	decodif.	-> 3 ciclo
	ejecucion	-> 2 ciclo
	memoria		-> 1 ciclo
	eficiencia  -> 4 MIPS
					   
	DNI terminado entre:
	- 00~08
	address bus -> 32
	data bus 	-> 16
	cod. op.	-> 16
	palabra		-> 16
		
		- 0,1,2
		1er op.	-> inmediato
		2do op.	-> absoluto
		frequencia  -> x/11 = 4 => x=4*11 => 44MHz
		formato     -> | Cod.(16) | Op.(16) | DRO(32) |
		
															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	3	  |	  3
															ejecu | 	0	  |	  2
															store |		1	  |	  1
															------|-----------|--------
															total |		4	  |   11
		- 3,4,5
		1er op.	-> inmediato
		2do op.	-> indirecto
		frequencia -> x/13 = 4 => x=4*13 => 52MHz
		formato    -> | Cod.(16) | Op.(16) | Dir. DRO(32) |

															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	5	  |	  5
															ejecu | 	0	  |	  2
															store |		1	  |	  1
															------|-----------|--------
															total |		8	  |   13
		- 6,7,8
		1er op.	-> absoluto
		2do op.	-> inmediato
		frequencia -> x/11 ciclos = 4 MIPS => x=4*11 => 44MHz
		formato    -> | Cod. op(16) | DRO(32) | Op.(16) |

															Etapa |	Acc. Mem. | Ciclos
															------|-----------|---------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		3	  |   3
															oper2 | 	1	  |	  1
															ejecu | 	0	  |	  2
															store |		1	  |	  1
															------|-----------|--------
															total |		6	  |   11

	- 09~16
	address bus -> 24
	data bus 	-> 12
	cod. op.	-> 12
	palabra		-> 12

		- 0,1,2
		1er op.	-> inmediato
		2do op.	-> absoluto
		frequencia  -> x/11 ciclos = 4 MIPS => x=4*11 => 44 MHz
		formato de instrucccion -> | Cod. op(12) | Op.(12) | DRO(24) |
			
															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	3	  |	  3
															ejecu | 	0	  |	  2
															store |		1	  |	  1
															------|-----------|--------
															total |		6	  |   11
		- 3,4,5
		1er op.	-> inmediato
		2do op.	-> indirecto
		frequencia  -> x/13 ciclos = 4 MIPS => x=4*13 => 52 MHz
		formato de instrucccion -> | Cod. op(12) | Op.(12) | Dir. de DRO(24) |

															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	5	  |	  5
															ejecu | 	0	  |	  2
															store |		1	  |	  1
															------|-----------|--------
															total |		8	  |   13
		- 6,9
		1er op. -> absoluto
		2do op. -> inmediato
		frequencia  -> x/9 ciclos = 4 MIPS => x=4*9 => 36MHz
		formato de instrucccion -> | Cod. op(12) | DRO(24) | Op.(12) |
															Etapa |	Acc. Mem. | Ciclos
															------|-----------|---------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		3	  |   3
															oper2 | 	1	  |	  1
															ejecu | 	0	  |	  2
															store |		1	  |	  1
															------|-----------|--------
															total |		6	  |   11
	
	- 17~32
	address bus -> 20
	data bus 	-> 10
	cod. op.	-> 10
	palabra		-> 10

		- 0,1,2
		1er op.	-> inmediato
		2do op.	-> absoluto
		frequencia  -> x/9 ciclos = 4 MIPS => x=4*9 => 36 MHz
		formato de instrucccion -> | Cod. op(10) | Op.(10) | DRO(20) |
			
															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	2	  |	  2
															ejecu | 	0	  |	  2
															------|-----------|--------
															total |		4	  |   9
		- 3,4,5
		1er op.	-> inmediato
		2do op.	-> indirecto
		frequencia  -> x/11 ciclos = 4 MIPS => x=4*11 => 44 MHz
		formato de instrucccion -> | Cod. op(10) | Op.(10) | Dir. de DRO(20) |

															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	4	  |	  4
															ejecu | 	0	  |	  2
															------|-----------|--------
															total |		6	  |   11
		- 6,7,8,9
		1er op. -> absoluto
		2do op. -> inmediato
		frequencia  -> x/9 ciclos = 4 MIPS => x=4*9 => 36MHz
		formato de instrucccion -> | Cod. op(10) | DRO(20) | Op.(10) |
															Etapa |	Acc. Mem. | Ciclos
															------|-----------|---------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		2	  |   2
															oper2 | 	1	  |	  1
															ejecu | 	0	  |	  2
															------|-----------|--------
															total |		4	  |   9

	33~99
	address bus -> 16
	data bus 	-> 8
	cod. op.	-> 8
	palabra		-> 8

		- 0,1,2
		1er op.	-> inmediato
		2do op.	-> absoluto
		frequencia  -> x/9 ciclos = 4 MIPS => x=4*9 => 36 MHz
		formato de instrucccion -> | Cod. op(8) | Op.(8) | DRO(16) |

															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	2	  |	  2
															ejecu | 	0	  |	  2
															------|-----------|--------
															total |		4	  |   9
		- 3,4,5
		1er op.	-> inmediato
		2do op.	-> indirecto
		frequencia  -> x/11 ciclos = 4 MIPS => x=4*11 => 44 MHz
		formato de instrucccion -> | Cod. op(8) | Op.(8) | Dir. de DRO(16) |

															Etapa |	Acc. Mem. | Ciclos
														    ------|-----------|--------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		1	  |   1
															oper2 | 	4	  |	  4
															ejecu | 	0	  |	  2
															------|-----------|--------
															total |		6	  |   11
		- 6,7,8,9
		1er op. -> absoluto
		2do op. -> inmediato
		frequencia  -> x/9 ciclos = 4 MIPS => x=4*9 => 36MHz
		formato de instrucccion -> | Cod. op(8) | DRO(16) | Op.(8) |
															Etapa |	Acc. Mem. | Ciclos
															------|-----------|---------
															fetch | 	1	  |   1
															decod | 	0	  |   3
															oper1 |		2	  |   2
															oper2 | 	1	  |	  1
															ejecu | 	0	  |	  2
															------|-----------|--------
															total |		4	  |   9

