# Laboratorio

Aquí vamos a utilizar las tablas que construiste en la Semana 5:

clientes
productos
categorias
ventas
Ejercicio 1 — Subconsulta

Obtener las ventas superiores al promedio general.

Ejercicio 2 — Subconsulta

Obtener los clientes cuyo total de compras sea superior al promedio de compras de todos los clientes.

Aquí tendrás:

SUM()
GROUP BY

dentro de una consulta y después otra consulta utilizando ese resultado.

Ejercicio 3 — CTE

Crear:

ventas_cliente

que contenga:

cliente
total_ventas
Ejercicio 4 — CTE + JOIN

Crear un CTE con las ventas por cliente y después relacionarlo con clientes para obtener:

nombre
ciudad
total_ventas
Ejercicio 5 — ROW_NUMBER

Numerar las ventas de mayor a menor:

ROW_NUMBER() OVER (
    ORDER BY venta DESC
)
Ejercicio 6 — ROW_NUMBER + PARTITION BY

Obtener la venta número 1 de cada cliente.

Aquí tendrás que pensar cómo utilizar:

PARTITION BY
+
ORDER BY
Ejercicio 7 — RANK

Crear un ranking de productos según sus ventas acumuladas.

Ejercicio 8 — DENSE_RANK

Crear un ranking de categorías.

Después compara el resultado con RANK().

Ejercicio 9 — GROUP BY vs Window Function

Crear dos consultas:

Consulta A

Utilizando:

GROUP BY
Consulta B

Utilizando:

SUM() OVER(PARTITION BY ...)

Compara los resultados.

Ejercicio 10 — VIEW

Crear:

CREATE VIEW reporte_ventas AS

que muestre:

cliente
producto
categoria
venta
fecha