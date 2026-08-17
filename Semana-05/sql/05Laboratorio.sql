/*Creamos la base de datos*/
CREATE DATABASE semana_05_data_engineering;

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
(5, 'Lego', 4),
(6, 'Figura coleccionable', 5);

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


INSERT INTO productos (id_producto, nombre_producto, id_categoria) VALUES
(1, 'Muñeca', 1),
(2, 'Carro', 1),
(3, 'Rompecabezas', 2),
(4, 'Pinturas', 3),
(5, 'Lego', 4);

/*Ahora para mejorar el ejecicicio con Joins se hace una adecuacion a los datos ingresados
para esto usamos DML lenguaje de manipulacion de datos delete si queremos elimiar fila por fila
la informacion de la tabla , pero tambien podemos usar DDL lenguaje de definicion de datos
truncate para borrar todos los registros de la tabla*/
TRUNCATE TABLE ventas;
TRUNCATE TABLE productos;

INSERT INTO productos (id_producto, nombre_producto, id_categoria) VALUES
(1, 'Muñeca', 1),
(2, 'Carro', 1),
(3, 'Rompecabezas', 2),
(4, 'Pinturas', 3),
(5, 'Lego', 4);


/*Ejercicios del laboratorio*/
/*Ejercicio 1*/
/*Realizar un INNER JOIN entre:
  clientes
  ventas
 y mostrar:
  nombre_cliente
  venta*/
/*Para este ejercicio primero vemos las tablas e identificamos porque campo podemos relacionarlo
en este caso id_cliente apararece en ambas tablas por lo que conviene relacionarlas por ese campo
aplicando la clausula inner join y dando un alias a las tablas para hacer mas facil al consulta
al momento de poner la columan de cada tabla y que sea mejor identificable*/
SELECT c.nombre as nombre_cliente,v.venta
FROM clientes c 
INNER JOIN ventas v ON (c.id_cliente = v.id_cliente);


/*Ejercicio 2*/
/*Realizar un LEFT JOIN.*/
/*Mostrar todos los clientes aunque no tengan ventas.*/
/*Para esta consulta igual usamos la clausula Left join identificando las columnas por la cual podemos
hacer la relacion de las tablas haciendo un left join a la tabla clientes viendo todos sus registros
y los que coincidan con la tabla ventas los que no les pondra valor null , ademas renombrando las 
columnas por el nuevo alias que le dimos a las tablas*/
SELECT c.nombre as nombre_cliente,v.venta
FROM clientes c
LEFT JOIN ventas v ON (c.id_cliente = v.id_cliente);


/*Ejercicio 3*/
/*Relacionar:
  productos
  categorias
 Mostrar:
  producto
  categoría*/
/*Para este ejercicio usamos un inner join ya que queremos ver las coincidencias en ambas tablas
de el producto que se tiene y la categoria como en la tabla de productos viene el producto y en la de
categoria su categoria conviene usar esa clausula mostrando las columnas que solicitan de producto
y categoria de ambas tablas*/
SELECT p.nombre_producto as producto, c.nombre_categoria as categoria
FROM productos p
INNER JOIN categorias c ON(p.id_categoria=c.id_categoria);


/*Ejercicio 4*/
/*Relacionar:
  clientes
  ventas
  productos
 Mostrar:
  cliente
  producto
  venta*/
/*Para este ejercicio igual usamos la clausula inner join ya que queremos saber el clientes
que se encuentra en la tabla clientes, las ventas que se encuentran en la tabla ventas y el producto
que se encuentra en la tabla producto por lo que queremos ver todas las coincidencias de estas columnas
en las tres tablas mencionas , solo tenemos que identificar la columna por la cual podemos relacionar
estas tres tablas en este caso el id_cliente para las tablas clientes y ventas y la columna
id_producto para las tablas de ventas y productos al final solo renombramos las columnas 
por el nombre de su tabla*/  
SELECT c.nombre as cliente,p.nombre_producto as producto,v.venta
FROM clientes c
INNER JOIN ventas v ON(c.id_cliente = v.id_cliente)
INNER JOIN productos p ON(v.id_producto = p.id_producto);


/*Ejercicio 5*/
/*Obtener el total comprado por cada cliente.
Aquí debes utilizar:
JOIN
SUM()
GROUP BY*/
/*Para este ejercicio identificamos primero las columnas que necesitamos de las tablas que tienen 
esats columnas, posterior a eso vemos que clausula de join nos conviene mas en este caso se usa un 
Inner join entre las tablas de clientes que es donde estan todos los clientes y la tabla de ventas
que viene las compras realizadas entonces ahi ya obtenemos todas las coincidencias entre cleintes y venta
que se tienen de ambas tablas de ahi solo hacemo suna funcion de agregacion sobre la columna venta
para obtener el total de ventas y al final usamos la clausula group by para poder agrupar ese total 
de compras pero por cada cliente a la columan cliente */
SELECT c.nombre as nombre_cliente,SUM(v.venta) as venta
FROM clientes c 
INNER JOIN ventas v ON (c.id_cliente = v.id_cliente)
GROUP BY c.nombre;


