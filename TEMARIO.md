**MÓDULO 1** - Fundamentos de Ingeniería de Datos (Semanas 1 y 2)

Semana 1 - ¿Qué es la Ingeniería de Datos?

Objetivos

Entender el rol de un Data Engineer.

Diferenciar ETL y ELT.

Conocer la arquitectura moderna de datos.

Teoría

¿Qué es Ingeniería de Datos?

Roles en datos (Analyst, Scientist, Engineer, ML Engineer).

Flujo de datos.

Batch vs Streaming.

OLTP vs OLAP.

Data Warehouse.

Data Lake.

Data Mart.

Documentación

Fundamentals of Data Engineering (capítulos 1 y 2).

Documentación de PostgreSQL (Introducción).

Videos

IBM Technology – What is Data Engineering?

freeCodeCamp – Data Engineering Course (introducción).

Data with Baraa – Data Engineering Roadmap.

Laboratorio



Diseñar la arquitectura de una tienda en línea.



Tarea



Crear un diagrama con Draw.io o diagrams.net.



Proyecto GitHub



01-arquitectura-datos



Semana 2 - Sistemas Operativos y Herramientas

Objetivos

Familiarizarse con el entorno de trabajo.

Temas

Linux básico.

Terminal.

Variables de entorno.

Instalación de Python.

VS Code.

PyCharm.

PostgreSQL.

Git.

Docker Desktop.

Documentación

Linux Journey.

Python Docs.

Videos

freeCodeCamp Linux.

Corey Schafer (Python Setup).

Proyecto



Instalar todo el entorno.



**MÓDULO 2** - SQL (Semanas 3 a 6)

Semana 3 - SQL Básico

Temas

SELECT

WHERE

ORDER BY

LIMIT

GROUP BY

HAVING

DISTINCT

Práctica



SQLBolt (Lecciones 1–9).



Videos

freeCodeCamp SQL.

Amigoscode SQL.

Proyecto



Consultas sobre una base de ventas.



Semana 4 - JOINS y Subconsultas

Temas

INNER JOIN

LEFT JOIN

RIGHT JOIN

FULL JOIN

SELF JOIN

Subconsultas

Practicar



SQLZoo.



Proyecto



Sistema de ventas.



Semana 5 - SQL Avanzado

Temas

CTE

Window Functions

ROW\_NUMBER

RANK

LAG

LEAD

CASE

Practicar



DataLemur.



Proyecto



Dashboard SQL.



Semana 6 - Optimización

Temas

Índices.

EXPLAIN.

MERGE.

PIVOT.

UNPIVOT.

Transacciones.

Proyecto



Optimizar consultas.



**MÓDULO 3** - Modelado de Datos (Semanas 7 y 8)

Semana 7

Modelo Relacional.

Normalización.

Cardinalidad.

Llaves.

Índices.

Semana 8

Modelo estrella.

Copo de nieve.

Slowly Changing Dimensions (introducción).



Proyecto:

Diseñar un Data Warehouse.



**MÓDULO 4** - Python (Semanas 9 a 11)

Semana 9

Variables.

Funciones.

Listas.

Diccionarios.

Archivos.



Libro:

Automate the Boring Stuff with Python.



Semana 10

Programación orientada a objetos.

Manejo de errores.

Logging.

Semana 11

Módulos.

Entornos virtuales.

Pip.

Requests.



Proyecto:

Leer archivos CSV y generar un reporte.



**MÓDULO 5** - Pandas (Semanas 12 a 14)

Semana 12

DataFrame.

Series.

Lectura de archivos.

Semana 13

Limpieza de datos.

Valores nulos.

Duplicados.

Fechas.

Semana 14

Merge.

GroupBy.

Pivot.

Melt.

Apply.



Proyecto:

Procesar un millón de registros.



**MÓDULO 6** - Bases de Datos y Python (Semanas 15 y 16)

Semana 15

SQLAlchemy.

psycopg.

oracledb.

SQLite.

Semana 16

Transacciones.

Bulk Insert.

Conexiones.

Pooling.



Proyecto:

Migrar Oracle → PostgreSQL.



**MÓDULO 7** - ETL (Semanas 17 a 19)

Semana 17

Diseño de ETL.

Extract.

Semana 18

Transform.

Semana 19

Load.



Proyecto completo:

CSV → PostgreSQL.



**MÓDULO 8** - APIs (Semanas 20 y 21)

Semana 20

REST.

JSON.

GET.

POST.

Semana 21

Tokens.

Paginación.

Errores.



Proyecto:

Consumir una API y guardar datos.



**MÓDULO 9** - Data Warehouse (Semana 22)

Temas

Hechos.

Dimensiones.

SCD Tipo 1 y 2.

Granularidad.

Particionamiento (introducción).



Proyecto:

Construir un Data Warehouse.



**MÓDULO 10** - Automatización (Semana 23)

Temas

Cron.

Task Scheduler.

Docker.

Airflow (introducción).



Proyecto:

Automatizar un ETL.



**MÓDULO 11** - Big Data (Semana 24)

Temas

Spark.

PySpark.

Hadoop.

Kafka (conceptos).

Parquet.

Delta Lake.

Cloud (AWS, Azure, GCP: introducción).



Proyecto:

Procesar datos con PySpark.



Proyecto Final



Una empresa vende juguetes.



Los datos provienen de:



Oracle

PostgreSQL

Excel

CSV

API



Oracle ─┐

&#x20;        │

CSV ─────┤

&#x20;        │

Excel ───┤

&#x20;        ▼

&#x20;   Python ETL

&#x20;        ▼

&#x20;PostgreSQL DWH

&#x20;        ▼

&#x20;Apache Airflow

&#x20;        ▼

&#x20;  Power BI

&#x20;        ▼

&#x20;     GitHub

