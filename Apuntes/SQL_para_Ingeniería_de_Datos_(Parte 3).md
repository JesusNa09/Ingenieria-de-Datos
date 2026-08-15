# Índice
Entender qué es una relación entre tablas.
Identificar claves primarias y foráneas.
Utilizar INNER JOIN.
Utilizar LEFT JOIN.
Entender RIGHT JOIN y FULL JOIN.
Conocer CROSS JOIN.
Evitar duplicaciones causadas por JOINs.
Combinar JOIN con GROUP BY.
Construir consultas que integren información de varias tablas.


# 1. ¿Por qué necesitamos JOIN?
Ahora vamos a trabajar con un pequeño modelo de datos:
clientes
    │
    │
    ▼
ventas
    │
    │
    ▼
productos
    │
    │
    ▼
categorias
Esto se parece mucho más a una base de datos real.

Imagina que tenemos:
clientes
| id_cliente | nombre |
| ---------: | ------ |
|          1 | Ana    |
|          2 | Luis   |
|          3 | Pedro  |

ventas
| id_venta | id_cliente | venta |
| -------: | ---------: | ----: |
|        1 |          1 |   200 |
|        2 |          2 |   150 |
|        3 |          1 |   300 |

La tabla ventas no necesita guardar:
Ana
Luis
Pedro
Puede guardar:
id_cliente
Y utilizar esa relación para obtener el nombre.


# 2.PRIMARY KEY
Una clave primaria identifica de manera única un registro.

Por ejemplo:
id_cliente
en clientes.
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100)
);


# 3. FOREIGN KEY
La clave foránea permite relacionar una tabla con otra.
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    venta NUMERIC(10,2),

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

Aquí:
clientes.id_cliente
        ↑
        │
        │
ventas.id_cliente


# 4. INNER JOIN
Es probablemente el JOIN que más utilizarás.
SELECT
    clientes.nombre,
    ventas.venta
FROM clientes
INNER JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente;

Devuelve solamente los registros que tienen coincidencia en ambas tablas.
Visualmente:
clientes       ventas

   A             A
   B             B
   C             D

Resultado:

   A
   B    


# 5. LEFT JOIN
SELECT
    clientes.nombre,
    ventas.venta
FROM clientes
LEFT JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente;

El LEFT JOIN conserva todos los registros de la tabla izquierda, aunque no tengan coincidencia.

Esto es muy importante.

Por ejemplo, si Pedro nunca compró:
Ana    200
Luis   150
Pedro  NULL
Pedro sigue apareciendo.


# 6. RIGHT JOIN
SELECT
    clientes.nombre,
    ventas.venta
FROM clientes
RIGHT JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente;

Conserva todos los registros de la tabla derecha.

Importante

No quiero que memorices:

RIGHT = derecha

Quiero que entiendas:

¿Qué tabla necesito conservar completa?

Por eso, en la práctica muchas veces podemos reorganizar el JOIN y utilizar LEFT JOIN para hacer la consulta más legible.


# 7. FULL JOIN
SELECT
    clientes.nombre,
    ventas.venta
FROM clientes
FULL JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente;

Conserva los registros coincidentes y también los que no tienen coincidencia en cualquiera de las dos tablas.


# 8. CROSS JOIN
Genera todas las combinaciones posibles entre ambas tablas.

Si tenemos:
3 clientes

y:

4 productos

tenemos:

3 × 4 = 12 combinaciones
Ejemplo:
SELECT *
FROM clientes
CROSS JOIN productos;
No es un JOIN que debas utilizar sin entenderlo, porque puede generar una cantidad enorme de registros.


# 9. JOIN + GROUP BY
Aquí empieza la parte realmente interesante.

Podemos combinar lo aprendido en la Semana 4 con los JOINs.

Por ejemplo:

¿Cuánto ha comprado cada cliente?
SELECT
    c.nombre,
    SUM(v.venta) AS total_compras
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
GROUP BY c.nombre;

Aquí estamos utilizando:
JOIN
 +
SUM()
 +
GROUP BY
Esto ya empieza a parecerse bastante a una consulta que encontrarías en un proyecto real.


# 10. Alias para tablas
Fíjate que utilizamos:

clientes c

y:

ventas v
Entonces podemos escribir:
c.nombre

y:

v.venta

En lugar de:

clientes.nombre
ventas.venta

Esto hace que las consultas grandes sean mucho más legibles.


# 11. Concepto muy importante: duplicación
Este será uno de los temas importantes de esta semana.

Un JOIN puede multiplicar registros si la relación no está bien entendida.

Por ejemplo:
1 cliente
   │
   ├── venta 1
   ├── venta 2
   └── venta 3

Cuando haces JOIN:
Cliente → 3 filas
Eso no significa que el JOIN esté mal.

Significa que existe una relación uno a muchos.

Debemos aprender a reconocerla.
