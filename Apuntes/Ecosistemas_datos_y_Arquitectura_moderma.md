# Índice
¿Qué es un Pipeline?
Arquitectura de Datos.
Sistemas OLTP.
Sistemas OLAP.
Data Warehouse.
Data Lake.
Lakehouse.
Flujo completo de datos.
Herramientas.
Proyecto.


# 1. ¿Qué es un Pipeline?
Un Pipeline es una secuencia de pasos que mueve y transforma datos desde un origen hasta un destino.

Ejemplo sencillo:
Ventas.csv

↓

Python

↓

PostgreSQL

↓

Power BI
Eso ya es un Pipeline.

Ahora uno un poco más real.
Oracle

↓

Python

↓

API

↓

Validaciones

↓

PostgreSQL

↓

Power BI


O incluso
Oracle

↓

Airflow

↓

Spark

↓

Data Lake

↓

Data Warehouse

↓

Power BI
Todo eso sigue siendo un Pipeline.


Características de un buen Pipeline
Debe ser:
✅ Confiable
✅ Repetible
✅ Escalable
✅ Automatizado
✅ Fácil de mantener


Caso real
Supongamos Amazon.
Cada compra genera información.
Cliente
Pago
Producto
Inventario
Envío
No sería eficiente que un empleado copie esos datos manualmente.
Un Pipeline hace ese trabajo automáticamente.


# 2. Arquitectura de Datos
La arquitectura de datos es el marco general que rige cómo se recopilan, almacenan, transforman, distribuyen y utilizan los datos en una organización. 
Veamos una arquitectura sencilla.
Usuarios

↓

Página Web

↓

Base de Datos

↓

ETL

↓

Data Warehouse

↓

Power BI

Ahora una arquitectura empresarial.
Oracle
Excel
CSV
API
SAP
CRM
IoT

↓

Python

↓

Airflow

↓

Data Lake

↓

Spark

↓

Data Warehouse

↓

Power BI

↓

Directivos
Como puedes observar, el Data Engineer se encuentra justo en medio.


# 3. ¿Qué es OLTP?
OLTP = Online Transaction Processing
Son bases de datos que registran operaciones.
Ejemplos
Amazon
Compra realizada

↓

Guardar compra

Banco
Transferencia

↓

Guardar movimiento

Ejemplos de motores:
Oracle
PostgreSQL
MySQL
SQL Server

Características
Muchas inserciones.
Muchas actualizaciones.
Muchos usuarios.
Datos recientes.
Consultas pequeñas.


# 4. ¿Qué es OLAP?
OLAP significa
Online Analytical Processing
No sirve para registrar ventas.
Sirve para analizarlas.
Ejemplo
Director General
Pregunta
¿Cuánto vendimos en los últimos cinco años?
Eso es OLAP.
Comparación
| OLTP              | OLAP      |
| ----------------- | --------- |
| Registrar         | Analizar  |
| INSERT            | SUM       |
| UPDATE            | GROUP BY  |
| DELETE            | Dashboard |
| Miles de usuarios | Analistas |

# 5. Data Warehouse
Ya vimos una definición.
Ahora profundicemos.
Un Data Warehouse tiene cuatro características principales:
Integrado
Une datos de varios sistemas.
Histórico
Guarda información durante años.
Orientado al negocio
Está organizado para responder preguntas del negocio.
Optimizado para lectura
No está pensado para registrar ventas.
Está pensado para hacer consultas rápidas.


# 6. Data Lake
Piensa en un gran almacén.
Todo entra.
CSV.
JSON.
Excel.
Videos.
Audio.
Imágenes.
Logs.
Todavía no se transforman.


# 7. ¿Qué es un Lakehouse?
Es un concepto moderno.
Combina lo mejor del Data Lake y del Data Warehouse.
Data Lake

+

Data Warehouse

=

Lakehouse
Lo veremos con más detalle en las últimas semanas.


# 8. Flujo completo de datos
Clientes

↓

Aplicación

↓

Oracle

↓

Python

↓

Airflow

↓

Spark

↓

Data Lake

↓

Data Warehouse

↓

Power BI
Ese flujo será prácticamente nuestro proyecto final.


# 9. Herramientas que aprenderemos
Ahora ya puedes entender mejor para qué sirve cada una.

Herramienta	¿Para qué sirve?
SQL	Consultar datos
PostgreSQL	Base de datos
Oracle	Base de datos empresarial
Python	ETL
Pandas	Transformar datos
Git	Versionar
Docker	Contenedores
Airflow	Automatizar
Spark	Big Data
Power BI	Visualización


# 10. ¿Dónde entra Python?
Muchos creen que Python es el centro de todo.
No.
Python es una herramienta.
Su trabajo es mover datos.

Oracle

↓

Python

↓

PostgreSQL

O

API

↓

Python

↓

CSV
