# Notas de videos 9

# Pandas Data Cleaning Tutorial
Aprendi que la biblioteca pandas tiene muchos metodos para hacer limpieza de datos, esta se realiza en su mayoria para poder de los datos originales, analizar, corregir, rellenar o quitar datos duplicados o que vienen en nulos, ademas de modificar o reemplazar algunos conceptos dependiendo de lo solicitado,o trabajar con 
fechas, o trabajar con tipos de valores para convertirlos a los solicitados, algunos metodos son df.dropna, df.duplicates(), df.isnull(), df["columna"].str.lower
df["columna"].str.upper , df["columna"].str.strip, df["columna"].astype(int),df["columna"].replace()

# Pandas Missing Values
Aprendi que en los valores que nos manden , habran registros que no contenggan ningun valor para esto existen varios metodos como el isnull() para encontrar 
los registros nu nulos o simplemente replace con el valor a corregir enseguida del valor por el cual se sustituira

# Pandas Drop Duplicates
Aprendi que es muy importante identificar tus valores duplicados al momentode analizar los datos ya que este afecta de manera grande a tus resutltadoss
para esto esta el metodo df.duplicated() y a este lo peuedes sumar para ver cuantos valores nulos tienes o eliminar directamente con el metodo .drop()
ademas puedes borrar por columna , seleccionando varias columnas o de toda la tabla

# Pandas String Methods
Aprendi que al momento dee trabajar con datos de tipos carcater existen varios metodos , covertir tus valores de la columna a mayusculas o minisculas, 
remplazar algun concepto dentro de tu columna o varias por otras 

# Pandas Convert Data Types
Aprendi como cambiar el tipo de dato en mi Data Frame, ya que varios datos de los archivos siempre vendran en diferentes formatos algunos registros , para esto 
se unsa un metodoe en el cual se puede cambiar toda una columna o todas las columnas al tipo de dato que necesites df["columa1"] = df.["columna1"].astype("int")

# Pandas DateTime
Aprendi que la biblioteca pandas puede trabajar con fechas, pude observar como extraer fechas si se tiene que trabaajr por periodos de dias mes o años ademas de como
convertir datos de tipos cadenas a fechas para esto estan los metodos anio = objeto_fecha.year para año , mes = objeto_fecha.month para mes y dia = objeto_fecha.day para el dia