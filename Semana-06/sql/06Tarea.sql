/*Data Engineer de una empresa de juguetes.*/
/*Ahora vamos a empezar a trabajar con problemas más parecidos a los que encontrarías en una empresa.*/

/*Problema 1
Obtener las ventas superiores al promedio general.*/
/*Para este ejercicio se realiza una subconsulta en la cual primero usamos una funcion de agregacion
AVG a la columna venta de la tabla ventas para obtener el promedio geenral de todas las ventas
depues hacemos una consulta en la tabla ventas donde filtramos que en nuestra columna venta sea
mayor a ese promedio que obtuvimos de nuestra subconsulta*/
SELECT venta as ventas_superiores_prom_general
FROM ventas
WHERE venta > (SELECT ROUND(AVG(venta),2) as promedio_general
			   FROM ventas);


/*Problema 2
Obtener los tres clientes que más dinero han gastado.*/
/*Se realiza primero una consulta con la funcion de agregacion suma agrupando por cliente para
obtener la suma por cliente usando la clausula join de las tablas donde se encuentra las columnas a utilizar
despues se hace fuera una consulta envolviendo esta como subconsulta donde se hace una funcion de ventana
aplicado a las compras asignando un numereo consecutivo pero de mayor a menor y al final se hace otra consulta
envolviendo esat como subconsulta donde solo se pone el cliente en el operador select y se filta
que el numero asignado sea menor o igual a 3 para tener los tres clientes que mas dinero generaron*/
SELECT a.cliente 
FROM(
SELECT ROW_NUMBER() OVER(ORDER BY r.mas_compra DESC) as cliente_mas_altos,r.cliente,r.mas_compra
FROM(
SELECT c.nombre as cliente, SUM(v.venta) as mas_compra
FROM ventas v
JOIN clientes c ON(v.id_cliente = c.id_cliente)
GROUP BY c.nombre)r
)a
WHERE a.cliente_mas_altos<=3;


/*Problema 3
Obtener el producto con mayor venta acumulada.*/
/*Primero se hace una subconsulta con una clausula join de las tablas ventas y productos despues
se hace ahi una funcion de agregacion sum a la columna venta agrupando con la clausula group by la 
columna de producto para ver el total de ventas pero por cada producto, despues se hace una consulta
afuera que utiliza una funcion de ventana rank aplicada al calculo hecho de la venta para asi 
poder tener un ranking de ventas pero por producto al final usamos otra consulta afuera envolviendo esta
como subconsulta donde traemos solo el producto y filtramos en la clausula where donde este ranking
que hicimos sea a uno para que siempre tengamos la mayor venta acumulada*/
SELECT r.producto
FROM(
SELECT RANK() OVER (ORDER BY a.mayor_venta DESC) as ranking, a.mayor_venta,a.producto
FROM(
SELECT SUM(v.venta) as mayor_venta,p.nombre_producto as producto
FROM ventas v
JOIN productos p ON(v.id_producto=p.id_producto) 
GROUP BY p.nombre_producto)a
)r
WHERE ranking=1;


/*Problema 4*/
/*Obtener el producto más vendido por cada categoría.
Aquí quiero que pienses en:
PARTITION BY
+
ROW_NUMBER()*/
/*Primero hacemos una subconsulta donde aplicamos una clausla join de las tablas ventas y productos
aplicando la funcion de agregacion sum a la columna venta y agrupando con la clausula group by la
columna de producto para poder tener el total de ventas pero po cada producto despues aplicamos afuera de esta 
subconsulta una consulta donde usamos una funcion de ventana dense rank para poder asignar un ranking por prodcuto
ordenando por la clausula order by a la ventas calculadas al final solo hacemos una consulta
donde solo treaemos el producto cuando en la clausula where sea a uno para obttener el producto
mas vendido por categoria*/
SELECT r.producto
FROM(
SELECT DENSE_RANK() OVER (PARTITION BY a.producto ORDER BY a.mayor_venta DESC) as ranking,
a.mayor_venta,a.producto
FROM(
SELECT SUM(v.venta) as mayor_venta,p.nombre_producto as producto
FROM ventas v
JOIN productos p ON(v.id_producto=p.id_producto) 
GROUP BY p.nombre_producto)a
)r
WHERE ranking=1;

WITH ventas_producto AS (
    SELECT
        p.nombre_producto AS producto,
        c.nombre_categoria AS categoria,
        SUM(v.venta) AS total_venta
    FROM ventas v
    JOIN productos p
        ON v.id_producto = p.id_producto
    JOIN categorias c
        ON p.id_categoria = c.id_categoria
    GROUP BY
        p.nombre_producto,
        c.nombre_categoria
),
ranking AS (
    SELECT
        producto,
        categoria,
        total_venta,
        ROW_NUMBER() OVER (
            PARTITION BY categoria
            ORDER BY total_venta DESC
        ) AS ranking
    FROM ventas_producto
)
SELECT
    producto,
    categoria,
    total_venta
FROM ranking
WHERE ranking = 1;


