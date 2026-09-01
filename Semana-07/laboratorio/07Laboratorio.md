# Laboratorio

Aquí empezaremos nuestro primer pequeño proyecto de Python orientado a datos.

Proyecto
analisis_ventas_python

Vamos a trabajar con información de ventas.

Crea un archivo:

ventas.csv

con aproximadamente:

producto,categoria,cantidad,precio
Laptop,Electronica,2,15000
Mouse,Electronica,5,500
Teclado,Electronica,3,800
Monitor,Electronica,2,4000
Silla,Muebles,4,2500
Escritorio,Muebles,2,5000

Puedes agregar más registros.

Parte 1 — Leer el CSV

Crea:

07laboratorio.py

y utiliza el módulo csv.

Debes conseguir leer todas las filas.

Parte 2 — Calcular ventas

Para cada registro calcula:

total = cantidad × precio

Por ejemplo:

total = cantidad * precio
Parte 3 — Validar datos

Tu programa debe detectar si:

cantidad <= 0
precio <= 0

Por ejemplo:

if cantidad <= 0:
    print("Cantidad inválida")
Parte 4 — Crear una función

Crea una función:

def calcular_total(cantidad, precio):
    ...

y utilízala para calcular el total de cada venta.

Parte 5 — Crear un resumen

Al final muestra algo parecido a:

========== RESUMEN ==========

Registros procesados: 10

Ventas válidas: 9

Ventas inválidas: 1

Importe total: $XX,XXX.XX