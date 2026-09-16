#Laboratorio09
#analisis_ventas_python
import pandas as pd


"""Actividades"""

#Leer el CSV.
print("DataFrame del archivo ventas sucias")
df = pd.read_csv("ventas_sucias.csv")
print(df)


#Mostrar los primeros registros.
print("\n Primeros 10 digitos")
print(df.head(10))


#Mostrar los tipos de datos.
print("\nTipos de datos")
print(df.info())


#Detectar valores nulos.
print("\n Valores nulos")
print(df.isnull().sum())

#Detectar duplicados.
print("\n Valores duplicados")
print(df.duplicated())


#Limpiar espacios en producto.
print("\n Limpieza de espacios en la columna producto")
df["producto"] = df["producto"].str.strip()
print(df)

#Estandarizar categoria.
print("\n Estandarizar la columna de Electronica")
df["categoria"] = df["categoria"].replace({
                                "electronica":"Electronica",
                                "eléctronica":"Electronica",
                                "Eléctronica":"Electronica"})
print(df)


#Convertir cantidad y precio a números.
print("\n Conversion de columna cantidad y precio a numero")
df[["cantidad","precio"]] = df[["cantidad","precio"]].apply(pd.to_numeric)
print(df)


#Eliminar registros sin producto.
print("\n Quitar registros que no tengan producto")
df=df[df["producto"].notna()]
df=df[df["cantidad"].notna()]
df=df[df["categoria"].notna()]
print(df)


#Eliminar o corregir precios inválidos.
print("\n Eliminar registros con numeros invalidos")
df=df[df["precio"]>0]
print(df)

#Crear la columna total.
print("\n Operacion de columna cantidad por precio asiganda en la columna total")
df["total"]= df["cantidad"] * df["precio"]
print(df)

#Guardar el resultado como:
df = df.to_csv("ventas_limpias.csv")

