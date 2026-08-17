# Quiz

¿Qué es un JOIN?
Un join es una clausula que sirve para combinar los resultados de dos o mas tablas por medio de una o mas columnas 

¿Qué diferencia existe entre INNER JOIN y LEFT JOIN?
La diferencia entre estas dos clausulas es que el inner join combina dos o mas tablas por medio de una o mas columnas y este devuelve los registros que coinciden en 
ambas tablas y el left join hace lo mismo pero esta devolvera o recuperara todos los registros de la tabla izquierda y todos los registros que coinciden del lado derecho a diferencia del inner join 

¿Qué ocurre cuando no existe coincidencia en un LEFT JOIN?
Cuandoo no hay coincidencias en la clausula left join lo que hara es poner valores en null donde no encuentre estas coincidencias de todos su registros del lado izquierdo con los que encuentre del lado derecho

¿Para qué sirve RIGHT JOIN?
Esta clasula sirve para combinar dos o mas tablas por medio de una o mas columnas y devulelve o recupera todos los registros del lado derevho y todos los registros que 
coinciden del lazo izqueirdo

¿Qué hace FULL JOIN?
Esta clausula combina dos o mas tablas por medio de una o mas columnas y devuelve o recuepra todos los registros que coinciden de las tablas izquierdas o tablas derechas

¿Qué hace CROSS JOIN?
Este operador deuelvve el producto cartesiano de dos tablas, o sea todas las combinaciones posibles de las dos tablas

¿Qué es una PRIMARY KEY?
Es una columna o columnas en una tabla de una base de datos que identifica de forma unica a cada fila o registro

¿Qué es una FOREIGN KEY?
Es una llave primaria en una tabla y una llave secundaria o foranea en otra tabla para relacionar las tablas

¿Por qué un JOIN puede multiplicar registros?
Las clausulas joins pueden multiplicar registros porque va a devolver las coincidencias que encuentre basado en la relacion de las columnas y si encuentra la relacion que estableciste en la tabla dos veces o mas las ora poniendo por eso es importante definir bien la relacion de tus tablas por medio de tus columnas adecuadas pare no tener registros duplicados o registros basura con valores null

Diseña una consulta que muestre cliente, producto y venta utilizando tres tablas.
SELECT
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    v.venta
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto;