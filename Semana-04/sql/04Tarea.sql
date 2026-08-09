/*Data Engineer de una empresa de juguetes.*/

/*El gerente solicita:*/

1/*Total vendido por cliente.*/
/*Este enunciado indica el total de ventas pero por cada cliente no el total en general
para esto usamos la funcion de agregacion sum aplicado a la columna de venta para tener el 
total pero usamos la clausula group by aplicada a la columna de cliente para poder agrupar
esta suma pero por cada cliente*/
SELECT 
	cliente, SUM(venta) AS venta
FROM ventas
GROUP BY cliente;


/*Cliente con mayor compra.*/
/*Aqui tenemos que ver el cliente con mayor compra para esto hay dos posibilidades 
sumar todo y agrupoar por cliente para ver quuein compro mas , pero la otra y la que entendi
del enunciado fue que se hace para cada compra por separado , en este caso aplicamos la funcion 
de agregacion Max para obtener el numero de la commpra mas alta de los clientes, despues agrupamos 
por cliente para ver la compra mas alta del cliente y por la sintaxis de la agrupacion
ya que usamos al columna cliente y ordenamos de manera descendente para ver quien de todos
los cleintes compro mas al final solo usamos un limit para delemitar cual due el cliente
con mayor compra*/
SELECT
    cliente,
    SUM(venta) AS total_compras
FROM ventas
GROUP BY cliente
ORDER BY total_compras DESC
LIMIT 1;


/*Categoría más vendida.*/
/*Se tiene que ver el total de compras pero estableciendo por cada categoria para ver cual
vende mas para esot usamos de nuevo la funcion de agregacion sum aplicada a la columand e ventas
depues usamos la clausula group by a la columna de categoria para poder agrupar cada 
total de compras por categoria */
SELECT
    categoria,sum(venta)AS total_ventas
FROM ventas
GROUP BY categoria
ORDER BY total_ventas DESC
LIMIT 1;


/*Promedio por categoría.*/
/*Se tiene que sacar el promedio de todas las categorias , para esto se uso la funcion de
agregacion AVG a la columna de ventas ya que esta sacara el promedio de la columna
pero como pide por cada categoria usamos la clausula group by para poder hacer ese acomodo
de filas con el mismo tipo con base en la columna categoria*/
SELECT
	categoria,AVG(venta) as prome_venta
FROM ventas
GROUP BY categoria


/*Clasificación de ventas usando CASE.*/
/*Se tiene que usar varios casos en que se asigne un valor que determine cual fue una gran
normal o baja venta para esto usamos la herramienta case para evaluar el compra y devolver
como valor en texto si cayo en alguno de los casos mencionados*/
SELECT 
	id,cliente,producto,categoria,venta,
	CASE WHEN venta<=190 THEN 'Venta baja'
		WHEN venta<=290 THEN 'Venta normal'
		ELSE 'Venta alta'
		END AS valor,
		fecha
FROM ventas;		

/*Año y mes de cada venta.*/
/*Se extra la fecha dependiendo si quieres por año mes o dia para esto usamos la funcion
de fechas extract para poder obtener el año y despues el mes como se indica en el ejecicio 
por cada venta*/
SELECT EXTRACT(YEAR FROM fecha)AS año ,EXTRACT(MONTH FROM fecha)AS mes, venta
FROM ventas;


/*Total de registros.*/
/*Se tienen que ver el total de registros de la tabla , para esto usamos la funcion de agregacion
count solo para contar cuantos registros tenemos en total*/
SELECT COUNT(*) 
FROM ventas;


/*Venta máxima.*/
/*Tenemos que ver solo la venta maxima de las compras, para esto usamos solo la funcion
de agregacion max para que no devuelva el registro maximo de ventas*/
SELECT MAX(venta) as venta_maxima 
FROM ventas;


/*Venta mínima.*/
/*Tenemos que ver solo la venta minima de las compras, para esto usamos solo la funcion
de agregacion main para que no devuelva el registro minimo en ventas*/
SELECT MIN(venta) as venta_minima 
FROM ventas;


/*Promedio general.*/
/*Se obtiene el promedio o media aritmetica de la columna que tu establescas
para esto usamos la funcion avg para poder obtener el promedio general de las compras*/
SELECT AVG(venta) as promedi_general
FROM ventas;

