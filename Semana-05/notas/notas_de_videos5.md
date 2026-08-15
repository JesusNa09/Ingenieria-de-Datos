# Notas de videos 5

## SQL INNER JOIN.
Aprendi que la clausula inner join viendo el ejercico del video solo va a unir las tablas y devolvera los registros en los que 
haya coincidencis en ambas tablas, es bueno poner un alias y si no sabemos que columna usar en caso de que se encuentre en las dos
es mejor empezar con la primera para no perderse , en este caso hizo un inner join de cliente con pedidos uniendolos por la columna de 
id_cliente

## SQL LEFT JOIN.
Viendo el video pude ver y aprender graficamente como se usa la clausula de left join en el cual pondra todos los registros del lado izquierdo 
de la tabla y todos los registros que coincidan del lado derecho en caso de no encontrar alguna coincidencia pondra null o sea sin valor para ese registro
que no encontro del lado derecho, hizo un left join de la tabla clientes con la tabla pedidos uniendolos por la columna de id_cliente

## SQL RIGHT JOIN.
Aprendi del video que  hace lo mismo que un left join solo que para esta clausula va poner todos los registros de la tabla derecha y todos los registros
de la tabla izquierda, mismo caso que en la clausula left join cuando no encuentre coincidencias con la tabla del lado izquierdo pondra null ausnecia de valor
, hizo un right join de la tabla clientes con la tabla pedidos uniendolas por la columna id_cliente

## SQL FULL OUTER JOIN.
Para este video aprendi que no todos los sistemas de gestion de base de datos tienen esta clausula pero puedes replicarla haciendo un left join cona la clausula union all que sirve para combinar los resultados de dos o mas consultas select y despues la unio con un rigth join eso replicar un full outer join ya que en si esta clausula
lo que hace es un left y right join , trae todos los registros en los que coincidan las tablas derechas o tablas izquierdas, en el ejercicio uso mysql y no pudo hacer el full outer join pero lo hizo con la clausula union all, entonces lo hizo para las columnas de cliente con pedidos , uniendolos por la columna id_cliente viendo
como se hiba rellenando graficamente de un lado y del otro poniendo valores nulls en caso de no encontrar uniones de ambos lados

## SQL JOIN + GROUP BY.

## Mientras los ves Anota:
### ¿Qué diferencia hay entre INNER y LEFT?
La gran diferencia entre estas dos clasulas es que el inner join devolvera los registros o filas en los que haya coincidencia en ambas tablas mientras que en la 
clausula left join devolvera todos los registros de la tabla izquierda y solo los registros que coincidan de la tabla derecha

### ¿Qué ocurre cuando no existe coincidencia?
En los joins cuando no hay coincidencia en la relacion de tablas devolvera un registro con ausencia de datos o sea un valor null ya que no encuentra relacion de columnas 

### ¿Qué sucede con NULL?
El valor null lo pone los joins indicando que no encontro un valor en la cual hubiera coincidencias en los registros con base en las columnas establecidas para la union
en las tablas

## ¿Qué pasa si una fila tiene varias coincidencias?
En los joins cuando un registro tiene mas coincidencias con otros de otra tabla lo que pasara es que duplicara el registros segun las coincidencias que encuentre