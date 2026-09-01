# Quiz

¿Qué es Python y por qué es utilizado en Data Engineering?
Es un lenguaje de programacion de alto nivel de facil sintaxis, es utilizado por los Data Engineer para poder manipular datos de diferentes fuentes como json, archivos txt, csv y
permite automatizar procesos y cobtruir pipelines ETL.

¿Qué es una variable?
Es un contenedor que guarda un valor en memoria y su valor puede cambiar
durante el programa

Menciona cuatro tipos de datos básicos de Python.
Unos de los cuatro tipos de datos basicos son str, int, bool, float

¿Cuál es la diferencia entre una lista y un diccionario?
Los estructuras de datos , almacenan datos , la principal diferencia es en como lo guardan , en las listas gurdan los datos de cualquier tipo, pueden ser modificables y en los diccionarios guardan los datos por clave valor

¿Qué es un diccionario?
Es una estructura de datos que almacena datos de modo clave valor, donde la clave es una descripcion de los datos y el valor es cualquier objeto en python por ejemplo un numero o caracter

¿Qué hace un ciclo for?
Es una instruccion en python que sirve para iterar secuencias, cadenas dentro de un bloque de codigo

¿Para qué sirve una función?
Sirve para crear bloques de codigo mas ordenados para poder ser reutilizados, tener una mayor comprension de este incluso en equipos, para detectar con mayor facilidad los errores y cuando haya cambios poder ser mas facil y eficiente
ese cambio solo en el bloque afectando a todo el codigo

¿Cuál es la diferencia entre print() y return?
La diferencia es que un print solo muestra los datos en pantalla mientras que un return te devuelve valores como resultados

¿Para qué sirve with open()?
Sirve para abrir y cerrar archivos con mayor facilidad ademas de ser mas seguro si se guardan los datos en el nuevo archivo

¿Qué es un archivo CSV y por qué es importante para Data Engineering?
Es solo un archivo con formato y es muy importante ya que muchos archivos con datos vienen en ese formato por lo que es importante saber como manejar desde abrir modificar y guardar los datos de ese tipo de archivos

¿Para qué sirve try/except?
Sirve para poder gestionar y tratar con mayor facilidad los errores en el codigo en tiempo de ejecucion y no se detenga el programa ademas para identificar y corregir con mayor facilidad los errores

¿Qué hace este código?
ventas = [100, 200, 300]
total = 0
for venta in ventas:
    total += venta
print(total)
Este codigo primero declara una lista con valores de tipo numerico , despues hace una instruccion for donde recorre todos los numeros de la lista con una variable que inica en cero y cada vez que va recorriendo va sumando los valores
de la lista al final solo muestra en pantalla el resultado

¿Qué hace esta función?
def calcular_total(precio, cantidad):
    return precio * cantidad
Lo que hace esta funcion es darle un nombre de calcular_total a su vez recibir dos parametros de entrada, el precio y su cantidad y te regresa como resultado la multiplicacion de estas dos entradas    

¿Qué problema de datos podríamos detectar con algo como esto?
if precio <= 0:
    print("Precio inválido")
El error que se puede encontrar en esta instruccion if es que cuando te den el precio siempre te daran un valor que es
positivo por lo que si te dan un valor negativo te dara un valor equivocado

Pregunta de Data Engineering
Explica con tus propias palabras por qué Python complementa a SQL en un proceso ETL.
El lenguaje Python complementa a sql porque con python se puede trabajar con distintas fuentes como archivos de textos, csv json por lo ahi se pueden usar ya consultas en sql dentro de Python para su manipulacion de datos y para poder guardar estos nuevos datos con un nuevo formato y direccion, practicamente Python puede conectarse a bases de datos y ejecutar consultas SQL, mientras que Python también permite trabajar con archivos, APIs y realizar transformaciones y automatización.