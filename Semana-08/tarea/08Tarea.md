# Tarea 

Ahora tú vas a construir un pequeño proceso de transformación utilizando Pandas.

Crea:

08tarea.py

Utiliza un CSV de ventas.

Tu programa deberá:

1. Cargar los datos
pd.read_csv()
2. Explorar

Mostrar:

shape
columns
head
info
3. Detectar datos faltantes

Mostrar la cantidad de valores nulos por columna.

4. Crear una columna
total = cantidad * precio
5. Filtrar ventas

Obtén solamente las ventas cuyo:

total > 5000
6. Ordenar

Ordena por:

total

de mayor a menor.

7. Crear un resumen

Obtén:

Número de registros
Venta total
Venta promedio
Venta máxima
Venta mínima
8. Guardar

Genera:

ventas_procesadas.csv