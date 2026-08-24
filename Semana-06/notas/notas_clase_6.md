# Notas de la Clase 6

# 1. ¿Qué es una subconsulta?
Entendi que una subconsulta es una consulta interna , se utiliza para resolver consultas mas complejas, para ejecutar operaciones basados en los resultados
de otra consulta

# 2. Problema de las subconsultas
Entendi que hacer muchs subconsultas puede resultar msa complejo ya que se vuelven mas dificiles de leer, entender y tambien consumen mas memoria de la base de datos
haciendo mas lenta tu consulta

# 3. CTE — Common Table Expression
Aprendi que un CTE es un conjunto de tablas o resultados con nombre definidos por la clausula with, se utiliza para dividir y resolver consultas mas complejas
existen solo durante la ejecucion de una consulta selectiva, insert update delete

# 4. CTE con GROUP BY
Entendi que dentro de los Cte se pueden hacer varias operaciones y utilizar la clasula join en ciertos casos o bloques de codigo para poder despues ser llamados para
una nueva consulta

# 5. Varias CTE
Aprendi que pueden hacerce varios bloques de codigo dentro los cte que a su vez permiten realizar nuevos calculos incluso pueden ser llamados de nuevo esos calculos 
para otra operacio o comparacion.

# 6. Window Functions
Aprendi que las funciones ventana son calculos analiticos sobre un conjunto de filas relacionadas con la fila actual , sin agruparlos y que devuelve sus valores agrupados, utilizan la clausula over 

# 7. ROW_NUMBER()
Esta es una funcion de ventana que asigna un numero a la columna que se la apliques

# 8. PARTITION BY
Entendi que es una parte fundamental de las funciones ventanas ya que esta parte reiniciara el conteo dependiendo de la columna que selecciones

# 9. RANK()
Esta es una funcion de ventana  que realiza un conteo de las filas o registros acomodando o asigando un rango de mayor a menor , si hay empates queita el numero que sigue y contunua con el conteo

# 10. DENSE_RANK()
Esta funcion de ventana realiza un conteo de ls filas odernando o contando del mayor a menor numero si hay empates les asigna el mismo numero y continua con el conteo

# 11. GROUP BY vs Window Function
Entendi que la diferencia es que en la clausula group by junta las filas con una operacion las quieta y con las funciones de agregacion no quita las filas las deja
aplicando orepaciones

# 12. Vista — VIEW
Aprendi que es o son tablas virtuales basados en los resultados de una consulta,una tabla virtual es una consulta almacenada que actua como una tabla logica, practicamente es una consulta que se usa mucho y que se muestra mucho dentro de una consulta
