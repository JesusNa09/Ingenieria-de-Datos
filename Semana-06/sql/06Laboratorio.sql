/*Creamos la base de datos*/
CREATE DATABASE semana_06_data_engineering;

/*Este es lenguage de definicion de datos DDL en este caso usamos el comando DROP para eliminar
la tabla con todo su contenido*/
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;


/*Crearemos otras tablas con sus relaciones*/
/*Creacion de tabla clientes con sus respectivos campos y tipos de campos*/
CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY,
	nombre VARCHAR(100),
	ciudad VARCHAR(100)
);


/*Creacion de tabla categorias con sus respectivos campos y tipos de campos*/
CREATE TABLE categorias(
	id_categoria INT PRIMARY KEY,
	nombre_categoria VARCHAR(100)
);


/*Creacion de tabla productos con sus respectivos campos y tipos de campos*/
CREATE TABLE productos(
	id_producto INT PRIMARY KEY,
	nombre_producto VARCHAR(100),
	id_categoria INT,

	FOREIGN KEY (id_categoria)
		REFERENCES categorias(id_categoria)
);


/*Creacion de tabla ventas con sus respectivos campos y tipos de campos*/
CREATE TABLE ventas(
	id_venta INT PRIMARY KEY,
	id_cliente INT,
	id_producto INT,
	cantidad INT,
	venta NUMERIC(10,2),
	fecha DATE,

	FOREIGN KEY(id_cliente)
		REFERENCES clientes(id_cliente),

	FOREIGN KEY(id_producto)
		REFERENCES productos(id_producto)
);


SELECT * FROM clientes;

/*Pasamos a insertar los datos para las tablas creadas con la instruccion de insert*/
/*Insercion de datos para la tabla CLIENTES*/
INSERT INTO clientes (id_cliente, nombre, ciudad) VALUES 
(1, 'Ana', 'Irapuato'),
(2, 'Luis', 'Leon'),
(3, 'Pedro', 'Celaya'),
(4, 'Maria', 'Salamanca'),
(5, 'Carlos', 'Guanajuato');

/*Insercion de datos para la tabla CATEGORIAS*/
INSERT INTO categorias (id_categoria, nombre_categoria) VALUES
(1, 'Juguetes'),
(2, 'Juegos'),
(3, 'Arte'),
(4, 'Construccion'),
(5, 'Coleccionables');

/*Insercion de datos para la tabla PRODUCTOS*/
INSERT INTO productos (id_producto, nombre_producto, id_categoria) VALUES
(1, 'Muñeca', 1),
(2, 'Carro', 1),
(3, 'Rompecabezas', 2),
(4, 'Pinturas', 3),
(5, 'Lego', 4);


/*Insercion de datos para la tabla VENTAS*/
INSERT INTO ventas
(id_venta, id_cliente, id_producto, cantidad, venta, fecha)
VALUES
(1, 1, 1, 2, 200.00, '2025-01-10'),
(2, 2, 2, 1, 150.00, '2025-01-11'),
(3, 1, 3, 2, 300.00, '2025-01-12'),
(4, 3, 4, 3, 180.00, '2025-01-13'),
(5, 2, 5, 1, 450.00, '2025-01-14'),
(6, 1, 2, 2, 300.00, '2025-01-15'),
(7, 3, 1, 1, 100.00, '2025-01-16');


/*Ejercicios del laboratorio*/
/*Ejercicio 1 — Subconsulta*/
/*Obtener las ventas superiores al promedio general.*/
/*Para esta consulta primero detallamos lo que nos pide por separado primero nos piden las ventas
pero que sean mayores al promedio , por eso usamos una subconsulta ya que nos pide en segundo lugar el
promedio geenral para esto usamos una funcion de agregacion AVG para sacar el promedio general de todas
las ventas siendo esta la consulta interna ya que en la consulta principal mandamos a trear todos
los campos pero filtrando en el where que nuestra columna de venta sea mayor a lo que esta en nuestra
subconsulta de el promedio sacado previamente para obtener las ventas mayores al promedio*/
SELECT * FROM ventas
WHERE venta>(
Select AVG(venta) as promedio_general_ventas
from ventas);


