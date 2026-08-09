# Notas de videos 4

## SQL GROUP BY.
### Qué aprendí?
Aprendi que la clausula se usa para acomodar los registros de una tabla con el mismo valor con base en una o mas columnas, esto es util a la hora
que usas una funcion de agregacion para poder acomodar por un valor de una tabla en especifico
### ¿Qué ejemplos fueron útiles?
Solo vi uno y en este se contaban clientes en total usando la funcion count para contar y agrupada por pais para ver en cada pais cuantos clientes tiene
### ¿Qué diferencias encontré respecto a Oracle?
Sinceramente no encontre diferencia entre estos dos sistemas de gestion de base de datos con esto me refiero a su sintaxis , es la misma


## SQL HAVING.
### Qué aprendí?
Aprendi que having es una funcion que conbina grupos de filas este siempre debe de ir debajo de la clausula group by , generalmente combina grupos que ya han sido 
agrupoados previamente en la funcion del group by 
### ¿Qué ejemplos fueron útiles?
Hizo un ejemplo en el que primero se conto con la funcion count los clientes de ahi se agrupo de neuvo por pais parqa ver cuantos clientes se 
tiene por pais y de ahi una vez que ya tenia los grupos conto que paises tenian mas clientes o al menos mayor que dos clientes
### ¿Qué diferencias encontré respecto a Oracle?
Uso el dbms mysql y otra vez no encontre diferencia en cuanto a la funcionalidad de la clausula y de su sintaxis con respecto a oracle

## SQL CASE.
### Qué aprendí?
Entendi que case es una herramienta condicional en la base de datos para crear logica de programacion condicional y poder evaluar diferentes casos
devolviendo el primero que encuentre, tambien vi la estructura excata de un case , entendi que no siempre es necesario poner el else y tambien vi que 
siempre se debe poner el mismo tipo de valor en la condicion que estableciste no puedes cambiar valores
### ¿Qué ejemplos fueron útiles?
Uso un ejemplo en el que sumaba una columna de ventas de ahi usaba una suboconsulta en el from en el que seleccionaba dos columnas y una de ellas era venta ahi usaba el case para poner ciertas condiciones si es mayor a tal numero pone un valor sino pone otro y si no encuentra alguno como un valor nullo ponia low al final agrupaba por la columna de categoria para ver estas condiciones con los valores que puso al principio de la suma  
### ¿Qué diferencias encontré respecto a Oracle?
En el video se uso el dbms de mysl y no econtre diferencias con oracle en cuanto a sintaxis ni funcionalidad, ya que hacen exactamente lo mismo

## SQL Aggregate Functions.
### Qué aprendí?
Aprendi que las funciones de agregacion son operaciones sobre un conjunto de valores y estos devolveran un unico valor, estas usan la clausula group by para
darle mas sentido a los datos y poder obtener mas informacion con base en una columna en especifico
### ¿Qué ejemplos fueron útiles?
Hizo varios en el video de cada una de las fucniones de agregacion donde pude identificar su funcionalidad basica de cada ejercicio
en el cual en count conto las ventas por clientes, en la sun sumo las ventas por clientes , en la de avg saco el promedio de ventas por cliente en la de max obtuvo el valor maximo de ventas y en el de min el numero minimo de ventas
### ¿Qué diferencias encontré respecto a Oracle?
No encontre diferencia en cuanto a las funciones de agregacion en mysql y oracle hacen lo mismo y su sintaxis es la misma