#Tarea07
import csv

"""Crea un pequeño programa de procesamiento de ventas.
El programa debe:"""

# 6. Crear funciones
def leer_ventas():
    valores =[]
    # 1. Leer un CSV
    with open("C:/Users/metin/OneDrive/Documentos/CursoIngeniDatos/Semana-07/tarea/ventas.csv","r", encoding="cp1252") as archivo:
        contenidos = csv.reader(archivo)
        encabezado = next(contenidos)
        encabezado.append("total")
    #2. Procesar cada registro
        for contenido in contenidos:
            valores.append(contenido)

    return valores


def validar_venta(contenido):
#3. Validar
        cantidad = float(contenido[2])
        precio = float(contenido[3]) 

        if cantidad <= 0:
            print("Cantidad invalida")
            return False
        
        elif precio <= 0:
            print("precio invalido")
            return False
        else:
            print("Datos validos")        
            return True


def calcular_total(contenido):
#4. Calcular
    cantidad = float(contenido[2])
    precio = float(contenido[3])

    total = cantidad * precio
    print("Total:",total)
    return total


# 5. Generar estadísticas
def generar_resumen(valores):
    numero_registros=0
    numeros_validos=0
    numeros_invalidos=0
    venta_tot=0
    totales=[]

    for contenido in valores:
        numero_registros += 1
        print(contenido)

        if not validar_venta(contenido):
            numeros_invalidos+=1
            continue

        numeros_validos+=1
        total=calcular_total(contenido)

        totales.append(total)
        venta_tot+=total
        print("\n------ RESUMEN ------")

    if numeros_validos>0:
        promedio=venta_tot/numeros_validos
        venta_maxima=max(totales)
        venta_minima=min(totales)

        print("Número de registros:",numero_registros)
        print("Número de registros válidos:",numeros_validos)
        print("Número de registros inválidos:",numeros_invalidos)
        print("Venta total:",venta_tot)
        print("Venta promedio:",promedio)
        print("Venta máxima:",venta_maxima)
        print("Venta mínima:",venta_minima)

    else:
        print("No hay ventas válidas")



valores = leer_ventas()
generar_resumen(valores)
