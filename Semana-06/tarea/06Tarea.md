# Tarea 
Ahora vamos a empezar a trabajar con problemas más parecidos a los que encontrarías en una empresa.

Problema 1

Obtener las ventas superiores al promedio general.

Problema 2

Obtener los tres clientes que más dinero han gastado.

Problema 3

Obtener el producto con mayor venta acumulada.

Problema 4

Obtener el producto más vendido por cada categoría.

💡 Aquí quiero que pienses en:

PARTITION BY
+
ROW_NUMBER()
Problema 5

Crear un ranking de clientes según sus compras.

Problema 6

Comparar cada venta contra el total comprado por ese cliente.

Resultado esperado conceptualmente:

cliente | venta | total_cliente
Ana     | 200   | 500
Ana     | 300   | 500
Problema 7

Crear una CTE con las ventas por categoría y después obtener solamente las categorías cuyo total esté por encima del promedio.

Problema 8

Crear una vista:

reporte_ventas

que combine las cuatro tablas.

Problema 9

Obtener el ranking de productos dentro de cada categoría.

Problema 10 — Integrador

Crear una consulta que muestre:

cliente
ciudad
producto
categoria
venta
ranking_producto
total_cliente

Aquí quiero que combines varios conceptos de la Semana 5 y 6.