/*Ejercicio 6*/
/*Obtener el total vendido por categoría.*/
/*Para este ejercicio fue casi igual que el pasado solo que se tuvo que usar otro inner join
ya que en la tabla de ventas no viene tal cual la categoria por lo que se tuvo que usar la tabla
producto que tiene relacion con la tabla ventas y ahora si poner la columna de categorias
con la suma del total vendido de la tabla ventas y uniendola con la tabla de producto que
se relaciona con ventas y con la tabla de categoria, al final agrupamos por el nombre de categoria
*/
SELECT c.nombre_categoria as categoria,SUM(v.venta) as total_vendido
FROM ventas v
INNER JOIN productos p ON(v.id_producto = p.id_producto)
INNER JOIN categorias c ON(p.id_categoria=c.id_categoria)
GROUP BY  c.nombre_categoria;


/*Ejercicio 7*/
/*Mostrar clientes que nunca han realizado una compra.
Aquí quiero que pienses en:
LEFT JOIN
+
IS NULL*/
/*Para este ejercicio usamos la clausula Left Join identificando las columnas que necesitamos de las tablas
donde se encuentran, como piden las compras y clientes entonces identificamos la columna de commora en la 
tabla de ventas y la columna de cliente en la tabla clientes , hacemos el left join para poder obtener
todos los registros de los clientes a la tabla clientes con la tabla ventas para que coincidan solo todos los clientes
y los valores de la tabla derecha de ventas que no encuentre asigen un valor de null ya que piden los clientes
que no han realizado compras al final solo usamos la clusula where para indicar que nos de las ventas
que sean null o sea que no tengan valor y por tanto clientes que no han hecho compras*/
SELECT c.nombre as nombre_cliente,v.venta
FROM clientes c
LEFT JOIN ventas v ON (c.id_cliente = v.id_cliente)
WHERE v.venta IS NULL;


/*Ejercicio 8*/
/*Realizar un FULL JOIN.
Explicar qué resultado obtuviste.*/
/*Para este ejercicio no indica de que tablas asi que me base en el ejercicio pasado use la clausula
FULL JOIN par las tablas clientes y ventas , mostrando los resultados de las columnas de nombre y su venta
el resultado que arrojo fue todos los nombres y todas las ventas que hay en las dos tablas ya que 
esat clasula devuelve todos lo registros o filas que coinciden en tablas izquieras o tablas derechas
rellenando los valores que no coinciden con valores null, me da todos los clientes con las ventas realizadas
en caso de que no haya venta pondra el cliente con una venta en null*/
SELECT c.nombre as nombre_cliente,v.venta
FROM clientes c
FULL JOIN ventas v ON (c.id_cliente = v.id_cliente);


/*Ejercicio 9*/
/*
Realizar un CROSS JOIN pequeño.
Explicar por qué genera tantas filas.*/
/*Para este ejercicio tambien use las columnas nombre y ventas de las tablas de clientes y ventas
me da muchos registros ya que al usar la operacion cross join este me devolvera todas las combinaciones
posibles que hay en las dos tablas por eso da mas registros que los joins no solo la coincidencias,
en conclusion combina todas las filas de la primer tabla con todas las filas de la segunda tabla*/
SELECT c.nombre as nombre_cliente,v.venta
FROM clientes c
CROSS JOIN ventas v;


/*Ejercicio 10*/
/*Crear un JOIN utilizando alias:
c
v
p
cat*
y explicar qué representa cada alias.*/
/*Para este ejercicio solo hice un inner join entre las tablas clientes , ventas,productos
y categorias renombrando cada tabla con un identificador de abreviatura de cada tabla, practicamente
utilizando solo la primer letra de cada nombre de la tabla para clientes use su inicial c
para ventas su inical de v para la tabla de productos utilice su letra p y para la tabla de
categorias y para que nos e confundiera con la de clienters use cat , despues puse cada
columna de cada tabla con su renombre de tabla que le habia dado y use la clausula Inner join 
para ver la coincidencias de cliente , su id de producto su venta y su categoria de todas
estas tablas*/
SELECT c.nombre as cliente,p.id_producto,v.venta,cat.nombre_categoria as categoria
FROM clientes c
INNER JOIN ventas v ON(c.id_cliente = v.id_cliente)
INNER JOIN productos p ON(v.id_producto = p.id_producto)
INNER JOIN categorias cat ON(p.id_categoria=cat.id_categoria);

