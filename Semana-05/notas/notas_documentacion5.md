# PostgreSQL

## INNER JOIN
Entendi que es una clausula que va a comparar una o mas tablas con base en una o mas columnas y te devolvera los registros que tienen en comun ambas tablas
ademas de que muestra un ejemplo y la sintaxis de la clausula

## LEFT JOIN
De la documentacion vista aprendi que es una clausula que une dos mas tablas por medio de una o mas columnas devolviendo todas las filas o registros de la tabla 
izquierda y todos ls registros que coinciden del lado derecho en caso de que no encuentre valores va a ir rellenando con valores null, tambien se ve la sintaxis de 
esta clausula asi como un diagrama visual de como funciona 

## RIGHT JOIN
Aprendi que es una clausula simimlar al left join solo que hace lo contrario en el que combina dos o mas tablas por medio de una o mas columnas y devuelve o recupera
todos los registros de la tabla derecha y todos los registros que coincidan del lado izquierdo en los registros que no encuentre coincidendia los ira rellenando con ceros, ademas vi que en la parte del join en el on por donde se relacionan las columnas de las tablas puedes poner condiciones de una tabla o la otra que a diferencia del where este va a poner todos los registros con esa condicion ya que primero aplica esa condicion del on luego el join y al final wl where, en caso de que se use la 
clausula where este cortara o quieta refinitivamente esos datos 

## FULL JOIN
Viendo la documentacion aprendi que esta clausula es practicamente como si usaras un left join y right join juntos ya que esta combina dos o mas tablas por medio
de una o mas columnas y devuelve o recupera todas las filas que coincidan de tabla izquierda o tabla derecha , rellenando donde no encuntre coincidencias con valores null

## CROSS JOIN
Entendi que este operador lo que hace es devolver todo el producto cartesiano de dos tablas , o se te dara todas las combinaciones posibles de dos tablas 