# Notas de la Clase 9

# ¿Qué es la limpieza de datos?
Entendi que la limpieza de datos implica el revisar, corregir, analisar, depurar los datos con errores para poder estar listos para su uso para esto siempre hay un flujo donde obtienes los datos originales, los analisis viendo los errores, les das una limpieza y los pones listos para ser usados estos datos limpios, para esto existen varios metodos en la libreria pandas

# ¿Por qué es importante?
Aprendi que es importante porque los datos erroneos o incompletos pueden causar inconsitencias a la hora de manipularlos con ciertos calculos en los resultados dandonos informacion incorrecta

# Detectar valores nulos
Aprendi importante ubicar valores nulos ya que estos tambien pueden generar resultados inconsistentes para esto estan los metodos df.isnull() o df.isna()

# ¿Qué hacer con los valores nulos?
Entendi que es importante a parte de ubicar los valores nulos, saber que se tiene que hacer con estos valores, ya que dependiendo de como los manejes influira o no en tus resultados puedes rellenarlos con algun valor para contabilizar con el metodo df["columna"].fillna() o simplemente eliminarlos con el metodo df.dropna()

# Detectar registros duplicados
Aprendi que es muy importante identificar tus registros duplicados ya que estos afectaran de manera importante tus resultados para esto esta el metodo df.duplicated() ademas puedes borrarlos con el metodo df.drop.duplicates()

# Limpiar textos
Aprendi que tambien es importante analisar los datos con tipo texto ya que estos nos pueden dar datos duplicados, inconsistencias a la hora de contabilizar o realizar alguna operacion por su contenido en cuanto a si vienen en mayuculas, minusculas con caracteres raros o espacios para esto existen varios metodos como quitar espacios df["columna"].str.strip, para coneyertir todo a minusculas df["columna"].str.lower o para convertir en mayusculas df["columna"].str.upper

# Corregir tipos de datos
Entendi que es muy importante identificar los tipos de datos de tus archivos y poder realizar las correcciones correspondientes de acuerdo a como estes utilizando tus datos y convirticlos ya que esto tambien afectara tus resultados por ejemplo pueden venir numeros pero como tipo caracter para poder saber el tipo de dato puedes usar el metodo df.dtypes y para convertir un a columna puedes usar el metodo df[""].astype(int)

# Trabajar con fechas
Aprendi que es muy importante saber y trabajar con fechas utilizando metodos o corrigiendo su formato ya que a veces trabajaras con estas para obtener datos de diferentes periodos o tiempos, el metodo df["columna_fecha"] = pd.datetime(df["columna_fecha"],dayfirst= True) puede extraer tu fecha por dia mes o año dependiendo de que necesites usar

# Reemplazar valores incorrectos
Entendi que es muy importante una vez identidicado tus datos erroneos,saber como reemplazarlos para que estos sean utilies segun sea el caso para esto temenos el metodo df["columna"].replace() en la cula puedes remplazar uno o varios caracteres o valores numericos

# Filtrar registros inválidos
Aprendi que es importante utilizar filtros de registros segun sea el caso para poder recuperar la informacion que se requiera para esto se tiene que usaar la o las columnas por el cual se va hacer el filtro con su condicion

# Ejemplo completo
En el ejemplo completo pude ver todo el flujo completo desde la extraccion de los datos originales, la tranasformacion donde se analizo y se hace la correcion de los datos en donde se aplica todos los metodos que hemos visto anteriormente como ver la informacion del dataframe, cuantos registros se tienen si hay valores mulos y cuantos se tienen, ver valores dupliciados, convertir tipos de datos y despues realizar los calculos pertinetes o necesariso de lo datos limpios y al final fguardar toda esta tranformacion con un archivo nuevo renombrado tipo csv y direccion especifica

# ¿Qué significa errors="coerce"?
Entendi que el parametro errors = 'coerce' es muy importante a la hora de modificar los datos ya que cambia los datos que no se pudieron modificar por el valor NaN haciendo mas facil la identificacion final de errores en el analisis


