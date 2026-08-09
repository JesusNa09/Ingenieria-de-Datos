# Quiz

¿Qué hace COUNT()?
Es una funcion de agregacion que sirve para contar las filas registros de una o varias columnas de una tabla

Diferencia entre COUNT(*) y COUNT(columna).
La diferencia es que count(*) te va a contar todos los registros de la tabla y count(columna) te va a contar los registros solo de las columnas que le especifiques

¿Para qué sirve SUM()?
Es una funcion de agregacion que sirve para sumar los valores de tipo numericos de una o mas columnas en una tabla

¿Qué hace GROUP BY?
Es una clausula que acomoda todas las filas o registros con el mismo tipo de valor con base en una o mas columnas

Diferencia entre WHERE y HAVING.
La dos son clausulas, la diferencia es que where hace filtros por fila o registros de una tabla y el having hace un filtrado combinando grupos de filas y va despues
de la clausula group by mientras que where va antes

¿Qué hace CASE?
Es una herramienta condicional que evalua condiciones y devuelve la primera que encuentra, en conclusion revisa las condiciones que establezcas a ciertas columnas
y te regresa la condicion que sea verdadera sino continua revisando hasta que encuentre o regrese el valor de tus condiciones

¿Para qué sirven las funciones de texto?
Las funciones de texto sirven para manipular valores de tipo caracter para darles un tratamiento y te devuelvan el valor modificado con respecto a tu funcion de texto
aplicada

¿Qué hace EXTRACT()?
Extract te ayuda a extraer fechas dependiendo de que le pidas si dia mes o año de tu columna de tipo fecha

¿Qué diferencia existe entre MAX() y MIN()?
La diferencia entre estas dos funciones de agregacion es que max de devolvera el valor maximo de tu columna mientras que min te devolvera el valor mas bajo

Diseña una consulta que obtenga el total vendido por cliente.
#Selecionamos las columnas que necesitamos y la tabla de donde obtendremos esos datos
#Aplicamos una funcion de agregacion para obtener el total vendido
SELECT cliente,sum(venta) as venta
FROM ventas
GROUP BY cliente;
#Al final hacemos una agrupacion de la columna cliente para poder dividir el total de suma hecha pero por cada cliente