#Tarea08
import pandas as pd
import numpy as np

'''El programa debe:'''

#Leer el archivo.
print("Lectura de archivo")
df = pd.read_csv("ventas.csv", encoding="latin-1")
print(df);

#Mostrar información general.
print("\n Informacion general del archivo")
print(df.info())
registros_originales = len(df)

#Detectar nulos.
print("\n Valores nulos")
print(df.isnull().sum())
registros_con_nulos = df.isnull().any(axis=1).sum()

#Detectar duplicados.
print("\n Valores duplicados")
print(df.duplicated().sum())
registros_duplicados = df.duplicated().sum()

#Limpiar espacios.
print("\n Limpiar espacios")
df['producto'].str.strip()
df['categoria'].str.strip()
print(df)

#Estandarizar textos.
print("\n Limpiar espacios")
df[['producto','categoria']] = df[['producto','categoria']].apply(lambda x: x.str.capitalize())
df[['producto','categoria','cantidad','precio','fecha']] = df[['producto','categoria','cantidad','precio','fecha']].replace(['-', '--', 'N/A', 'NA', ''], np.nan)
print(df)

#Convertir tipos de datos.
print("\n Convertir tipos de datos")
df[['cantidad','precio']]=df[['cantidad','precio']].apply(pd.to_numeric)
print(df)

#Convertir fechas.
print("\n Convertir fechas")
df['fecha']=pd.to_datetime(df['fecha'],dayfirst=True)
print(df)

#Eliminar registros inválidos.
print("\n Eliminar registros erroneos")
df=df.dropna(subset=['producto','categoria','cantidad','precio','fecha'])
print(df)

#Crear total.
df['total']= df['cantidad']*df['precio']

#Mostrar un resumen antes y después de la limpieza.
registros_finales = len(df)
registros_eliminados = registros_originales - registros_finales
"""Resumen esperado
------ RESUMEN DE LIMPIEZA ------

Registros originales: 10
Registros duplicados: 2
Registros con nulos: 1
Registros eliminados: 3
Registros finales: 7 """

print("------ RESUMEN DE LIMPIEZA ------")
print(f"Registros originales: {registros_originales}")
print(f"Registros duplicados: {registros_duplicados}")
print(f"Registros con nulos: {registros_con_nulos}")
print(f"Registros eliminados: {registros_eliminados}")
print(f"Registros finales: {registros_finales}")

#Guardar: ventas_limpias.csv
df=df.to_csv('ventas_limpias.csv')


