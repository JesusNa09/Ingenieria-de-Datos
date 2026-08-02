# Notas de la Clase 3


# SQL
Entendi que Sql significa Lenguaje de Consulta Estructurado y es un lenguaje que sirve para la manipulacion, gestion y consulta de bases de datos

# Cómo piensa un Data Engineer
Lo que entendi es que el piensa mas en como vienen los datos, si se peude automatizar y como le hara para que los datos lleguen de un punto
inicial a uno final

# Para qué sirve SELECT
Es una instruccion y sirve para seleccionar columnas de tu tabla por ejemplo
SELECT marca, modelo 
FROM Ventas;

# Qué hace FROM
Es la clausula que te dice de donde se obtendran los datos
SELECT * FROM 
Ventas;

# Para qué sirve WHERE
Es una clausula que sirve para filtrar resultados en tu consulta con ciertas condiciones por ejemplo
SELECT marca,modelo,precio
FROM Ventas
WHERE marca = 'Nad' and precio >100;

# Diferencia entre WHERE y ORDER BY.
La diferencia entre estas dos clausulas es que where sirve para filtrar resultados en funcion de varias condciones y order by sirve
para organizar los datos o resultados de una consulta en orden ascendente o descendente
SELECT marca,modelo,precio
FROM Ventas
WHERE precio >200
ORDER BY precio DESC;

# Para qué sirve LIMIT?
Esta clausula sirve para traer ciertos registros no todos los de la consulta
Select * from Ventas
LIMIT 10;

# Qué hace DISTINCT
La clausula distinct sirve para eliminar resgistros duplicados en tu instruccion Select
SELECT distinct(marca)
FROM Ventas;

# Qué es un alias
Es solo uan forma de renombrar temporalmente tu tabla o columnas en una consulta
SELECT precio as resultado
FROM Ventas;

# Diferencia entre PostgreSQL y Oracle para LIMIT.
La diferencia solo es la nomenclatura las dos hacen los mismo de traer solo ciertos registros no todos
PostgreSql
SELECT * fROM Ventas
Limit 10;

Oracle
Select * from Ventas
Fetch First 10 row;






