# Quiz

¿Qué es un Pipeline de datos?
Son un conjunto de pasos en las que los datos pasan y se tranforman  por un proceso inicial a uno final para que sean confiables y faciles de leer

¿Qué características debe tener un buen Pipeline?
Sus caracteristicas son debe ser confiable ,escalable, automatizado , repetitible y facil de leer 

¿Qué es OLTP?
Significa Online Transaction Processing y son bases de datos que registran operaciones

¿Qué es OLAP?
Significa Online Analitycal Processing y en en procesamiento de datos donde se analizan las operaciones registradas

¿Cuál es la diferencia entre OLTP y OLAP?
La principal diferencia entre estos dos sistemas de procesamiento es que en OLTP se ingresan o registran operacioness y en OLAP se analizan esas operaciones mas no
se registran

¿Qué es una arquitectura de datos?
La arquitectura de datos es un bosquejo o representacion de como se organizan, almacenan y tratan los datos en un sistema de una organizacion

¿Qué hace Python dentro de un Pipeline?
El lenguaje Python lo que hace en un pipeline solo es mover archivos y limpiarlos sobre la serie de pasos del Pipeline

¿Qué diferencia existe entre un Data Lake y un Data Warehouse?
La diferencia es que en un Data Warehouse los datos llegan pero con un tratamiento previo y en un Data Lake los datos se cargan de manera nativa sin ningun tratamiento

¿Qué es un Lakehouse?
Es la combinacion de un Data Lake y un Data Warehouse

Dibuja el flujo completo de una arquitectura moderna de datos.
CLIENTES
    |
    |
    V
APLICACION
    |
    |
    V
Excel 
CSV
BASE DE DATOS
    |
    |
    V
PYTHON
    |
    |
    V
AIRFLOW
    |
    |
    V
DATA WAREHOUSE
    |
    |
    V
Power Bi