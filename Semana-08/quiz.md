# Quiz

¿Qué es Pandas y por qué es útil para Data Engineering?
Es una biblioteca del lenguaje python y es utili para los Data Engineering
ya que les permite manipular y trabajar con datos de diferentes fuentes
como arvhicos csv, json , txt

¿Qué es un DataFrame?
Es una estructura bidimensional de datos, es una representacion de los datos
 

¿Qué es una Series en Pandas?
Es una estructura de datos, es una manera de alamacenar los datos para 
posteriormente ser utilizados


¿Qué hace pd.read_csv()?
Es un metodo en la biblioteca pandas que te va a permitir leer archivos
tipo csv como un DataFrame

¿Qué información podemos obtener con df.shape?
Este metodo en python te permite saber el numero exacto de tus columnas y
filas dentro de tu DataFrame 

¿Para qué sirve df.info()?
Este metodo en padnas que te permite obtener informacion dentro de tu DataFrame
como el total de registros, si tienes valores nullos tus columnas  

¿Qué diferencia existe entre:
df["precio"]
y:
df[["producto", "precio"]]
La diferencia que existe entre estas dos instrucciones dentro de python 
es que en la primera solo se esta seleccionando una columna y en la 
segunda instruccion se estan seleccionando dos columnas 

8¿Qué hace este código?
df[df["precio"] > 1000]
Esta parte del codigo en pandas lo que hace es que filtra los registros para la
columna de precio devolviendo solo lo que tengan un precio mayor a 1000

¿Qué hace este código?
df["total"] = df["cantidad"] * df["precio"]
Este codigo en pandas los que hace es una tranformacion de datos de tu DataFrame
ya que multiplica las columnas de cantidad y precio y el resultado lo asigna a una
nueva columna creada llamada total

¿Para qué sirven isnull() o isna()?
Estos dos metodos dentro de tu DataFrame es indicarte los registros con valores
nullos

¿Qué hace?
df.to_csv("resultado.csv", index=False)  
Este frafmento de codigo lo que hace es guardar tu proceso de transformacion de datos o todo lo que hayas realizado
en un nuevo archivo con formato csv 

¿Cuál es la relación entre un DataFrame de Pandas y una tabla de una base de datos?
La relacion que existe entre trabajar con pandas y la base de datos es en como se estan presentando los datos para que puedas realizar
la manipulacion y transdormacion de estos al igual que algunas de las instrucciones con las que los manipulas solo cambia la sintaxis 
dependiendo del lenguaje que uses

Explica la diferencia entre procesar un CSV utilizando csv.reader y utilizar Pandas.
La direncia entre usar estas dos formas de manipulacion y transformacion de datos es la forma en como utilizas tu codigo en python ya que las dos formas
cuentan con diferentes codigos para poder manejar los datos aunque no en todos los casos como el ciclo for

¿Por qué la detección de valores nulos es importante en un proceso de datos?
La deteccion de los valores nulos a la hora de manipular datos o transformalos es muy importante ya que estos en conjunto pueden afectar o dar algun
resultado muy diferente por lo que es importante identificarlos ademas por la calidad de la informacion 

Pregunta de Data Engineering
Explica este proceso:
ventas.csv
    ↓
pd.read_csv()
    ↓
DataFrame
    ↓
Validación
    ↓
Transformación
    ↓
ventas_procesadas.csv
El proceso del ejemplo anterior lo que esta haciendo es en primer lugar tener un archivo en formato csv posterior a eso lo esta leyendo y transformando en un DataFrame
con la siguiente instruccion en el siguiente paso ya esta convertido en un DataFrame listo para trabajar con ese arhivo en python , despues se realiza una comprobacion
de los datos para ver que vengan bien sin faltantes o con valores no permitidos o erroneos dandoles alguna limpieza, despue en el siguiente paso se le realiza un tratamiento
con esto hacemos referencia a que se tranforman los datos dependiedo de los requerimientos o tareas especificas que se necesiten y por ultimo se guarda todo ese proceso
realizado desde su limpieza y transormacion de datos en un nuevo archivo con fomrato csv 

¿Qué parte corresponde a Extract y qué parte corresponde a Transform?
La parte que corresponde al extract abarcan los puntos desde que lee el documnento hasta que realiza la validacion de los datos y la parte de Transform
es la parte solaamente donde realiza la transformacion de los datos 