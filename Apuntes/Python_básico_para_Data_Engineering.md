# Índice

¿Por qué Python en Data Engineering?
¿Qué es Python?
Variables
Tipos de datos
Listas
Diccionarios
Listas de diccionarios
Condicionales
Ciclos for
Funciones
Manejo de archivos
CSV
Manejo básico de errores


# 1. ¿Por qué Python en Data Engineering?
Hasta ahora has aprendido a hacer muchas cosas con SQL.
Por ejemplo:
SELECT
    producto,
    SUM(ventas) AS total_ventas
FROM ventas
GROUP BY producto;
SQL es excelente para trabajar con datos dentro de una base de datos.
Pero un Data Engineer también necesita trabajar con:
CSV
Excel
JSON
APIs
Archivos de texto
Bases de datos
Logs
Sistemas externos
Ahí Python se vuelve muy útil.
Por ejemplo:
Archivo CSV
    ↓
Python
    ↓
Validar datos
    ↓
Limpiar datos
    ↓
Transformar datos
    ↓
Guardar CSV
    ↓
PostgreSQL
Más adelante construiremos pipelines similares.


# 2. ¿Qué es Python?
Python es un lenguaje de programación de propósito general.
Para nosotros, lo importante es que tiene un ecosistema muy grande para trabajar con datos.
Posteriormente utilizaremos herramientas como:
Python
 ├── Pandas
 ├── Requests
 ├── SQLAlchemy
 ├── psycopg
 └── PySpark
 Pero todavía no vamos a utilizarlas todas.
Esta semana primero vamos a aprender Python puro.


# 3. Variables
Una variable permite almacenar un valor.
nombre = "Jesus"
edad = 25
salario = 15000.50
activo = True
Podemos consultar:
print(nombre)
print(edad)
print(salario)
print(activo)
En Data Engineering esto será fundamental porque constantemente tendremos valores como:
archivo = "ventas.csv"
tabla = "ventas"
cantidad_registros = 1000
ruta_archivo = "/data/ventas.csv"


# 4. Tipos de datos
Los principales que aprenderemos esta semana:
str
Texto:
producto = "Laptop"
int
Número entero:
cantidad = 10
float
Número decimal:
precio = 15000.50
bool
Verdadero o falso:
activo = True
Podemos comprobar el tipo:
print(type(producto))
print(type(cantidad))
print(type(precio))
print(type(activo))


# 5. Listas
Una lista permite almacenar varios valores.
productos = [
    "Laptop",
    "Mouse",
    "Teclado",
    "Monitor"
]
Podemos acceder mediante posiciones:
print(productos[0])
Resultado:
Laptop
La posición comienza en 0.
0 → Laptop
1 → Mouse
2 → Teclado
3 → Monitor
Esto será muy importante cuando empecemos a procesar datos.


# 6. Diccionarios
Este concepto es especialmente importante para Data Engineering.
Un diccionario almacena información mediante:
clave → valor
Por ejemplo:
cliente = {
    "id": 1,
    "nombre": "Juan",
    "edad": 30,
    "activo": True
}
Podemos acceder:
print(cliente["nombre"])
Resultado:
Juan
¿Por qué nos interesa tanto?
Porque los datos JSON que recibiremos posteriormente de APIs tienen una estructura muy parecida.
Por ejemplo:
{
    "id": 1,
    "nombre": "Juan",
    "activo": true
}
Python puede trabajar directamente con esta estructura.


# 7. Listas de diccionarios
Aquí empieza a ponerse interesante para Data Engineering.
Podemos tener:
clientes = [
    {
        "id": 1,
        "nombre": "Juan",
        "edad": 30
    },
    {
        "id": 2,
        "nombre": "Ana",
        "edad": 25
    },
    {
        "id": 3,
        "nombre": "Pedro",
        "edad": 35
    }
]
Esto representa conceptualmente una tabla:
| id | nombre | edad |
| -: | ------ | ---: |
|  1 | Juan   |   30 |
|  2 | Ana    |   25 |
|  3 | Pedro  |   35 |
Más adelante Pandas convertirá estructuras como ésta en un DataFrame.


# 8. Condicionales
Python permite tomar decisiones.
edad = 25

if edad >= 18:
    print("Mayor de edad")
else:
    print("Menor de edad")

Esto será útil para validación de datos.
Por ejemplo:
precio = -100

if precio < 0:
    print("Dato inválido")
else:
    print("Dato válido")

Ya estamos entrando en lógica de Data Quality.


# 9. Ciclos for
Los ciclos permiten procesar múltiples registros.
Por ejemplo:
productos = [
    "Laptop",
    "Mouse",
    "Teclado"
]

for producto in productos:
    print(producto)
Resultado:
Laptop
Mouse
Teclado
Ahora imagina:    
ventas = [
    {"producto": "Laptop", "cantidad": 2},
    {"producto": "Mouse", "cantidad": 5},
    {"producto": "Teclado", "cantidad": 3}
]
Podemos recorrerlas:
for venta in ventas:
    print(venta["producto"])


# 10. Funciones
Una función permite reutilizar código.
def calcular_total(precio, cantidad):
    return precio * cantidad
Después:
total = calcular_total(100, 5)
print(total)    
Resultado:
500
En un pipeline podemos terminar teniendo funciones como:
def extraer_datos():
    ...
def transformar_datos():
    ...
def cargar_datos():
    ...
Y eventualmente:
EXTRACT
   ↓
TRANSFORM
   ↓
LOAD
Ese será uno de los objetivos importantes de las próximas semanas.


# 11. Manejo de archivos
Esta semana empezaremos a trabajar con archivos.
Por ejemplo:
with open("datos.txt", "r") as archivo:
    contenido = archivo.read()
print(contenido)
with es importante porque permite manejar correctamente la apertura y cierre del archivo.


# 12. CSV
Los CSV son fundamentales en Ingeniería de Datos.
Python tiene el módulo csv.
Por ejemplo:
import csv

with open("ventas.csv", "r", encoding="utf-8") as archivo:
    lector = csv.reader(archivo)

    for fila in lector:
        print(fila)

Esto nos permitirá leer datos como:
producto,cantidad,precio
Laptop,2,15000
Mouse,5,500
Teclado,3,800
Y convertirlos en estructuras que Python pueda procesar.


# 13. Manejo básico de errores
También aprenderemos:
try:
    numero = int("abc")
except ValueError:
    print("El valor no es numérico")
¿Por qué?
Porque en un pipeline real los datos pueden venir mal.
Por ejemplo:    
precio = "15000"
precio = "N/A"
precio = ""
precio = "-500"
Nuestro programa debe poder detectar problemas.