/*Problema 5
Crear un ranking de clientes según sus compras.*/
/*Para este ejercicio hacemos un join de las tablas de ventas con clientes haciendo una funcion de
agregacion sum a la columna ventas y agrupando con la clausula group by por cliente, eso en una subconsulta
despues hacemos una consulta usando una funcion de ventana donde usamos un rank aplicado a la columna
de compras para tener un ranking conforme a las compras*/
SELECT RANK() OVER(ORDER BY r.compras DESC) as ranking_compras,
r.cliente,r.compras
FROM(
SELECT c.nombre as cliente,SUM(v.venta) as compras
FROM ventas v
JOIN clientes c on(v.id_cliente=c.id_cliente)
GROUP BY c.nombre)r;


/*Problema 6
Comparar cada venta contra el total comprado por ese cliente.*/
/*Para esto hacemos un join de las tablas ventas y clientes, despues hacemos una funcion de 
agregacion con ventana sumando las venta y particionando por el nombre para poder ver el total
de compras por cad cliente asi como la compra separada por cada cliente*/
SELECT c.nombre as cliente,v.venta, 
SUM(v.venta) OVER(PARTITION BY c.nombre)as total_cliente 
FROM ventas v
JOIN clientes c ON(v.id_cliente=c.id_cliente); 


/*Problema 7*/
/*Crear una CTE con las ventas por categoría y después obtener solamente 
las categorías cuyo total esté por encima del promedio.*/
/*Para este ejercicio realizamos un primer bloque con las clausulas join a las tablas de ventas,
productos y categorias a la columna ventas agruoando con el nombre de la categoria para tener
el total de ventas por categorias despues hacemos otro bloque de cte donde sacamos el promedio de las
ventas y al final solo hacemos un cross join donde traemos todas las ventas por categoria filtrando
en la clausula where que el total de ventas sea mayor a el promedio que sacamos en los bloques pasados*/
WITH venta_categoria as(
	SELECT SUM(v.venta) as total_venta_categoria,c.nombre_categoria as categorias
	FROM ventas v
	JOIN productos p on(v.id_producto=p.id_producto)
	JOIN categorias c on(p.id_categoria=c.id_categoria)
	GROUP BY c.nombre_categoria
)
, t_promedio as(
	SELECT ROUND(AVG(v.venta),2) as promedio
	FROM ventas v
	)
SELECT vc.total_venta_categoria
FROM venta_categoria vc
CROSS JOIN t_promedio p
WHERE vc.total_venta_categoria>promedio;

WITH venta_categoria AS (
    SELECT
        c.nombre_categoria AS categoria,
        SUM(v.venta) AS total_venta_categoria
    FROM ventas v
    JOIN productos p
        ON v.id_producto = p.id_producto
    JOIN categorias c
        ON p.id_categoria = c.id_categoria
    GROUP BY c.nombre_categoria
),
promedio_categoria AS (
    SELECT AVG(total_venta_categoria) AS promedio
    FROM venta_categoria
)
SELECT
    vc.categoria,
    vc.total_venta_categoria
FROM venta_categoria vc
CROSS JOIN promedio_categoria p
WHERE vc.total_venta_categoria > p.promedio;


/*Problema 8*/
/*Crear una vista:
reporte_ventas
que combine las cuatro tablas.*/
/*Para este ejercicio solo hacemos un join con las tablas de ventas,clientes,productos,
categorias trayendo las columnas del cliente, categoria,producto,cantidad,venta y fecha
y usamos la sintaxis de crear la vista metiendo toda esta consulta y asiganando un nombre a 
la vista ademas al final hacemos un select con el nombre de la vista para verla*/
CREATE VIEW reporte_cliente_empresa AS
SELECT c.nombre as cliente,ct.nombre_categoria as categoria,
p.nombre_producto as producto,v.cantidad,v.venta,v.fecha
FROM ventas v
JOIN clientes c on (v.id_cliente=c.id_cliente)
JOIN productos p on(v.id_producto = p.id_producto)
JOIN categorias ct on(ct.id_categoria=p.id_categoria);

SELECT * FROM reporte_cliente_empresa;


/*Problema 9*/
/*Obtener el ranking de productos dentro de cada categoría.*/
/*Para esto usamos un cte en donde primero hacemos un join entre las tablas de ventas,productos
y categorias haciendo uan funcion de agregacion sum a la columan ventas agrupando con la funcioon de agregacion
sum a las columnas productos y categorias para obtener el total de ventas por categoria y producto
esto en el primer bloque del ctem despues hacemos otro bloque de cte donde realizamos una funcion 
de ventada dense rank a la columna de categoria y ordenando por el totla de ventas antes calculado
de la tabla que creamos en el cte anteriormente para poder tener el ranking  de prodcutos dentro
de cada categoria*/
WITH ventas_por_producto_categoria as(
	SELECT p.nombre_producto as producto, c.nombre_categoria as categoria,sum(venta) as total_venta
	FROM ventas v
	JOIN productos p on(v.id_producto=p.id_categoria)
	JOIN categorias c on(p.id_categoria=c.id_categoria)
	GROUP BY p.nombre_producto,c.nombre_categoria
	)
