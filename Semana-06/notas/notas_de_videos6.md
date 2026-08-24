# Notas de videos 6

## SQL Subqueries.
####¿Qué entendí?
Entendi que las subconsultas solo son consultas anidadas sobre otras consultas , son muy utilies para hacer tus consultas dinamiacas y que no esten estaticas
###¿Qué no entendí?
NOes que no entendi , pero me cuesta hacer mas las subconsultas que van en el filtro del where

## SQL CTE / WITH.
### ¿Qué entendí?
Entendi que los comun exprecion de las tablas son un conjunto de tablas temporales con nombre, se utilizan para dividir y resolver consultas complejas y utilizan la 
clausula with como parte fundamental en su declaracion 
### ¿Qué no entendí?
No entendia como o que columnas estaban presnetes una vez que haces un bloque de tu contulta y vuelves a consultar esa consulta en cuanto a las columnas solicitadas

## SQL Window Functions.
### ¿Qué entendí?
Entendi que son calculos analiticos sobre un conjunto de filas relacionada con la fila actual sin agruparlos y que devuelven sus valores agregados
### ¿Qué no entendí?
No entendia bien graficamente que es lo que hacian las funciones ventana 


## ROW_NUMBER()
### ¿Qué entendí?
Es una funcion de ventana que asigna un numero consecutivo a los registros con respecto a una o mas columnas 
### ¿Qué no entendí?
No enetendia bien que hacia la funcion cuando se inclui la palabra reservado partition by pero solo hace un nuevo conteo dependiendo de la columna


# RANK() vs DENSE_RANK().
### ¿Qué entendí?
Entendi que las dos son funciones ventana pero la diferencia es que rank te dara el numero de mayor a menor con respecto a la columna que establezcas pero
al continuar con el numero siguiente que  le corresponde solo se salta es o esos numeros que son el siguiente donde se quedo y dense_rank() hara los mimso que rank 
solo que este si te dara el conteo del numero siguiente con respecto a la columna que establezcas
### ¿Qué no entendí?
No entendia bien como hacia el conteo a partir la particion de cada una de las dos funciones ventana a partir de la columna que establezcas en la parte del partition by

# PARTITION BY.
### ¿Qué entendí?
Esta es una parte de las funciones ventana ,entendi que practicamnete divide la tabla central en otras tablas mas pequeñas dependiendo de la columna que esatblezcas
para realizar un nuevo conteo con base en esa columna establecida
### ¿Qué no entendí?
No entendia la sintaxis de como usar esta herramienta de las funciones ventana asi como donde ponerlo para que haga el conteo que quiero de las columnas que quiero que 
haga un nuevo conteo

# ¿Qué diferencia hay entre GROUP BY y PARTITION BY?
La diferencia que hay entre la clausula group by y la parte de las funciones ventana partition by es que en la clausula group by solo reagrupa quitando filas a partir de la operacion y agrupacion que realices , mientras que la funcion de paritio by no junta ni quita filas solo hace la operacion que corresponde sin agrupar los valores

# ¿Para qué utilizaría ROW_NUMBER()?
Entedi que se puede usar para realizar un conteo a partir de la columna que establezcas para que reliace el conteo

# ¿Qué diferencia existe entre RANK() y DENSE_RANK()?
La diferencia entre esats dos funciones ventana es que en rak realiza un conteo de mayor a menor pero los valores que se repitan al sigueinte numero se lo saltara dejando un lugar vavio en cuanto a las columanas que establezcas y denserank hace lo mismo solo que esta no dejara lugares vacios al momento de que realice el conteo, si hay repetidos solo le asignara el mismo numero y continuara con el que sigue