# Notas de la Clase 8

# ¿Qué es Pandas?
Entendi que es una biblioteca en python que seirve para poder manipular y trabajar con datos

# ¿Por qué necesitamos Pandas?
Entendi que necesitamos de esta biblioteca porque es mas facil trabajar con la manipulacion de datos y eficiente a la hora de leer los datos

# ¿Qué es un DataFrame?
Es una estructura de datos bidimensional 

# Crear un DataFrame
Aprendi que para crear un dataframe primero se llama a la biblioteca import pandas as pd y luego ya se puede leer y trabajar con esa variable 
desde abrir, modificar y gurdar ese archivo con un df = pd.Data.frame(aqui va tu archivo o lista)

# Leer CSV
Aprendi que para leer un archivo csv se utiliza la instruccion pd = df.read_csv(nombre de tu archivo csv) y convierte este archivo en dataframe

# Ver los primeros registros
Aprendi que para ver como vienen los datos con los que trabajaras se utiliza la instruccion df.head()

# Ver los últimos registros
Aprendi que para ver los ultimos registros de tu archivo o documento con el que estes trabajando se usa df.tail()


# Conocer las dimensiones
Aprendiq que para ver como esta estructurado tu archivo en cuanto a filas y columnas en cuanto a su cantidad podemos usar la instruccion df.shape() 


# Ver los nombres de columnas
Aprendi que para ver los nombre de las columnas de mi dataframe se utiliza el comando df.columns


# Información general
Entendi que con la instruccion df.info() podemos ver a detalle nuestro dataframe sus columasn , tipos de datos, como vienen esos datos


# Estadísticas básicas
Aprendi que para la manipulacion de datos usaremos varias funciones como max() , min () , coun() para obtener ciertos calculos 


# Seleccionar una columna
Aprendi que para seleccionar una columna se usa la instruccion  df [ventas]


# Seleccionar varias columnas
Aprendi que para seleccionar varias columnas se usa la instruccion del dataframe seguida de las columnas a usar df['ventas', 'total']


# Filtrar datos
Aprendi que en python tambien se puede trabajar con condiciones con los Dataframe en el cual pides cierta informacion usando tu variable 
y columnas por ejemplo df=[[df="precio"] >1000]


# Crear una columna
Aprendi que en python se puede trabajar con columnas de tu Dataframe creando nuevas columnas con los datos que pongas para esta columna
para esto se usa df["total"] = df ["cantidad"] * df["precio"] con esto ya hay una tranformacion de datos

# Modificar una columna
Aprendi que en python puedes modificar tus columnas del Dataframe como por ejemplo df["precio"] = df["precio"] * 1.16
Este seria un ejemplo de modificar una columna agregandole el iva


# Eliminar una columna
Aprendi que en python se pueden eliminar columnas del Dataframe por ejemplo
df = df.drop(columns=["Total"])


# Valores nulos
Aprendi que en python a la hora de manipular los datos de tus fuentes como archivos se trabajan con los valores nullos con la biblioteca
de pandas con la instruccion df.isnull() o df.isna()


# Guardar un DataFrame
Aprendi que en python se pueden guardar las tranformaciones y manipulaciones que hagas de los datos en tu Dataframe que hayas realizado, esto tambien en formato que tu hayas elegido de los que puede utilizarse en python por ejemplo df.to_csv("ventas_procesadas.csv" , index=False)


# La conexión con SQL
Entendi que tanto en python como en sql existe un parecido ya que en los dos lenguajes se puede trabajar con la manipulacion de datos, solo
cambian la sintaxis para poder manipular estos datos y las fuentes de donde se obtendran los datos para poder trabajar