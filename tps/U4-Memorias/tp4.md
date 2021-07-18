# TP UNIDAD 4 Unidad de Memoria

## Conceptos generales.

### 01.- Explicar los conceptos de capacidad de memoria, velocidad  (tiempo de acceso y tiempo de ciclo), palabra de la CPU y palabra de memoria.

### 02.- Hacer un cuadro sinóptico que muestre la clasificación de los distintos tipos de memoria según:
    • forma de acceso
    • persistencia de la información
    • tipo de utilización en relación a la posibilidad de lectura y escritura
    • tecnología
    • principio de funcionamiento
    • jerarquía

### 03.- Definir y ejemplificar los distintos tipos de memoria del punto anterior.

### 04.- Comparar las características de consumo, velocidad y capacidad para las distintas tecnologías y principios de funcionamiento. Identificar dentro de la clasificación realizada previamente.

### 05.- Comparar las características de velocidad, capacidad y costo para las distintas jerarquías de memorias.

### 06.-Indicar a qué tipo de memoria corresponden las estructuras conocidas como stack y buffer. Ejemplificar su utilización.

### 07.- Indicar las funciones de la memoria ROM y de la memoria R/W de una memoria central 

## Memoria caché

### 08.- Indicar qué es, dónde  y para qué se utiliza una memoria cache.

### 09.- Indicar cuáles son las formas típicas de organización de una memoria cache. Analizar la utilización de memorias asociativas y memorias de acceso aleatorio.

### 10.- Sea una memoria cache con un tiempo de acceso de 1 nseg por palabra y una memoria principal, de 10 nseg por palabra. La tasa de aciertos es de 0,90 y la memoria caché está constituida por líneas de 256 palabras cada una. Calcular el tiempo promedio de acceso del sistema. Justificar. 

### 11.- Recalcular el valor anterior considerando que la tasa de aciertos es ahora de 0,975. 

### 12.- Recalcular el valor anterior considerando ahora que el tamaño de cada línea de memoria caché es de 1024 palabras. 

### 13.- Se tiene una unidad de memoria de 256M palabras de 16 bits,  y una memoria cache de 1M palabras. La cache utiliza mapeo directo y está dividida en líneas de 256 palabras cada una. Indicar cuántos bits hay en los campos de rótulo e índice de la dirección, y cuántos bits hay en cada palabra de la cache. Determinar en cuantos bloques ha quedado dividida la memoria principal. 

### 14.- Repetir el problema anterior considerando que la memoria cache utiliza mapeo asociativo.  Analizar los cambios producidos en el sistema de memoria. 

### 15.- Para el ejercicio 13, analizar qué ocurre si se debe reemplazar un bloque de memoria almacenado en memoria caché. Indicar las razones por las cuales debería ser reemplazado, y cual es el procedimiento más adecuado para efectuar dicho reemplazo. 

### 16.- Repetir el análisis anterior para el caso en que la memoria caché esté asignada como mapeo asociativo. Analizar qué diferencias se producen en las técnicas de reemplazo. 

### 17.- Analizar las ventajas de la configuración de memoria caché configurada con un esquema de mapeo asociativo por conjuntos de dos vías.  

## Memoria principal

### 18.-Indicar la cantidad de líneas de dirección, de datos y de control, la cantidad de bits de los registros de direcciones y de datos, la cantidad de posiciones de memoria y entre que números decimales y hexadecimales se encuentran las direcciones, para las siguientes memorias:

a. RAM-RW  de 64 Mbytes     b. RAM-R/W  de 10 Mbytes     c. RAM-R/W  de 256 Kbits

### 19.- Dibujar el circuito básico de una memoria ROM de 4  direcciones de memoria de 2 bits cada una.

### 20.- Dibujar el circuito básico de una memoria RAM R/W construida con Flip-Flops D de 4 direcciones de 2 bits cada una.

### 21.- Indicar cuál es la máxima capacidad de memoria administrable desde una CPU con un bus de direcciones de 16 bits. Ídem de 32 bits. Influye en algo el tamaño del bus de datos??

### 22.- Indicar cuál es la diferencia de capacidades que hay entre las memorias centrales de dos máquinas con un bus de direcciones de 16 bits, si una de ellas tiene un bus de datos de 8 bits y la otra un bus de datos de 16 bits.

### 23.-Indicar cuántos circuitos integrados se requieren para la memoria central de una PC de 256M x 16 bits, si se dispone de circuitos integrados de 4 Mbits. Ídem si fueran CI de 1024k x 4 bits. Ídem si fueran CI de 1M x 1 bit.

### 24.- Implementar una memoria de 16 Mbytes, utilizando circuitos integrados de 2 M direcciones de un bit cada una. Indicar cuántos circuitos integrados se requieren y cómo se configura el banco de memoria. Si se utiliza un procesador de 28 líneas de direccionamiento, indicar cuál es la decodificación requerida para ubicar el banco a partir de la dirección hexadecimal 1000000.

### 25.- Implementar una memoria ROM de 512 K por 16 bits, utilizando circuitos integrados de 128 Kbytes. Indicar cuántos circuitos integrados son necesarios y cómo se configura el banco. Indicar qué señales de control son necesarias para su manejo por parte de la CPU.