# Tarea 
Crea un pequeño programa de procesamiento de ventas.

El programa debe:

1. Leer un CSV
ventas.csv
2. Procesar cada registro

Obtener:

producto
categoria
cantidad
precio
3. Validar

Detectar:

cantidad <= 0
precio <= 0
campos vacíos
4. Calcular
total = cantidad * precio
5. Generar estadísticas

Como mínimo:

Número de registros
Número de registros válidos
Número de registros inválidos
Venta total
Venta promedio
Venta máxima
Venta mínima
6. Crear funciones

Como mínimo:

leer_ventas()
validar_venta()
calcular_total()
generar_resumen()
7. Manejar errores

Utiliza:

try:
    ...
except:
    ...

de manera apropiada.