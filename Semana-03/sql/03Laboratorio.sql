/*Con esta instruccion cree mi base de datos con el nombre de curso_data_engineering*/
CREATE DATABASE curso_data_engineering;


/*Con esta instruccion cree mi tabla con el nombre ventas para el laboratorio
e ingrese el nombre de las columnas con su tipo de dato, dependiendo del
sistema de gestion de base de datos a veces cambio un poco la nomenclatura
en cuanto a el tipo de dato */
CREATE TABLE ventas(
	id int,
	cliente VARCHAR(100),
	producto VARCHAR(100),
	categoria VARCHAR(50),
	venta NUMERIC(10,2),
	fecha DATE
);


/*Con esa instruccion agregamos algunos datos de prueba*/
INSERT INTO ventas VALUES
(1,'Ana','Muñeca','Juguetes',200,'2025-01-10'),
(2,'Luis','Carro','Juguetes',150,'2025-01-11'),
(3,'Pedro','Rompecabezas','Juegos',300,'2025-01-12'),
(4,'Ana','Pinturas','Arte',180,'2025-01-13'),
(5,'Luis','Lego','Construcción',450,'2025-01-14');



/*Ejercicios del laboratorio*/
/* 01 Mostrar todas las ventas. */
SELECT * FROM ventas;

/* 02 Mostrar solo cliente y venta. */
SELECT cliente, venta FROM ventas;

/* 03 Ventas mayores a 200. */
SELECT * FROM ventas
WHERE venta >=200;

/* 04 Ordenar por venta. */
SELECT * FROM ventas
ORDER BY venta;

/* 05 Mostrar categorías únicas. */
SELECT DISTINCT(categoria) as Categoria
FROM ventas;




