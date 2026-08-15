/*Data Engineer de una empresa de juguetes.*/
/*El gerente solicita:*/

/*1. Obtener:
Cliente,Producto,Categoría,Venta,Fecha*/
/*Para este ejercicio primero identificamos lo que se nos pide despues lo identificamos en las columnas
de las tablas que se encuentran, posterior a eso vemos que tipo de join usar y porque columnas podemos
hacer la relacion para obtener los resultados requeridos, use un inner join para todas las tablas
ya que queria encontrar la relacion que tuviera coincidencias con todos los registros de todas la tablas
observando que la tabla venta es donde mas columasn tenia en comun con las otras tablas para relacionarlas
econtrando la relacion por las columnas de id_cliente, para la tabla de ventas y clientes, la columna
id_producto para las tablas de ventas y de productos y la columna de id_categoria para las tablas
productos y categorias , mostrando las columnas que pidierdon de Cliente,Producto,Categoría,Venta,Fecha
incialmente puestas en el select con el renombre de la tabla que le dimos a cada una*/
SELECT c.nombre as Cliente,p.nombre_producto as Producto,cat.nombre_categoria as categoria,
v.venta as Venta,v.fecha as Fecha 
FROM ventas v
INNER JOIN clientes c ON(v.id_cliente=c.id_cliente)
INNER JOIN productos p ON(v.id_producto=p.id_producto)
INNER JOIN categorias cat ON(p.id_categoria=cat.id_categoria);


/*2.¿Cuánto ha comprado cada cliente?*/
/*Para este ejercici hay dos opciones ver solo los clientes que han hecho compras o ver los clientes
que han hecho compras y incluyendo a los que no han hecho ninguna compra, para cualquier caso 
hay que identificar las columnas que necesitamos y en que tablas de encuentran , para el pirmer caso use
un inner join de las tablas clientes donde esatn los nombres de cada cliente con la tabla venta 
donde estan sus compras identificando la relacion por la columna id_cliente, solo que para obtener 
el total comprado por cliente usamos una funcion de agregacion sum a la columna de venta para sumar todas 
las compras ,al final agrupamos por la columna cliente para obtener el total de cada cliente*/
SELECT c.nombre as Cliente,sum(v.venta) as total_comprado
FROM ventas v
INNER JOIN clientes c ON(v.id_cliente=c.id_cliente)
GROUP BY c.nombre;


/*3.¿Cuánto se ha vendido de cada categoría?*/
/*Iguan que todo identificamos primero columnas a usar y tablas donde se encuentran posterior a eso
vemos que tipo de join usar, usa un innero join en las tablas de ventas, productos,categorias para
obtener todas las coincidencias de las tablas,piden las lo vendido por categoria entonces ponemos de la 
tabla ventas la venta o sea lo vendido, e identificamos la columna categoria como no esta en la tabla
de ventas identificamos que hay una tabla de productos que se relaciona con categorias ya que esta no esta
relacionada directamente con ventas por lo que hacemos un inner antes de categoria con producto para poder
al final relacionarlo con la de ventas al final usamos una funcion de agregacion sum a la columna de ventas para
obtener el total vendido y agrupamos por la columna de nombre de categoria para ver ese total por cada categoria*/
SELECT cat.nombre_categoria as categoria,sum(v.venta) as total_categoria
FROM ventas v
INNER JOIN productos p ON(v.id_producto=p.id_producto)
INNER JOIN categorias cat ON(p.id_categoria=cat.id_categoria)
GROUP BY cat.nombre_categoria;


/*4.¿Cuál es el producto que más ventas tiene?*/
/*Para este ejercicio solo se usaron las tablas de ventas donde estan las ventas, productos
donde estan los productos se utilizo la clausula inner join para ver las coincidencias de estas
tablas a partir de las columnas id_producto y se uso una funcion de agregacion sum aplicada a la
columna de ventas agrupando por la columna de producto para ver total de ventas por producto
en algunos casos hay empate para esto convien usar una funcion de ventana para acomodar o establecer
los mas altos auqneu haya empate, ene ste caso use limit para ver las mayores venta aunque hay empate*/
SELECT p.nombre_producto as producto,sum(v.venta) as mayor_ventas
FROM ventas v
INNER JOIN productos p ON(v.id_producto=p.id_producto)
GROUP BY p.nombre_producto
ORDER BY mayor_ventas DESC
LIMIT 2;