,ranking_productos as(
SELECT DENSE_RANK() OVER(PARTITION BY categoria ORDER BY total_venta DESC) as rankin_productos
,total_venta ,categoria, total_venta
FROM ventas_por_producto_categoria
) SELECT * FROM ranking_productos;

WITH ventas_por_producto_categoria AS (
    SELECT
        p.nombre_producto AS producto,
        c.nombre_categoria AS categoria,
        SUM(v.venta) AS total_venta
    FROM ventas v
    JOIN productos p
        ON v.id_producto = p.id_producto
    JOIN categorias c
        ON p.id_categoria = c.id_categoria
    GROUP BY
        p.nombre_producto,
        c.nombre_categoria
),
ranking_productos AS (
    SELECT
        producto,
        categoria,
        total_venta,
        DENSE_RANK() OVER (
            PARTITION BY categoria
            ORDER BY total_venta DESC
        ) AS ranking_productos
    FROM ventas_por_producto_categoria
)
SELECT *
FROM ranking_productos;


/*Problema 10 — Integrador*/
/*Crear una consulta que muestre:
cliente
ciudad
producto
categoria
venta
ranking_producto
total_cliente*/
/*Para esta consulta use cte en donde hacemos un join con las tablas de ventas, clientes, productos y 
categorias para traer los primeras columnas que piden, despues en otro bloque de codigo saque con una
funcion de agregacion el total de clientes, despues en otros dos bloques de codigo obtuve aplique
una funcion de ventana para poder obtener el ranking del producto al final realice otros dos bloques
usando clausulas join para poder obtener todas las columnas de cliente, ciudad, producto,categoria,
venta,ranking y total de cliente*/
WITH consulta1 as(
	SELECT c.nombre as cliente,c.ciudad,p.nombre_producto as producto,
	ct.nombre_categoria as categoria,venta
	FROM ventas v
	JOIN clientes c on (v.id_cliente=c.id_cliente)
	JOIN productos p on(v.id_producto = p.id_producto)
	JOIN categorias ct on(ct.id_categoria=p.id_categoria)
	)
,consulta2 as(
	SELECT c.nombre as cliente,SUM(v.venta) AS total_cliente 
	FROM ventas v
	JOIN clientes c ON(v.id_cliente=c.id_cliente) 
	GROUP BY c.nombre
	)
,consulta3  as(
	SELECT p.nombre_producto as producto, c.nombre_categoria as categoria,sum(venta) as total_venta
	FROM ventas v
	JOIN productos p on(v.id_producto=p.id_categoria)
	JOIN categorias c on(p.id_categoria=c.id_categoria)
	GROUP BY p.nombre_producto,c.nombre_categoria
	)
,consulta4 as(
SELECT DENSE_RANK() OVER(PARTITION BY categoria ORDER BY total_venta DESC) as rankin_productos
,total_venta ,categoria, total_venta
FROM consulta3
)
, consulta5 as(
SELECT c1.*,c2.total_cliente
	FROM consulta1 c1
	JOIN consulta2 c2 on(c1.cliente=c2.cliente)
	)
, consulta_final as(
SELECT c3.cliente,
	   c3.ciudad,
	   c3.producto,
       c3.categoria,
	   c3.venta,
	   c4.rankin_productos as ranking_producto,
	   c3.total_cliente
	FROM consulta5 c3
	JOIN consulta4 c4 on(c3.categoria=c4.categoria)
	)SELECT * FROM consulta_final;


WITH ventas_detalle AS (
    SELECT
        c.nombre AS cliente,
        c.ciudad,
        p.nombre_producto AS producto,
        ct.nombre_categoria AS categoria,
        v.venta
    FROM ventas v
    JOIN clientes c
        ON v.id_cliente = c.id_cliente
    JOIN productos p
        ON v.id_producto = p.id_producto
    JOIN categorias ct
        ON p.id_categoria = ct.id_categoria
),
ventas_cliente AS (
    SELECT
        cliente,
        SUM(venta) AS total_cliente
    FROM ventas_detalle
    GROUP BY cliente
),
ventas_producto AS (
    SELECT
        producto,
        categoria,
        SUM(venta) AS total_venta
    FROM ventas_detalle
    GROUP BY
        producto,
        categoria
),
ranking_productos AS (
    SELECT
        producto,
        categoria,
        DENSE_RANK() OVER (
            PARTITION BY categoria
            ORDER BY total_venta DESC
        ) AS ranking_producto
    FROM ventas_producto
)
SELECT
    vd.cliente,
    vd.ciudad,
    vd.producto,
    vd.categoria,
    vd.venta,
    rp.ranking_producto,
    vc.total_cliente
FROM ventas_detalle vd
JOIN ventas_cliente vc
    ON vd.cliente = vc.cliente
JOIN ranking_productos rp
    ON vd.producto = rp.producto
   AND vd.categoria = rp.categoria;
	



