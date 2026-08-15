# Laboratorio

Crearemos:

clientes
productos
categorias
ventas

Modelo:
clientes
   │
   │ 1
   │
   │ N
ventas
   │
   │ N
   │
   │ 1
productos
   │
   │ N
   │
   │ 1
categorias


Ejercicios del laboratorio
Ejercicio 1

Realizar un INNER JOIN entre:

clientes
ventas

y mostrar:

nombre_cliente
venta
Ejercicio 2

Realizar un LEFT JOIN.

Mostrar todos los clientes aunque no tengan ventas.

Ejercicio 3

Relacionar:

productos
categorias

Mostrar:

producto
categoría
Ejercicio 4

Relacionar:

clientes
ventas
productos

Mostrar:

cliente
producto
venta
Ejercicio 5

Obtener el total comprado por cada cliente.

Aquí debes utilizar:

JOIN
SUM()
GROUP BY
Ejercicio 6

Obtener el total vendido por categoría.

Ejercicio 7

Mostrar clientes que nunca han realizado una compra.

💡 Aquí quiero que pienses en:

LEFT JOIN
+
IS NULL
Ejercicio 8

Realizar un FULL JOIN.

Explicar qué resultado obtuviste.

Ejercicio 9

Realizar un CROSS JOIN pequeño.

Explicar por qué genera tantas filas.

Ejercicio 10

Crear un JOIN utilizando alias:

c
v
p
cat

y explicar qué representa cada alias.