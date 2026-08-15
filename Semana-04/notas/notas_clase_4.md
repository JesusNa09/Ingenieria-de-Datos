# Notas de la Clase 4

# 1.Funciones de agregación
Aprendi que las funciones de agragacion son operaciones sobre un conjunto de valores y devuelven un unico valor

## COUNT()
Aprendi que la funcion count sirve para contar registros de una columna
El count(*) cuenta todas las filas o registros de una columna sin importar si hay valores nulos o duplicados
SELECT COUNT(*)
FROM ventas;
 
### COUNT(columna)
Cuenta solo los valores de la columan declarada y donde si hay valor
SELECT COUNT(cliente)
FROM ventas;

## SUM()
Aprendi que es una funcion que me devolvera la suma de los valores numericos de la columna especificada 
SELECT SUM(venta)
FROM ventas;

## AVG()
Entendi que es una funcion que me devolvera el promedio de una columna de valores numericos especificada
SELECT AVG(venta)
FROM ventas;

## MIN()
Aprendi que es una funcion que me devolvera el valor minimo de una columna especifica
SELECT MIN(venta)
FROM ventas;

## MAX()
Funcion que devuelve el  valor más alto o máximo dentro de una columna especifica
SELECT MAX(venta)
FROM ventas;

# GROUP BY
Aprendi que es una clausula que acomoda todos los registros o filas de una tabla con el mismo valor con base en una o mas columnas 
Select sum(venta)
FROM ventas
GROUP BY cliente;

# HAVING
Es na clausula que combina grupo de filas y va despues del group by
Select sum(venta)
FROM venta
GROUP BY cliente
HAVING sum(venta)>300

# Diferencia
Entendi que la diferencia entre GROUP BY y HAVING es que el primero ordena filas con el mismo valor y el segundo combina grupos de filas y va siempre
despues del group by

# CASE
Aprendi que es una herramienta condicional que evalua condiciones y devuleve la primera que encuentra

# Funciones de texto

## UPPER
Aprendi que es una funcion que convierte todas las letras de una exprecion de texto a mayusculas

## LOWER
Aprendi que es una funcion que convierte todas las letras de una exprecionde txtoa minusculas

## LENGTH
Aprendi que length es una funcion que te devuelve el numero de letras de una palabra o expresion de texto incluyendo los espacios

## TRIM
Aprendi que es una funcion que quita todos los espacios o caracteres raros de una expresion de texto


## INITCAP
No venia en la clase pero se que convierte todas las letrs iniciales de una expresion de texto a mayusculas y las demas letras en minusculas


# Funciones de fecha

## CURREN DATE
Aprendi que es una funcion que te da como resultado la fecha actual de la base de datos o servidor

## EXTRACT
Entendi que es una funcion de te regresa una parte de la fecha especifica como el dia mes año o hora

## AGE
Aprendi que depende del sistema de gestion de base de datos que utilices cambia pero en postgresql calcula la diferencia entre dos fechas

## TO_CHAR
Aprendi que esta funcion sirve para cambiar de formato la hora, fecha a cadena de texto

## DATE_TRUNC
Entendi que esta funcion sirve solo para redondear o recortar la fecha a on valor que tu desees