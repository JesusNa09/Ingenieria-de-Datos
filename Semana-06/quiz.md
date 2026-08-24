# Quiz

¿Qué es una subconsulta?
Una subconsulta es una consulta interna, se utiliza para resolver consultas mas complejas , para ejecutar operaciones basados en los resultados de otra consulta

¿Qué es una CTE?
Es un Common Table Expression que es un conjunto de resultados o tablas temporales con nombre definidos con la clausula with , se utiliza para dividir y revolver 
consultas mas complejas , existen solo durante la ejecucion de una consulta selectiva insert update delete

¿Para qué sirve WITH?
Es una parte del cte comun expresion de la tabla para poder realizar los bloques de tus consultas, practicamente es la clasula que se usa para poder hacer cte

¿Qué diferencia existe entre una subconsulta y una CTE?
La diferencia entre la subconsulta es que son subconsultas anidadas y se pueden volver dificiles de leer cuando tiene varias consultas con valores redundantes
mientras que los cte son un conjunto de tablas temporales com bloques de codigo mas organizados que pueden volver a llamar tablas redundantes 

¿Qué es una Window Function?
Una fucion de ventana son calculos analiticos sobre un conjunto de filas relacionadas con la fila actual sin agruparlas y que devuelven su valores agregados, utilizan 
la clausula over 

¿Qué hace PARTITION BY?
Es una parte de las funciones de ventana practicamente divide las filas en grupos para que la Window Function se calcule independientemente dentro de cada grupo, sin eliminar las filas.

Diferencia entre GROUP BY y PARTITION BY.
La diferencia es que en la clausula group by reduce filas agrupando por alguna columna y el partition by no quita filas solo muestra el resultado para cada registro 
en el que se le aplico la funcion a su columna 

Diferencia entre ROW_NUMBER() y RANK().
La diferencia entre estas dos funciones ventana es que rw_number va a asignar solo un numero consecutivo dependiendo de la columna a la que se le aplique sin importar si hay 
numeros reptidos y la funcion rank te muestra un numero consecutivo pero si hay empates les asigna el mismo numero pero se salta con el siguiete registro al numero que siguiete
dejando un espacio  

Diferencia entre RANK() y DENSE_RANK().
La diferencia entre estas dos funciones ventana es que en rank realiza un conteo de numeros consecutivos pero si hay valores repetidos, les asigna el mismo numero pero al siguiente
registro se salta el numero que sigue y le da el mumero que sigue saltandose uno a diferencia de la funcion de agregacion dense rank hace el mismo conteo pero
si encuntre numeros repetidos les asigna el mismo numero y este no se salta al siguiente numero con el registro que sigue sino que le asigna el numero consecutivo

¿Para qué sirve una VIEW?
Para crear tablas virtuales basados en los resultados de consultas select

Diseña una consulta que obtenga el producto más vendido por categoría.
SELECT r.producto,r.categoria,r.venta
FROM(
SELECT ROW_NUMBER() OVER(PARTITION BY a.categoria ORDER BY a.venta DESC) as ranking,
a.producto,a.categoria,a.venta
FROM(
SELECT p.nombre_producto as producto,c.nombre_categoria as categoria, SUM(v.venta) as venta 
FROM categorias c
JOIN productos p on(c.id_categoria=p.id_categoria)
JOIN ventas v on(p.id_producto=v.id_producto)
GROUP BY c.nombre_categoria,p.nombre_producto)a
)r
WHERE ranking =1

Diseña una consulta que muestre cada venta junto con el total vendido por ese cliente.
SELECT c.nombre as cliente, v.venta, SUM(v.venta) OVER(PARTITION BY c.nombre) as total_vendido
FROM clientes c
JOIN ventas v on(c.id_cliente=v.id_cliente);