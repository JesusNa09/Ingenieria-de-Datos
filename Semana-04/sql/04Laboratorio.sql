/*Ejercicio 1
Calcular:
SUM(venta)*/
/*Con la funcion de agregación sum vimos la suma de todas las ventas devolviendonos el total*/
SELECT sum(venta) as venta FROM tota_ventas;


/*Ejercicio 2
Calcular:
AVG(venta)*/
/*Con la funcion de agregación avg que aplicamos a la columna venta estamos obteniendo
el promedio de ventas o media aritmetica*/
SELECT avg(venta) as venta FROM promedio_ventas;


/*Ejercicio 3
Obtener:
MAX()
MIN()*/
/*Con la funcion de agraagacion max aplciada a la venta estamos obteniendo la venta con
mayor cantidad mientras que con la funcion min obtenemos la venta con menor cantidad*/
Select 
	MAX(venta) as venta_maxima,
	MIN(venta) as venta_minima
FROM Ventas;


/*Ejercicio 4
Total vendido por cliente.*/
/*Para este ejercicio queremos saber el total de la venta por cliente para esto aplicamos la funcion 
de agregacion sum a la columna de ventas y despues usamos la clausula group by para
acomodar los registros con el mismo dato para esto la aplicamos a cliente que es la columna que
queremos diferenciar o saber sus ventas totales de cada uno*/
SELECT 
	cliente,sum(venta) as total_venta 
FROM ventas
GROUP BY cliente;


/*Ejercicio 5
Total vendido por categoría.*/
/*Para este ejercicio aplicamos la funcion de agregacion sum a la columna ventas para poder obtener
el total despues aplicamos la clausula Group by a la columna categoria para acomodar 
los registros del total de la ventas pero por categoria*/
SELECT 
	categoria,sum(venta)as total_venta 
FROM ventas
GROUP BY categoria;


/*Ejercicio 6
Clientes con ventas mayores a 300.
(Usar HAVING.)*/
/*Para este ejercicio aplicamos la funcion de agregacion sum para obtener el total de ventas
despues aplicamos la clausula group by para agrupar ese total por cliente y al final usamos
la clausula having ya que nos ayuda a combinar grupos de filas que ya tenemos con la clausula
group by y ahora hacemos en la clausula un having para saber que grupos por cliente en cuanto
venta superan los 300 pesos*/
SELECT
	cliente,sum(venta) as venta
FROM ventas
GROUP BY cliente
HAVING Sum(venta)>300;

/*Ejercicio 7
Clasificar ventas.
Mayor o igual a 400
↓
Alta
Mayor o igual a 200
↓
Media
Menor a 200
↓
Baja
*/
/*Para este ejercicio usamos la herramienta case para evaluar condiciones
en este caso de acuerdo al enunciado ponemos nuestros case dependiendo de la instruccion
y evaluamos el valor dependiendo de en que caso caiga devolvera el resultado del then o else*/
SELECT
	id,cliente,producto,categoria,venta,
	CASE WHEN venta >= 400 THEN 'Alta'
		 WHEN venta >= 200 THEN 'Media'
		 ELSE 'Baja'
	END as valor, 
	fecha
FROM ventas;


/*Ejercicio 8
Mostrar nombres en mayúsculas.*/
/*Para este ejercicio solo basta con usar la funcion UPPER esta nos ayuda a convertir
todo el valor de texto a mayusculas, la aplicamos a la columna cliente donde estan los nombres*/
Select 
	UPPER(cliente) as cliente
FROM ventas;	


/*Ejercicio 9
Mostrar longitud del nombre del cliente.*/
/*Para este ejercicio solo usamos la funcion lenght que nos devolvera el total de numero 
de letras aplciada a la columna cliente donde se encuentran los nombres*/
SELECT 
	cliente,LENGTH(cliente) as longitud_nombre
FROM ventas;


/*Ejercicio 10
Obtener el año de la venta.*/
/*Para este ejercicio usamos la funcion de extract aplicandola a la columna de año 
extrayendo solo el año de esa columna ya que tiene la fecha completa*/
SELECT 
	id,cliente,producto,categoria,venta,EXTRACT(YEAR FROM fecha)as año
FROM ventas;