/*5.¿Qué clientes nunca han comprado?*/
/*Para este ejercicio aplique un left join a la tabla clientes de la tabla ventas ya que en clientes
estan todos los nombres de los clientes y en ventas las compras hechas se uso esa clausula ya que
partimos de que queremos todos los nombres o sea todos los registros de la tabla izquierda
y las ventas que coincidan con esos nombres lo que no encuentre asigara null y por lo tanto condicionamos
en el where que la venta sea null estableciendo que esos son los clientes que nunca han comprado*/
SELECT c.nombre as Cliente,v.venta as compras
FROM clientes c
LEFT JOIN ventas v ON(c.id_cliente=v.id_cliente)
WHERE v.venta is null;


/*6.¿Qué categorías no tienen productos?*/
/*Para este ejercicio fue casi igual que el pasado solo que identificamos las columnas y tablas
correspondientes poniendo las categorias y nombres de porductos con un lefto join a la tabla categorias
con la tabla productos relacionandolo por la columna id_categoria y condicionando en el where
que el nombre del producto sea null con esto indicamos las categorias que no tienen productos*/
SELECT c.nombre_categoria as categoria,p.nombre_producto as productos
FROM categorias c
LEFT JOIN productos p ON(c.id_categoria=p.id_categoria)
WHERE p.nombre_producto is null;


/*7.¿Cuánto dinero se ha vendido por cliente y categoría?
Aquí tendrás que utilizar:
GROUP BY cliente, categoria*/
/*Para este ejercicio aplicamos un inner join entre las tablas ventas, clientes, productos,categorias
para poder mostrar todas las coincidencias del cliente, categoria y su total vendido,ademas
usamos la funcion de agregacion sum aplicado a la columna ventas para ver el total vendido y usamos
la clausla group by parqa saber ese total pero por el cliente y categoria como dice el enunciado*/
SELECT c.nombre as Cliente,cat.nombre_categoria as categoria,
sum(v.venta) as total_vendido 
FROM ventas v
INNER JOIN clientes c ON(v.id_cliente=c.id_cliente)
INNER JOIN productos p ON(v.id_producto=p.id_producto)
INNER JOIN categorias cat ON(p.id_categoria=cat.id_categoria)
GROUP BY c.nombre,cat.nombre_categoria;


/*8.Obtener las ventas mayores a $300 mostrando:
cliente,producto,categoría,venta*/
/*Para este ejercicio usamos la clausula inner join para las tablas ventas, clientes,prodcutos
y cayegorias para mostrar las columnas solicitadas que coincidan en todas las tablas, despues
solo condicionamos la coluna de ventas que sea mayor a 300 obteniendo asi las ventas mayores a 300*/
SELECT c.nombre as Cliente,p.nombre_producto as Producto,cat.nombre_categoria as categoria,
v.venta as Venta
FROM ventas v
INNER JOIN clientes c ON(v.id_cliente=c.id_cliente)
INNER JOIN productos p ON(v.id_producto=p.id_producto)
INNER JOIN categorias cat ON(p.id_categoria=cat.id_categoria)
WHERE v.venta>300;


/*9.Obtener el total de ventas por ciudad.*/
/*Para este ejercicio realizamos un inner join entre las tablas ventas y ciudad para  encontrar
todas las coincidencias entre esas dos tablas por medio de la columna id_cliente ademas 
usamos la funcion de agregacion en la columna ventas para obtener el total de ventas y usamos
la clasula group by para poder agrupar ese total pero por ciudad*/
SELECT c.ciudad as Ciudad,sum(v.venta) as total_ventas_ciudad
FROM ventas v
INNER JOIN clientes c ON(v.id_cliente=c.id_cliente)
GROUP BY c.ciudad;


/*10.Crear una consulta final que combine:
clientes+ventas+productos+categorias y produzca un pequeño reporte.*/
/*Con la consulta que generamos obtenemos el siguiente reporte:
Para la ciudad de Irapuato vemos que para la categoria de juguetes las ventas mayores a 100
son del cliente Ana con una venta de los productos de muñeca y de carro*/
SELECT c.nombre as cliente,v.venta,p.nombre_producto as producto,
cat.nombre_categoria as categoria,c.ciudad
FROM ventas v
INNER JOIN clientes c ON(v.id_cliente=c.id_cliente) 
INNER JOIN productos p ON(v.id_producto=p.id_producto)
INNER JOIN categorias cat ON(p.id_categoria=cat.id_categoria)
WHERE v.venta >100 and c.ciudad = 'Irapuato' and cat.nombre_categoria= 'Juguetes';


