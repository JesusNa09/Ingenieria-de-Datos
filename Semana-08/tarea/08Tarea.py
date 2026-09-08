#Tarea08

#1. Cargar los datos
import pandas as pd

df = pd.read_csv("ventas.csv" , encoding='latin-1')
print(df)


# 2. Explorar
"""Mostrar:"""
print("\n Dimensiones del DataFrame")
print(df.shape)

print("\n Columnas del DataFrame")
print(df.columns)

print("\n Primeros 10 registros del DataFrame")
print(df.head(10))

print("\n Informacion general del DataFrame")
print(df.info)


#3. Detectar datos faltantes
"""Mostrar la cantidad de valores nulos por columna."""
print("\n Valores nulos de las columnas del DataFrame")
print(df.isnull().sum())


#4. Crear una columna
"""total = cantidad * precio"""
print("\n Total del precio por cantidad")
df["total"] = df["cantidad"] * df["precio"]
print(df["total"])


#5. Filtrar ventas
"""Obtén solamente las ventas cuyo:
total > 5000"""
print("\n Totales mayores a 5000")
ventas_mayores = df[df["total"] > 5000]
print(ventas_mayores)


# 6. Ordenar
"""Ordena por:
total
de mayor a menor."""
print("\n Valores ordenados por la columna total de maypr a menor")
df = df.sort_values(by="total", ascending=False)
print(df)

# 7. Crear un resumen
"""Obtén:
Número de registros
Venta total
Venta promedio
Venta máxima
Venta mínima"""
# 7. Crear un resumen

print("\n------ RESUMEN ------")

numero_registros = len(df)
venta_total = df["total"].sum()
venta_promedio = df["total"].mean()
venta_minima = df["total"].min()
venta_maxima = df["total"].max()

print("Número de registros:", numero_registros)
print("Venta total:", venta_total)
print("Venta promedio:", venta_promedio)
print("Venta mínima:", venta_minima)
print("Venta máxima:", venta_maxima)

#8. Guardar
"""Genera:
ventas_procesadas.csv"""

df.to_csv("ventas_procesadas.csv", index=False)



