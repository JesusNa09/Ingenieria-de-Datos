**Índice**

¿Qué es la Ingeniería de Datos?

¿Por qué nació?

¿Qué hace un Data Engineer?

Ciclo de vida de los datos.

Arquitectura moderna de datos.

ETL vs ELT.

Data Warehouse.

Data Lake.

Data Mart.

Batch vs Streaming.

Herramientas de un Data Engineer.

Recursos de estudio.

Laboratorio.

Tarea.

Proyecto.

Quiz.



**Ingeniería de Datos** es la disciplina encargada de:

\-Obtener datos

\-Limpiarlos

\-Transformarlos

\-Integrarlos 

\-Almacenarlos

\-Ponerlos a disposición para análisis o aplicaciones



Construye las carreteras por donde viajan los datos.



El Data Engineer construye la infraestructura para que la información llegue donde debe.



Nacio porque aparecieron mas canales de información no solo sistema-base de datos, ahora habían sitios web, apis, archivos CSV o sistemas crm



**Que hace un data engineer** 

\-Extraer datos desde Oracle

\-Consumir una ApiRest

\-Leer archivos CSV

\-Crear un proceso ETL

\-Optimizar consultas SQL

\-Diseñar un Data Warehouse

\-Automatizar procesos con Airflow

\-Monitorear pipelines



**Roles en los datos**

Data Engineer Construye y mantiene los sistemas que mueven y almacenan los datos

Data Analyst Analisa los datos y crea reportes o dashboards

Data Scientist Desarrolla modelos predictivos y algoritmos de Machine Learning

Machine Learning Engineer Lleva modelos de IA a producción y los integra en aplicaciones





El Data Engineer crea el pipeline que toma ventas de Oracle, archivos CSV y una API, los limpia y los guarda en un Data Warehouse.

El Data Analyst usa ese Data Warehouse para construir un dashboard en Power BI.

El Data Scientist utiliza esos datos para predecir qué productos se venderán más el próximo mes.

El ML Engineer integra ese modelo en la página web para hacer recomendaciones a los clientes.



**Ciclo de vida de los datos**

Fuentes de datos: sistemas donde nacen los datos.

&#x09;|

Extracción: obtener los datos.

&#x09;|	

Transformación: corregir, limpiar y combinar.

&#x09;|

Almacenamiento: guardar los datos preparados.

&#x09;|	

Análisis: generar reportes o modelos.

&#x09;|

Decisiones: usar la información para el negocio.



Arquitectura moderna de Datos

&#x20;             Clientes

&#x20;                │

&#x20;                ▼

&#x20;       Página Web / App

&#x20;                │

&#x20;                ▼

&#x20;        Base de Datos OLTP

&#x20;                │

&#x20;                ▼

&#x20;         Proceso ETL / ELT

&#x20;                │

&#x20;                ▼

&#x20;         Data Warehouse

&#x20;                │

&#x20;       ┌────────┴────────┐

&#x20;       ▼                 ▼

&#x20;  Power BI          Ciencia de Datos

Durante el curso iremos agregando más componentes como APIs, Airflow, Spark y almacenamiento en la nube.



**ETL/ELT**

ETL (Extract, Transform, Load)

1.Extraer datos.

2.Transformarlos.

3.Cargarlos al destino.

Es el enfoque clásico y muy común cuando se transforman datos con Python antes de cargarlos.



ELT (Extract, Load, Transform)

Extraer.

Cargar.

Transformar dentro del Data Warehouse.

Con motores modernos (BigQuery, Snowflake, Redshift) este enfoque es cada vez más frecuente porque pueden procesar grandes volúmenes de datos de forma eficiente.



**Data Warehouse**

Es una base de datos diseñada para análisis.



No suele usarse para registrar ventas en tiempo real, sino para responder preguntas como:



¿Cuánto vendimos este año?

¿Cuál es el producto más vendido?

¿Qué sucursal tuvo mayores ingresos?



Sus características principales son:



Integra datos de múltiples fuentes.

Conserva información histórica.

Está optimizado para consultas analíticas.





**Data Lake**

Un Data Lake almacena datos en su formato original.



Puede contener:

CSV.

Excel.

JSON.

Imágenes.

Videos.

Archivos Parquet.

Audio.



La idea es guardar los datos aunque todavía no sepamos cómo los usaremos.



**Data Mart**

Es una arte especializada del Data Warehouse.

Ejemplo:



Data Mart de Ventas.

Data Mart de Finanzas.

Data Mart de Recursos Humanos.



Así cada área consulta únicamente la información que necesita.



**Batch/Streaming**

Batch

Los datos se procesan por lotes.

Ejemplo:

Todos los días a las 2:00 a.m. se cargan las ventas del día anterior.



Streaming

Los datos se procesan casi en tiempo real.

Ejemplo:

Cada compra aparece en el dashboard segundos después de realizarse.



**Herramientas de un Data Engineer**

SQL (PostgreSQL y Oracle como motores principales).

Python.

Pandas.

Git y GitHub.

Docker.

Apache Airflow.

PySpark.

Power BI.

APIs REST.