/*Ejercicio 2 — Subconsulta*/
/*Obtener los clientes cuyo total de compras sea superior al promedio de compras de todos los clientes.*/
/*Para este ejercicio usaremos una subconsulta en donde primero sacamos el total de compras de
cada cliente usando la clausula join para unir las tablas de clientes donde estan sus nombres y las
ventas donde estan sus compras por su columna identica en ambas tablas de id_cliente, haciendo
una funcion de agregacion de sum a la columna de ventas agrupadas por clientes para ver los clientes
con su total de compras de cada uno posterior a eso hacemos una consulta donde solo ponemos la columna 
cliente para ver ahora si los nombre de cada cliente con la subconsulta previa hecha y condicionando en la 
clausula where que estas ventas de cada cliente sea mayor a otra subconsulta donde usamos
otra funcion de agregacion avg para obtener el promedio de compras de todos los clientes */
/*SELECT c.cliente
FROM (
SELECT c.nombre as cliente, sum(v.venta) as total_compras
fROM clientes c
JOIN ventas v on(c.id_cliente=v.id_cliente)
GROUP BY c.nombre)c
WHERE c.total_compras > (SELECT AVG(venta) as promedio_general_cliente FROM ventas);
*/
WITH compras_cliente as (
SELECT c.id_cliente,c.nombre as cliente,
SUM(v.venta)as total_compras
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente,c.nombre
)
SELECT cliente,total_compras
FROM compras_cliente
WHERE total_compras > (
SELECT AVG(total_compras)
FROM compras_cliente
); 

/*Ejercicio 3 — CTE*/
/*Crear:
ventas_cliente
que contenga:
cliente
total_ventas*/
/*Para este ejercico usamos un comune expresion de la tabla en donde creamos la consulta mediante
la clausula with donde hacemos nuestra consulta haciendo un join de las tablas clientes donde estan los 
nombres de los clientes y ventas donde estas sus ventas , ademas hacemos una funcion de agregacion sum
para poder obtener su total de ventas usando la clausula group by para agrupar esta suma por cliente
al final solo mandamos a llamar las columas de cliente y total de clientes del cte con el nombre que le 
pusimos*/
WITH ventas_clientes as(
	SELECT c.nombre as cliente, SUM(v.venta) as total_ventas
	FROM ventas v
	JOIN clientes c on(v.id_cliente=c.id_cliente)
	GROUP BY c.nombre
	)
	SELECT cliente,total_ventas
	FROM ventas_clientes;

	
/*Ejercicio 4 — CTE + JOIN*/
/*Crear un CTE con las ventas por cliente y después relacionarlo con clientes para obtener:
nombre
ciudad
total_ventas*/
/*Para este ejercico primero se hace mediante un cte en el cual primero se obtiene la ventas
por cliente en el cual se hace un join entre las tablas de clientes y ventas ademas de usar la 
funcion de agregacion sum para poder obtener las ventas por clientes agupando con la clausula 
group by para obtner ese total por cada cliente , al final solo se realiza otro bloque de codigo
con el with para obtener la ciudad del cliente y total de sus ventas de clientes con con join 
entre la tabla creada y la de clientes*/
/*WITH ventas_por_cliente as(
	SELECT c.nombre, SUM(v.venta) as total_ventas
	FROM ventas v
	INNER JOIN clientes c on(v.id_cliente=c.id_cliente)
	GROUP BY c.nombre
	)
, ciudad_clientes as(
	SELECT vc.nombre, c.ciudad,vc.total_ventas
	FROM ventas_por_cliente vc
	INNER JOIN clientes c on(vc.nombre = c.nombre)
	)
	SELECT * FROM ciudad_clientes;*/	
	
