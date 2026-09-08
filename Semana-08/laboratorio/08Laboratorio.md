# Laboratorio

Vamos a utilizar un CSV parecido al de la Semana 7.

Archivo:

ventas.csv

con:

producto,categoria,cantidad,precio
Laptop,Electronica,2,15000
Mouse,Electronica,5,500
Teclado,Electronica,3,800
Monitor,Electronica,2,4000
Silla,Muebles,4,2500
Escritorio,Muebles,2,5000

Crea:

08laboratorio.py
El laboratorio debe:

1. Importar Pandas

import pandas as pd

2. Leer el CSV

df = pd.read_csv("ventas.csv")

3. Mostrar:

Primeros registros
Dimensiones
Columnas
Información del DataFrame

4. Seleccionar:

producto
precio

5. Filtrar:

precio > 1000

6. Crear:

total = cantidad * precio

7. Detectar valores nulos.

8. Guardar:

ventas_procesadas.csv