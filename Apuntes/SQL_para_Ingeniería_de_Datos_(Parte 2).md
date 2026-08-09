# Índice

Funciones de agregación
GROUP BY
HAVING
CASE
Funciones de texto
Funciones de fecha


# 1.Funciones de agregación

## COUNT()
Funcion para contar registros
SELECT COUNT(*)
FROM ventas;

### COUNT(columna)
SELECT COUNT(cliente)
FROM ventas;

## SUM()
Funcion que suma valores
SELECT SUM(venta)
FROM ventas;

## AVG()
Funcion que calculo el valor promedio(media aritmetica)
SELECT AVG(venta)
FROM ventas;

## MIN()
Funcion que te devulve el valor más pequeño de una columna específica
SELECT MIN(venta)
FROM ventas;

## MAX()
Funcion que devuelve el  valor más alto o máximo dentro de una columna


# GROUP BY
Clausula que junta filas que tienen el mismo valor en una o más columnas
Ejemplo.

Tabla
| Cliente | Venta |
| ------- | ----- |
| Ana     | 100   |
| Ana     | 300   |
| Luis    | 150   |

Consulta:
SELECT
cliente,
SUM(venta)
FROM ventas
GROUP BY cliente;

Resultado:
| Cliente | Total |
| ------- | ----- |
| Ana     | 400   |
| Luis    | 150   |
Aquí empieza el SQL analítico.


# HAVING
Clausula que filtra los resultados creados por la cláusula GROUP BY, permitiendo usar funciones de suma o conteo
Ejemplo
SELECT
cliente,
SUM(venta)
FROM ventas
GROUP BY cliente
HAVING SUM(venta)>300;
Solo mostrará clientes cuya suma sea mayor a 300.

# Diferencia
WHERE

↓

Filtra registros.

GROUP BY

↓

Agrupa.

HAVING

↓

Filtra grupos.

Esta diferencia quiero que la domines perfectamente.


# CASE
La expresión funciona como una estructura condicional del tipo si/entonces para evaluar condiciones y devolver resultados específicos.
Ejemplo. 

SELECT
cliente,
venta,

CASE

WHEN venta>=500 THEN 'Alta'

WHEN venta>=200 THEN 'Media'

ELSE 'Baja'

END AS categoria

FROM ventas;
Este tipo de consultas se usan muchísimo en ETL.


# Funciones de texto

## UPPER
Funcion que convierte todos los caracteres minúsculas de una cadena de texto a mayúsculas.
SELECT
UPPER(cliente)
FROM ventas;

## LOWER
Funcion que convierte todos los caracteres de una cadena de texto en letras minúsculas.
SELECT
LOWER(cliente)
FROM ventas;

## LENGTH
Funcion que cuenta los caracteres de una palabra o columna, incluyendo los espacios.
SELECT
LENGTH(cliente)
FROM ventas;

## TRIM
Funcion que quita los espacios en blanco u otros caracteres específicos del inicio, del final o de ambos lados de una cadena de texto
SELECT
TRIM(cliente)
FROM ventas;


# Funciones de fecha
Supongamos

2025-07-15

### Extraer año
SELECT
EXTRACT(YEAR FROM fecha)
FROM ventas;

### Mes
EXTRACT(MONTH FROM fecha)

### Día
EXTRACT(DAY FROM fecha)