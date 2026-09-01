# Errores


# Semana 1
## Error1
Data Mart yo puse que es un subconjunto de almacen de datos que se especializan en la inteligencia comercial 
## Correccion
Es un subconjunto de almacen de datos especializado, diseñado para una area de negocio especifica ejemplo finanzaz, compras , marketing no solamente para la 
inteligencia comercial

## Error2
Ciclo de vida de los datos:Aqui confundi un termino y puse difucion en la ultima parte de ciclo de datos
## Correccion
Pero no es la difucion sino la toma de decisiones una vez que ya se tengan los datos limpios y claros para poder ver que decision tomar ya con esotos datos listos 


# Semana 2



# Semana 3
## Error1
En la clausula Where puse que sirve como una condicion verdadera o falsa
## Correccion
filtra los registros que cumplan una o varias condiciones antes de devolver los resultados

## Error 2
Elimina resultados del resultado de una tabla
## Correccion
Elimina resultados del resultado de una consulta


# Semana 4
## Error1 
COUNT(*) vs COUNT(columna)
La diferencia es que count(*) te va a contar todos los registros de la tabla y count(columna) te va a contar los registros solo de las columnas que le especifiques
## Correccion
cuenta valores/registros no nulos, dependiendo de cómo lo utilices.

## Error2
Extract te ayuda a extraer fechas dependiendo de que le pidas si dia mes o año de tu columna de tipo fecha

## Correccion
Solo recuerda que no está limitado a fechas; permite extraer campos de valores date, timestamp, etc.


# Semana 6
## Error1 

## Correccion
Solo la parte del desc en el order by
El problema es:
ORDER BY a.venta
está ordenando ascendente.
Por tanto:
venta menor → ranking 1
venta mayor → ranking 2, 3...
Pero quieres el más vendido.
Debe ser:
ORDER BY a.venta DESC

SELECT
    r.producto,
    r.categoria,
    r.venta
FROM (
    SELECT
        ROW_NUMBER() OVER (
            PARTITION BY a.categoria
            ORDER BY a.venta DESC
        ) AS ranking,
        a.producto,
        a.categoria,
        a.venta
    FROM (
        SELECT
            p.nombre_producto AS producto,
            c.nombre_categoria AS categoria,
            SUM(v.venta) AS venta
        FROM categorias c
        JOIN productos p
            ON c.id_categoria = p.id_categoria
        JOIN ventas v
            ON p.id_producto = v.id_producto
        GROUP BY
            c.nombre_categoria,
            p.nombre_producto
    ) a
) r
WHERE ranking = 1;