WITH ventas_por_cliente AS (
    SELECT
        c.id_cliente,
        c.nombre,
        SUM(v.venta) AS total_ventas
    FROM ventas v
    JOIN clientes c
        ON v.id_cliente = c.id_cliente
    GROUP BY
        c.id_cliente,
        c.nombre
)
SELECT
    vc.nombre,
    c.ciudad,
    vc.total_ventas
FROM ventas_por_cliente vc
JOIN clientes c
    ON vc.id_cliente = c.id_cliente;

/*Ejercicio 5 — ROW_NUMBER*/
/*Numerar las ventas de mayor a menor:*/
/*En este ejercicio se usa una funcion ventana row number aplicado a la columna de venta en la
tabla ventas usando la clausula order by para poder obtener un numero un conteo de las ventas
de mayor a menor con el desc*/
SELECT ROW_NUMBER() OVER (order by venta desc) as numero_venta,venta
FROM ventas;


/*Ejercicio 6 — ROW_NUMBER + PARTITION BY*/
/*Obtener la venta número 1 de cada cliente.
Aquí tendrás que pensar cómo utilizar:*/
/*Para este ejercicio se usan las tablas de ventas donde se encuentran las ventas y la de clientes 
donde estan los nombre de cada clientes aplicando un join uniendolas mediante por la columna de id_cliente
para ver las ventas de cada cliente despues se realiza una funcion de ventana row number con una particion en
la columna nombre para poder asignar un numero consecutivo a cada registros pero reiniciando ese conteo por cada
nombre que aparezca en nuestra tabla, ponniendo tambien la clausula order by a la columna ventas para ver el orden
 de esas ventas de mayor a menor al final puedes hacer varias cosas usar un cte o una subconsulta
 en mi caso use esta ultima poneindo las columnas que necesito y filtrando con la clausula where
 esa nueva columna del conteo que hice de las ventas que esten en la pocision uno*/
SELECT r.cliente, r.venta
FROM(
SELECT c.nombre as cliente, ROW_NUMBER () OVER(PARTITION BY c.nombre ORDER BY v.venta DESC)as posicion_venta
,v.venta
FROM ventas v
JOIN clientes c ON(v.id_cliente=c.id_cliente))r
WHERE r.posicion_venta = 1;


/*Ejercicio 7 — RANK*/
/*Crear un ranking de productos según sus ventas acumuladas.*/
/*Para este ejercicio se puede usar la funcion de ventana rank o dense_rank en la cuyal
se aplica primero una consulta donde se usa una funcion de agregacion sum a la venta para obtener
el total de las ventas y agrupando por la columna del nombre del producto esto usando la clausula
join donde se encuentras estas columnas en sus tablas correspodientes ,depues ya se usa la funcion
ventana rank para asignar una posicion a ese total de venta pero por producto aplicando un desc
para que lo asigene como en priemr lugar al de mayor ventass acunuladas, ahi queda bien pero dejara espacios
si hay ventas iguales , por loq ue me gusta e hice otro caso con dense rank ya que hace el ranking
sin saltarse nuemros y ademas si pone el mismo numero a las ventas repetidas*/
/*CASO1 con rank*/
SELECT RANK() OVER (ORDER BY r.venta_acumulada DESC) as ranking, r.venta_acumulada,r.nombre_producto
FROM(
SELECT SUM(v.venta) as venta_acumulada,p.nombre_producto
FROM productos p
JOIN ventas v ON(p.id_producto=v.id_producto)
GROUP BY p.nombre_producto)r;

/*CASO 2 con dense_rank*/
SELECT DENSE_RANK() OVER (ORDER BY r.venta_acumulada DESC) as ranking, r.venta_acumulada,r.nombre_producto
FROM(
SELECT SUM(v.venta) as venta_acumulada,p.nombre_producto
FROM productos p
JOIN ventas v ON(p.id_producto=v.id_producto)
GROUP BY p.nombre_producto)r;


