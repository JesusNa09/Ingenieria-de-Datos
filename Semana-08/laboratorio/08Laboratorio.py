#Laboratorio08
#analisis_ventas_python


"""El laboratorio debe:"""
# 1.Importar Pandas
import pandas as pd


# 2. Leer el CSV
df = pd.read_csv("ventas.csv")
#print(df)


# 3. Mostrar:
  # Primeros registros
print("Primeros 10 registros")  
print(df.head(10))
#primeras_filas = df.head(10)
#print(primeras_filas)

  # Dimensiones
print("\nDimensiones del Dataframe")  
print(df.shape)  
#dime_dat = df.shape
#print("Las dimensiones son: " ,dime_dat)

  # Columnas
print("\nColumnas del Dataframe")
print(df.columns)  
#columnas = df.columns
#print("Las colimnas son: " ,columnas)

  # Información del DataFrame
print("\nInformación del Dataframe")
df.info
#info_data= df.info
#print("Informa de mi Data: " , info_data)


# 4. Seleccionar:
"""producto
precio"""
print("\nColumnas Producto y Precio")
print(df[["producto","precio"]])
#columnas_seleccionadas= 
#print(columnas_seleccionadas)


# 5. Filtrar:
"""precio > 1000 """
print("\nProductos con precio mayor a 1000")
print(df[df["precio"]>1000])
#colum_filtradas = df[df["precio"]>1000]
#print(columnas_seleccionadas)


# 6. Crear:
"""total = cantidad * precio"""
print("Ventas totales ")
df["total"] = df["cantidad"] * df["precio"]
print("Precio total")
print(df["total"])


#7. Detectar valores nulos.
print("\nValores nulos:")
print(df.isnull().sum())
#valores_nulos = df.isnull
#print(valores_nulos)


# 8. Guardar:
df.to_csv("ventas_procesadas.csv", index = False)

print("\nArchivo ventas_procesadas.csv generado correctamente.")
