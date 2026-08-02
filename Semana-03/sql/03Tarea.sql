/*Tarea*/
/*Diseña una consulta para responder:*/

/*¿Qué cliente compró más?*/
/*Para este ejercicio basta con una funcion de agregacion sum para sumar todas las
compras por cliente, agrupar por la columna cliente para ver su total por cada uno y
ordenar de mayor a menor por lo que Luis Compro mas */
SELECT cliente,sum(venta) as venta
FROM Ventas
GROUP BY cliente
ORDER BY venta DESC;

/*¿Qué categoría vende más?*/
/*Para este ejercicio de igual forma se suma las ventas , pero se agrupa por categoria
para ver cual vendio mas y se ordena de manera descendente por lo que la categoria 
que mas vendio fue la de Juguetes*/
SELECT categoria,sum(venta) as venta
FROM Ventas
GROUP BY categoria 
ORDER BY categoria DESC;


/*¿Qué ventas superan 250?*/
/*Para esta consulta solo es necesario poner una condicion en la sentencia Where
ponniendo que la columna de venta sea mayor o igual a 250 por lo que nos arrojo dos 
registros para el cliente Pero y Luis*/
SELECT * FROM Ventas
WHERE venta>=250;