/*Ejercicio 8 — DENSE_RANK*/
/*Crear un ranking de categorías.
Después compara el resultado con RANK().*/
/*Para este ejercicio primero se relaiza un join entre las tablas de las columnsa que se van a utilizar
productos, ventas y categorias, aplicando una funcion de agregacion sum para poder obtener
un total de ventas agrupando por el nombre de categoria , al final se realiza una subconsulta 
donde se aplcia una funcion de ventana dense_rank a las ventas ordenando de mayor a menor con la 
clasula order by desc para ver el rankig de el total de ventas por categoria de la mayor a la menor
la comparacion enetre rank y dense rank es que rank asigana un numero pero deja espacios si hay
numeros repetidos y dense rank hace ese conteo pero no deja esapcios asigna el numero y si hay numeros
repetidos pone el mismo numero sin dejar espacios y depues pone el numero consecutivo*/
SELECT DENSE_RANK() OVER (ORDER BY r.venta_acumulada DESC) as ranking, r.venta_acumulada,r.nombre_categoria
FROM(
SELECT SUM(v.venta) as venta_acumulada,c.nombre_categoria
FROM productos p
JOIN ventas v ON(p.id_producto=v.id_producto)
JOIN categorias c ON(p.id_categoria=c.id_categoria)
GROUP BY c.nombre_categoria)r;


/*Ejercicio 9 — GROUP BY vs Window Function*/
/*Crear dos consultas:
Consulta A
Utilizando:
GROUP BY
Consulta B
Utilizando:
SUM() OVER(PARTITION BY ...)*/
/*Consulta A*/
/*En esta primer consulta se realiza una funcion de agregacion sum a la columna de ventas
para ver su total de ventas agrupando por la clausula group by nombre para ver el total pero de
cada cliente usando tambien la clausula join para poder utilizar las columnas en las tablas en las que 
se encuentra cada uno*/
SELECT c.nombre as cliente,SUM(v.venta) as total_venta_cliente 
FROM ventas v
JOIN clientes c on(v.id_cliente = c.id_cliente)
GROUP BY c.nombre;

/*Cosnulta B*/
/*En la segunda consulta se utiliza primero un join de las tablas ventas y clientes que es donde estan
las columna que necesitamos y se aplica una funcion de ventana a la funcion de agregacion
de las ventas para ver ese total de ventas de los clientes pero con la venta por separado de cada registro
con su nombre de cliente, se concluye que con grouo by se reduce registros solo dejamando el total pero
por cada cliente y en la funcion de ventana aparece ese mismo total sin quitar registros solo que poniendo esa
misma suma al lado de la columna donde esta su clietne y venta por separado*/
SELECT c.nombre as cliente,v.venta,
SUM(v.venta) OVER(PARTITION BY c.nombre) as  total_venta_cliente 
FROM ventas v
JOIN clientes c on(v.id_cliente = c.id_cliente)



/*Ejercicio 10 — VIEW*/
/*Crear:
CREATE VIEW reporte_ventas AS
que muestre:
cliente
producto
categoria
venta
fecha*/
/*Para este ejercicio primero vez loq ue usaras en tu vista o sea tu consulta, en este caso se realiza un
join entre las tablas ventas clientes productos y categorias que es donde se encuentran las 
columnas que se piden y posterior se realiza la sintaxis para poder crear la vista con su parte de as
, al final solo llamas a  la vista con el operador select y el nombre de tu vista*/
CREATE VIEW reporte_ventas AS
SELECT c.nombre as cliente,p.nombre_producto as producto,ct.nombre_categoria as categoria,v.venta,v.fecha
FROM ventas v
JOIN clientes c on (v.id_cliente = c.id_cliente)
JOIN productos p on(v.id_producto=p.id_producto)
JOIN categorias ct on(p.id_categoria=ct.id_categoria);

SELECT * FROM reporte_ventas;


