# Índice
¿Qué es SQL?
¿Cómo piensa un Data Engineer?
SELECT
FROM
WHERE
ORDER BY
LIMIT
DISTINCT
Alias (AS)



# 1. ¿Qué es SQL?
SQL significa: Structured Query Language

Es el lenguaje que usamos para:

Consultar datos.
Filtrar datos.
Agrupar datos.
Transformar datos.
Preparar información.

Ejemplo
Tabla:

id	cliente	venta
1	Ana	    200
2	Luis	150
3	Ana	    300


SELECT *
FROM ventas;

Resultado:
id	cliente	venta
1	Ana	    200
2	Luis	150
3	Ana	    300


# 2. ¿Cómo piensa un Data Engineer?
Un Analista pregunta:
¿Cuánto vendimos?

Un Data Engineer pregunta:
¿De dónde vienen los datos?
¿Están limpios?
¿Se actualizan?
¿Qué pasa si llegan valores nulos?
¿Puedo automatizar esto?
Ese pensamiento lo iremos desarrollando.


# 3. SELECT
Instruccion 
Sirve para elegir columnas.

SELECT cliente
FROM ventas;

Varias columnas:
SELECT cliente, venta
FROM ventas;

Todas las columnas:
SELECT *
FROM ventas;


# 4. FROM
Clausula
Indica de dónde vienen los datos.
SELECT *
FROM ventas;


# 5. WHERE
CLausula 
Filtra datos.
SELECT *
FROM ventas
WHERE venta > 200;

Texto:
SELECT *
FROM ventas
WHERE cliente = 'Ana';

Dos condiciones:
SELECT *
FROM ventas
WHERE venta > 100
AND cliente = 'Ana';

OR
SELECT *
FROM ventas
WHERE cliente = 'Ana'
OR cliente = 'Luis';


# 6. ORDER BY
Ordenar datos.

Ascendente:
SELECT *
FROM ventas
ORDER BY venta;

Descendente:
SELECT *
FROM ventas
ORDER BY venta DESC;


# 7. LIMIT
Clausula
Traer pocos registros.

PostgreSQL:
SELECT *
FROM ventas
LIMIT 5;

Oracle:
SELECT *
FROM ventas
FETCH FIRST 5 ROWS ONLY;


# 7. DISTINCT
Clausula
Eliminar duplicados.

Tabla:
cliente
Ana
Ana
Luis

Consulta:
SELECT DISTINCT cliente
FROM ventas;

Resultado:
Ana
Luis


# 8. Alias (AS)
Nombre temporal que se asigna
SELECT
cliente AS nombre_cliente,
venta AS total
FROM ventas;