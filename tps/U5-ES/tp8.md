# E/S
## TRABAJO PRACTICO 8: Unidades de Entrada Salida, Perifericos y Comunicaciones

### 01
#### Explicar el concepto de unidad o sistema periférico. Ejemplificar.

### 02
#### Explicar el concepto de interfaz. Clasificar las interfaces de un sistema de computación en base al uso que se les brinde. Analizar la diferencia entre interfaces genéricas y dedicadas.

Una interfaz es el medio por el cual la CPU se comunica con los distintos dispositivos de E/S.

### 03
#### Explicar el concepto de controlador (desde el punto de vista de la programación de un sistema de computación).

### 04
#### Explicar y ejemplificar las formas en que se comunican la unidad central de una computadora con las interfaces de E/S, en cuanto al sistema de buses utilizado. Explicar los conceptos de:
* E/S mapeada en Memoria.
* E/S aislada.
* Procesadores de E/S (Canal de Datos).

### 05
#### Dibujar el diagrama en bloques de una interfaz genérica. Indicar los registros internos necesarios y explicar su función. Indicar las líneas de conexión con la unidad central y la memoria principal y con un periférico genérico, y explicar la función particular de cada una de las líneas utilizadas.

### 06
#### Explicar las características básicas de los distintos modos de transferencia de datos e indicar a qué tipo de periféricos se aplican y por qué entre la unidad central de proceso y las interfaces de E/S:
* Controlada por programa.
* Controlada por interrupción.
* Acceso Directo a Memoria (DMA).

### 07
#### Analizar otros tipos de interrupciones que puede admitir un procesador de un sistema de computación, y que no se relacionan con el manejo de periféricos.

### 08
#### Analizar, a nivel del hardware de la CPU de un sistema de computación, como se procesan las interrupciones externas.

### 09
#### Explicar qué es una interrupción enmascarable y una no enmascarable.

### 10
#### Explicar las formas de elección de la dirección de salto a una rutina de servicio de interrupción (vectorizadas y no vectorizadas).

### 11
#### Explicar la ventaja obtenida con el control de una operación de E/S iniciada por interrupción, frente al método de control por programa.

### 12
#### Explicar el concepto de prioridad de interrupción. Ejemplificar.

### 13
#### Explicar las características de una interfaz con capacidad de DMA (Acceso Directo a Memoria).

### 14
#### Dibujar un diagrama en bloques que muestre los registros internos necesarios en una interfaz con DMA. Indicar las líneas de conexión con la parte central y con un periférico genérico. Explicar la función particular de cada una.

### 15
#### Explicar las formas de transferencia por DMA: Masiva o por Robo de Ciclos.

### 16
#### Escribir una rutina de entrada de datos para un procesador que atiende cuatro interfaces mediante el método de transferencia controlada por programa, indicando las etapas de inicialización, espera y transferencia propiamente dicha de la CPU. Indicar cuál es la etapa que hace a este método ineficiente y por qué. Ejemplificar.

### 17
#### Repetir la rutina anterior para el caso en que el manejo se realice por interrupciones, considerando que todos los dispositivos de interfaz interrumpen por la misma línea.

### 18
#### Repetir la rutina anterior considerando ahora que cada uno de los dispositivos tiene asignada una línea individual de interrupciones. ¿Qué consideración adicional hay que hacer en este caso?

### 19
#### Una computadora utilizada en un sistema de monitoreo controla 32 sensores configurados en cuatro registros de 8 sensores cada uno. Cada sensor genera una señal de estado una vez cada 15 segundos. A su vez, la computadora recibe una señal de interrupción no enmascarable a una frecuencia de 1000 interrupciones por segundo. Se requiere escribir una rutina que, basada en dicha interrupción determine el momento en que debe leer los sensores, almacenando, en cada lectura, una imagen de dichos estados en posiciones determinadas de memoria. En caso de falla (estado del sensor en 1), deberá indicarse en una posición dada de la memoria cual fue el número de sensor (en el rango 0 a 31) que dio falla. Si fuese más de un sensor el que fallara en una vuelta, se indicará tal situación con el valor binario –1.

### 20
#### Explicar las características particulares de la comunicación paralelo y de la comunicación serie.

### 21
#### Explicar las características particulares de la comunicación serie asincrónica y de la comunicación serie sincrónica.

### 22
#### Indicar un formato de transmisión serie asincrónica.

### 23
#### Definir la unidad BAUD. En qué casos se hace diferencia con la unidad de velocidad bit/segundo?

### 24
#### Analizar el formato de transmisión sincrónica orientada a caracteres. Analizar un formato de transmisión sincrónica orientada a bits y explicar la ventaja con respecto al anterior.

### 25
#### Explicar a qué se refiere la norma RS232 y dar ejemplos de utilización.

### 26
#### Indicar qué es una UART y qué es una USRT. Describir sus características circuitales y funcionales.

### 27
#### Indicar cuál es la velocidad de transmisión en bauds de un canal de comunicaciones que transmite en formato serie asincrónico, si la frecuencia del reloj de control de la UART correspondiente es de 28800 Hz. Suponiendo que la UART está configurada para transmitir caracteres de 7 bits + paridad y un bit de stop, indicar cuál es la velocidad medida en bits por segundo, en bits de información por segundo y en caracteres por segundo. Justificar las diferencias y relacionar con la unidad baud.

### 28
#### Indicar en cuánto tiempo se puede transmitir un documento de 3 Mbytes, utilizando un canal serie asincrónico de 33600 bauds, si cada carácter se transmite en ASCII de 7 bits + paridad y dos bits de stop. Justificar.

### 29
#### Analizar las características básicas de la norma de comunicación serie conocida como USB.