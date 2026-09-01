#Laboratorio07
#analisis_ventas_python
import csv


#Parte 4 — Crear una función
def calcular_total(cantidad, precio):    
   return cantidad * precio 

"""Utiliza el módulo csv.
   Parte 1 — Leer el CSV 
Debes conseguir leer todas las filas. """

#Primero usamos la funcion with para manejar mejor el uso de archivos, ponemos en su interior la ruta, en modo lectura y lo reonombramos
#Despues usamos una variable llamada contenido y usamos el metodo del csv reader con el renombre que le dimos al abrir el archivo y su ruta
with open("C:/Users/metin/OneDrive/Documentos/CursoIngeniDatos/Semana-07/laboratorio/ventas.csv", "r",encoding="utf-8") as archivo:
    contenido = csv.reader(archivo)

    encabezado = next(contenido)
    encabezado.append("total")
    print(encabezado)

#Parte 2 — Calcular ventas 
#Despues usamos una instruccion for para recorrer todo su contenido a la variable donde leemos el archivo e imprimimos para ver si esatn dando los valores
    registros = 0
    registros1= 0
    registros2=0
    importe_total = 0
    for conte in contenido:
       registros = registros + 1

       cantidad = int(conte[2])
       precio = float(conte[3]) 
                           
       total = calcular_total(cantidad , precio)
       conte.append(total)
       print(conte)


#Parte 3 — Validar datos   
       if cantidad <=0:
          print("Cantidad invalida")
          registros1 +=1
       elif precio <=0:
          print("Precio invalido")
          registros1 += 1 
       else:
          print("Valor valido continue")    
          registros2 += 1   

          importe_total += total




#Parte 5 — Crear un resumen
print("========== RESUMEN ==========")

print("Registros procesados", registros)
print("Ventas validas", registros2)
print("Ventas invalidas", registros1)
print("Importe total: $", importe_total)

