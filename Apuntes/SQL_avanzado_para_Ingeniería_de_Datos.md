# Índice
¿Qué es una subconsulta?
Problema de las subconsultas
CTE — Common Table Expression
CTE con GROUP BY
Varias CTE
Window Functions
ROW_NUMBER()
PARTITION BY
DENSE_RANK()
GROUP BY vs Window Function
Vista — VIEW


# 1. ¿Qué es una subconsulta?
Una subconsulta es una consulta dentro de otra consulta.
Por ejemplo:
Obtener las ventas superiores al promedio.
Primero podríamos calcular:
SELECT AVG(venta)
FROM ventas;
Y después utilizar ese resultado:
SELECT *
FROM ventas
WHERE venta > (
    SELECT AVG(venta)
    FROM ventas
);
Aquí:
consulta exterior
        ↓
consulta interior
La consulta interior calcula el promedio y la consulta exterior utiliza ese resultado.


# 2. Problema de las subconsultas
Las subconsultas son útiles, pero cuando una consulta empieza a crecer mucho pueden volverse difíciles de leer.
Por ejemplo:
SELECT *
FROM ventas
WHERE venta > (
    SELECT AVG(venta)
    FROM ventas
    WHERE id_producto IN (
        SELECT id_producto
        FROM productos
        WHERE id_categoria IN (
            SELECT id_categoria
            FROM categorias
            ...
        )
    )
);
Funciona, pero empieza a ser difícil de mantener.
Aquí aparece una herramienta muy importante:
WITH


# 3. CTE — Common Table Expression
Una CTE se define utilizando:
WITH
Ejemplo:
WITH promedio AS (
    SELECT AVG(venta) AS promedio_venta
    FROM ventas
)
SELECT *
FROM ventas
WHERE venta > (
    SELECT promedio_venta
    FROM promedio
);

La idea es:
WITH
 ↓
creamos un resultado temporal
 ↓
lo utilizamos en la consulta


# 4. CTE con GROUP BY
Podemos hacer algo más interesante:
WITH ventas_cliente AS (
    SELECT
        id_cliente,
        SUM(venta) AS total_ventas
    FROM ventas
    GROUP BY id_cliente
)
SELECT *
FROM ventas_cliente;
Ahora ventas_cliente funciona como un resultado intermedio.


# 5. Varias CTE
También podemos tener varias:
WITH ventas_cliente AS (
    SELECT
        id_cliente,
        SUM(venta) AS total_ventas
    FROM ventas
    GROUP BY id_cliente
),

promedio AS (
    SELECT
        AVG(total_ventas) AS promedio
    FROM ventas_cliente
)

SELECT *
FROM ventas_cliente
WHERE total_ventas > (
    SELECT promedio
    FROM promedio
);
Esto empieza a parecerse bastante a las transformaciones que encontraremos posteriormente en nuestros pipelines.


# 6. Window Functions
Ahora viene una de las partes más importantes de esta semana.
Supongamos:
Cliente | Venta
Ana     | 200
Ana     | 300
Luis    | 150
Luis    | 500
Si utilizamos:
GROUP BY cliente
Ana  500
Luis 650
Pero perdemos el detalle de cada venta.
Una Window Function permite calcular información sobre un grupo sin eliminar las filas originales.


7. ROW_NUMBER()
Ejemplo:
SELECT
    cliente,
    venta,
    ROW_NUMBER() OVER (
        ORDER BY venta DESC
    ) AS numero
FROM ventas;
Podríamos obtener:
cliente | venta | numero
Luis    | 500   | 1
Ana     | 300   | 2
Ana     | 200   | 3


# 8. PARTITION BY
Ahora algo mucho más interesante.
Queremos numerar las ventas dentro de cada cliente:
SELECT
    cliente,
    venta,
    ROW_NUMBER() OVER (
        PARTITION BY cliente
        ORDER BY venta DESC
    ) AS numero
FROM ventas;
Resultado conceptual:
Ana   300   1
Ana   200   2

Luis  500   1
Luis  150   2
Fíjate:

PARTITION BY crea grupos para la Window Function.

Pero no elimina las filas como GROUP BY


# 9. RANK()
RANK() OVER (
    ORDER BY venta DESC
)
A diferencia de ROW_NUMBER(), RANK() puede generar posiciones iguales.

Por ejemplo:
venta
500 → 1
500 → 1
300 → 3
Observa que salta del 1 al 3.


# 10. DENSE_RANK()
DENSE_RANK() OVER (
    ORDER BY venta DESC
)
Con los mismos datos:
500 → 1
500 → 1
300 → 2
No deja un espacio entre posiciones.
ROW_NUMBER()
→ número único por fila

RANK()
→ empates comparten posición y deja huecos

DENSE_RANK()
→ empates comparten posición pero no deja huecos


# 11. GROUP BY vs Window Function
Esto será muy importante en el quiz.

GROUP BY

Reduce las filas.
SELECT
    cliente,
    SUM(venta)
FROM ventas
GROUP BY cliente;
Obtienes una fila por cliente.
Window Function
Mantiene las filas originales.
SELECT
    cliente,
    venta,
    SUM(venta) OVER (
        PARTITION BY cliente
    ) AS total_cliente
FROM ventas;

Obtienes:
Ana   200   500
Ana   300   500
Luis  150   650
Luis  500   650
Esto es extremadamente útil para análisis y transformación de datos.


# 12. Vista — VIEW
Una vista permite guardar una consulta como un objeto de base de datos.

Ejemplo:
CREATE VIEW ventas_clientes AS
SELECT
    c.nombre AS cliente,
    SUM(v.venta) AS total_ventas
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
GROUP BY c.nombre;
Después podemos consultar:
SELECT *
FROM ventas_clientes;
Una vista no es simplemente una tabla nueva con datos copiados; conceptualmente es una consulta almacenada que podemos consultar como una relación.