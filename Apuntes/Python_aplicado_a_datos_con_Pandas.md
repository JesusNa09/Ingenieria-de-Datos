# Índice

¿Qué es Pandas?
¿Por qué necesitamos Pandas?
¿Qué es un DataFrame?
Crear un DataFrame
Leer CSV
Ver los primeros registros
Ver los últimos registros
Conocer las dimensiones
Ver los nombres de columnas
Información general
Estadísticas básicas
Seleccionar una columna
Seleccionar varias columnas
Filtrar datos
Crear una columna
Modificar una columna
Eliminar una columna
Valores nulos
Guardar un DataFrame
La conexión con SQL
 

# 1. ¿Qué es Pandas?
Pandas es una biblioteca de Python utilizada principalmente para manipular y analizar datos estructurados.
La instalaremos mediante:
pip install pandas
Y la importaremos normalmente así:
import pandas as pd
El alias:
pd
es una convención muy utilizada.


# 2. . ¿Por qué necesitamos Pandas?
En la Semana 7 hiciste algo como:

for contenido in contenidos:
    cantidad = int(contenido[2])
    precio = float(contenido[3])
    total = cantidad * precio

Eso sirve para aprender Python.
Pero imagina que tienes:

1,000 registros
100,000 registros
1,000,000 registros

Trabajar manualmente con índices como:
contenido[2]
contenido[3]

puede hacerse bastante incómodo.
Pandas nos permite trabajar con los datos de manera tabular:

        producto      cantidad    precio
0       Laptop          2        15000
1       Mouse            5          500
2       Teclado          3          800

Esto se llama:
DataFrame


# 3. ¿Qué es un DataFrame?
Un DataFrame es una estructura de datos bidimensional.
Puedes imaginarlo como una tabla:
             columnas
        ↓       ↓       ↓
      producto cantidad precio
      ─────────────────────────
 0    Laptop      2      15000
 1    Mouse       5        500
 2    Teclado     3        800

Tiene:
filas;
columnas;
índices;
nombres de columnas.
Y esto será fundamental para las siguientes semanas.


# 4. Crear un DataFrame
Podemos crear uno manualmente:
import pandas as pd

datos = {
    "producto": ["Laptop", "Mouse", "Teclado"],
    "cantidad": [2, 5, 3],
    "precio": [15000, 500, 800]
}

df = pd.DataFrame(datos)

print(df)

Resultado aproximado:

  producto  cantidad  precio
0   Laptop         2   15000
1    Mouse         5     500
2  Teclado         3     800


# 5. Leer CSV
Aquí comienza lo interesante.
En lugar de:
import csv
podemos utilizar:
import pandas as pd
df = pd.read_csv("ventas.csv")

Y listo.
Pandas convierte el CSV en un DataFrame.
ventas.csv
     ↓
pd.read_csv()
     ↓
DataFrame


# 6. Ver los primeros registros
Una de las primeras cosas que debes hacer cuando recibes un archivo es inspeccionarlo.
df.head()
Por defecto muestra los primeros 5 registros.
También:
df.head(10)
muestra los primeros 10.


# 7. Ver los últimos registros
df.tail()
Esto muestra las últimas filas.


# 8. Conocer las dimensiones
Podemos utilizar:
df.shape
Por ejemplo:
(124, 5)
significa:
124 filas
5 columnas
Esto es muy útil en Data Engineering porque rápidamente podemos comprobar qué cantidad de datos recibimos.


# 9. Ver los nombres de columnas
df.columns
Podríamos obtener:
Index(['producto', 'categoria', 'cantidad', 'precio'], dtype='object')


# 10. Información general
Una herramienta muy importante:
df.info()
Nos muestra información sobre:
columnas;
cantidad de registros;
tipos de datos;
valores no nulos.
Por ejemplo:
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 100 entries
Data columns:
 producto     100 non-null object
 cantidad     100 non-null int64
 precio       100 non-null float64
Esto será muy importante cuando lleguemos a calidad de datos.


# 11. Estadísticas básicas
Podemos utilizar:
df.describe()
Esto nos permite obtener estadísticas de columnas numéricas.
Por ejemplo:
count
mean
std
min
25%
50%
75%
max
No necesitas memorizar todavía qué significa cada estadística.
Lo veremos con más profundidad cuando trabajemos análisis y calidad de datos.


# 12. Seleccionar una columna
Supongamos:
df
contiene:
producto
cantidad
precio
Podemos seleccionar:
df["precio"]
Esto nos devuelve una Series.


# 13. Seleccionar varias columnas
Podemos hacer:
df[["producto", "precio"]]
Observa los dos corchetes.
df["precio"]
→ una columna.
Mientras:
df[["producto", "precio"]]
→ varias columnas.


# 14. Filtrar datos
Esto será muy importante.
Supongamos que queremos ventas mayores a 1,000:
df[df["precio"] > 1000]
Pandas devuelve solamente los registros que cumplen la condición.
Esto es muy parecido conceptualmente a:
SELECT *
FROM ventas
WHERE precio > 1000;
Aquí empezamos a conectar lo que aprendiste anteriormente:
SQL
  ↓
WHERE

Pandas
  ↓
df[df["precio"] > 1000]


# 15. Crear una columna
Supongamos:
cantidad
precio
Queremos:
total
Podemos hacer:
df["total"] = df["cantidad"] * df["precio"]
Ahora nuestro DataFrame tendrá:
producto | cantidad | precio | total
Esto es una transformación de datos.
Y quiero que empieces a reconocerlo:
CSV
 ↓
DataFrame
 ↓
Transformación
 ↓
Nueva columna
Eso ya se parece mucho a un proceso ETL.


# 16. Modificar una columna
Podemos hacer:
df["precio"] = df["precio"] * 1.16
Por ejemplo, agregar IVA.


# 17. Eliminar una columna
Podemos utilizar:
df = df.drop(columns=["total"])
Esto elimina la columna total.


# 18. Valores nulos
Los datos reales rara vez vienen perfectos.
Podemos tener:
producto | precio
Laptop   | 15000
Mouse    | NULL
Teclado  | 800
Pandas puede detectarlos:
df.isnull()
o:
df.isna()
Y podemos contar:
df.isnull().sum()
Esto será muy importante posteriormente.


# 19. Guardar un DataFrame
Después de transformar los datos podemos guardarlos:
df.to_csv("ventas_procesadas.csv", index=False)
Entonces tenemos:
ventas.csv
    ↓
Pandas
    ↓
DataFrame
    ↓
Transformación
    ↓
ventas_procesadas.csv
Y aquí ya estamos construyendo una pequeña transformación ETL.


# La conexión con SQL
Quiero que empieces a pensar en equivalencias:
| SQL           | Pandas                |
| ------------- | --------------------- |
| `SELECT`      | Seleccionar columnas  |
| `WHERE`       | Filtrar               |
| `ORDER BY`    | `sort_values()`       |
| `COUNT()`     | `count()`             |
| `DISTINCT`    | `drop_duplicates()`   |
| Crear columna | `df["columna"] = ...` |


No vamos a aprender todas las equivalencias esta semana.
Las iremos incorporando poco a poco.