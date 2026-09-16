# Índice

¿Qué es la limpieza de datos?
¿Por qué es importante?
Detectar valores nulos
¿Qué hacer con los valores nulos?
Detectar registros duplicados
Limpiar textos
Corregir tipos de datos
Trabajar con fechas
Reemplazar valores incorrectos
Filtrar registros inválidos
Ejemplo completo
¿Qué significa errors="coerce"?



1. ¿Qué es la limpieza de datos?
La limpieza de datos es el proceso de detectar, corregir, eliminar o tratar datos incorrectos, incompletos, duplicados o inconsistentes.
Por ejemplo:

Datos originales
      ↓
Detección de problemas
      ↓
Corrección
      ↓
Datos limpios
En Data Engineering, la limpieza normalmente forma parte de la etapa Transform de un proceso ETL.


2. ¿Por qué es importante?
Porque los datos pueden afectar directamente los resultados.
Por ejemplo, si tienes:

Laptop = 15000
Laptop = 15000

y el segundo registro está duplicado, podrías calcular ventas incorrectas.
O si tienes:
precio = -2500
podrías generar un total inválido:
cantidad * precio
Por eso, antes de cargar datos a una base de datos o utilizarlos en un reporte, debemos revisar su calidad.


3. Detectar valores nulos
Ya conociste:
df.isnull()
Pero esta semana aprenderás a utilizarlo para tomar decisiones.
Por ejemplo:
df.isnull().sum()
Resultado:
producto     0
categoria    1
cantidad     1
precio       0
fecha        0
dtype: int64
Esto significa que:
producto no tiene nulos.
categoria tiene 1 nulo.
cantidad tiene 1 nulo.
También puedes utilizar:
df.isna().sum()
isnull() e isna() funcionan de manera equivalente.


4. ¿Qué hacer con los valores nulos?
No siempre debemos eliminar los registros. Primero debemos analizar qué significa el dato faltante.

Opción A: Eliminar filas con nulos
df_limpio = df.dropna()
Elimina las filas que contienen valores nulos.
Por ejemplo:
Antes: 6 registros
Después: 4 registros
¿Cuándo puede utilizarse?
Cuando el registro no sirve si le falta ese dato.
Por ejemplo, una venta sin producto o sin cantidad.

Opción B: Reemplazar nulos
df["cantidad"] = df["cantidad"].fillna(0)
Reemplaza los valores nulos de cantidad por 0.
También puedes utilizar:
df["categoria"] = df["categoria"].fillna("Sin categoría")
Importante
No siempre es correcto reemplazar un nulo por cero.
Por ejemplo:
Cantidad faltante → podría ser 0, pero debes analizarlo.
Precio faltante → probablemente no deberías asumir que es 0.
Fecha faltante → quizá debas investigar el origen del dato.
La limpieza no consiste solamente en eliminar nulos, sino en decidir qué tratamiento corresponde.


5. Detectar registros duplicados
Para detectar duplicados:
df.duplicated()
Para contar cuántos existen:
df.duplicated().sum()
Para mostrar los registros duplicados:
df[df.duplicated()]
Para eliminarlos:
df = df.drop_duplicates()
Ejemplo:
Antes:
Laptop
Mouse
Laptop
Después:
Laptop
Mouse
¿Por qué importa?
Porque los duplicados pueden provocar:
Ventas infladas.
Conteos incorrectos.
Cargas repetidas.
Problemas de calidad.


6. Limpiar textos
Es común que los datos tengan espacios o diferencias de mayúsculas y minúsculas.
Ejemplo:
" Electronica"
"electronica"
"ELECTRONICA"
Podemos limpiar espacios:
df["categoria"] = df["categoria"].str.strip()
Convertir a minúsculas:
df["categoria"] = df["categoria"].str.lower()
Convertir a mayúsculas:
df["categoria"] = df["categoria"].str.upper()
Por ejemplo:
df["producto"] = df["producto"].str.strip()
Esto elimina espacios al inicio y al final del texto.


7. Corregir tipos de datos
En un CSV, los datos pueden leerse con tipos incorrectos.
Por ejemplo:
cantidad
"2"
"5"
"3"
Aunque parecen números, podrían estar almacenados como texto.
Para revisar los tipos:
df.dtypes
Para convertir una columna:
df["cantidad"] = df["cantidad"].astype(int)
Para convertir a decimal:
df["precio"] = df["precio"].astype(float)

¿Qué problema puede ocurrir?
Si cantidad es texto, esta operación puede producir resultados inesperados:
df["cantidad"] * 2


8. Trabajar con fechas
Los CSV pueden contener fechas como:
01/08/2026
02/08/2026
03/08/2026
Para convertirlas:
df["fecha"] = pd.to_datetime(
    df["fecha"],
    dayfirst=True
)
Después puedes consultar:
df["fecha"].dt.year
df["fecha"].dt.month
df["fecha"].dt.day
También puedes filtrar por fecha:
df[df["fecha"] >= "2026-08-01"]
Esto será muy importante más adeante cuando trabajemos con datos históricos y procesos ETL.


9. Reemplazar valores incorrectos
Supongamos que tienes:
Electronica
electronica
ELECTRONICA
Puedes reemplazar valores específicos:

df["categoria"] = df["categoria"].replace(
    "electronica",
    "Electronica"
)
O varios valores:
df["categoria"] = df["categoria"].replace({
    "electronica": "Electronica",
    "ELECTRONICA": "Electronica"
})

También puedes reemplazar valores inválidos:
df["precio"] = df["precio"].replace(-2500, None)
Sin embargo, en datos reales normalmente primero debemos identificar qué valores son incorrectos.


10. Filtrar registros inválidos
Supongamos que no queremos precios menores o iguales a cero:
df = df[df["precio"] > 0]
También podemos filtrar cantidades:
df = df[df["cantidad"] > 0]
O conservar únicamente registros que tengan producto:
df = df[df["producto"].notna()]
Esto es una forma de validación y limpieza.


11. Ejemplo completo
import pandas as pd

df = pd.read_csv("ventas.csv")

# 1. Revisar datos
print(df.head())
print(df.info())

# 2. Limpiar espacios en textos
df["producto"] = df["producto"].str.strip()
df["categoria"] = df["categoria"].str.strip()

# 3. Estandarizar categorías
df["categoria"] = df["categoria"].str.lower()

# 4. Detectar nulos
print(df.isnull().sum())

# 5. Eliminar duplicados
df = df.drop_duplicates()

# 6. Convertir tipos
df["cantidad"] = pd.to_numeric(
    df["cantidad"],
    errors="coerce"
)

df["precio"] = pd.to_numeric(
    df["precio"],
    errors="coerce"
)

# 7. Eliminar registros sin datos importantes
df = df.dropna(subset=["producto", "cantidad", "precio"])

# 8. Filtrar valores inválidos
df = df[df["cantidad"] > 0]
df = df[df["precio"] > 0]

# 9. Crear total
df["total"] = df["cantidad"] * df["precio"]

# 10. Guardar datos limpios
df.to_csv("ventas_limpias.csv", index=False)


#  12. ¿Qué significa errors="coerce"?
Ese parámetro es muy importante:
pd.to_numeric(df["precio"], errors="coerce")
Si encuentra un valor que no puede convertir a número, lo transforma en NaN.
Por ejemplo:
15000
500
N/A
4000
Después de la conversión:
15000
500
NaN
4000
Esto permite detectar posteriormente los valores inválidos:
df.isnull().sum()

Flujo:
Dato inválido
      ↓
errors="coerce"
      ↓
NaN
      ↓
Detectar
      ↓
Eliminar o corregir