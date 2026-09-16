# Python (Pandas)

## Missing data
Aprendi que en los archivos con los que se trabaje a veces vendran los datos o registros faltantes por lo que es muy importante identificarlos y saber como trabajar con ellos, depende de como se requiera se pueden eliminar o modificar segun el requerimiento o darles un tratamiento para modificarlos y poderlos usar

## Duplicate Labels / Duplicate Data
Aprendi que mucahs veces tambien vendran datos con valores duplicados afectando tambien al analisis o resultados por lo que es importante encontrar estas filas duplicadas para esto usamos el metodo df.duplicated() para poder encontrar los registros que tienen filas duplicadas

## Text data
Aprendoi que se puede trabbajar con los datos de tipo caracter ya que vendran varios archivos que no tendran el formato de los carateres qeu deseamos o vendran con 
caracteres especiales espacios para esto se tienen varios metodos para poder manipular estos datos de tipo caracter por ejemplo se puede usar df["columna"].str.upper
para convertir todo el texto en mayusculas , df["columna"].str.lower para trabajar con minusculas, df["columna"].str.strip para quitar espacios que tienen atras y adelante, tambien hay otros metodos para quitar solo espacios del lado izquierdo o derecho, o se puede usar el metodo replace para modificar algunos datos del dataframe analizado df["columna"].replace("dato","dato_corregido"
)
## Working with missing data
Trabajar con datos faltantes es muy importante para poder obtener los resultados para esto usamos los metodos df.dropna() en caso de que deses eliminar la fila con datos faltantes, tambien esta el metodo df.fillna con este podras rellenar el dato que tu establezcas con registros donde falten datos y con el metodo df.isnull() te ayuda a identificar valores nulos o faltantes , todo esto es importante para poder obtener tus datos correctos

## Conversion de tipos
Aprendi que muchas veces es importante identificar los datos de tu DataFrame para poder trabajar de una manera eficiente con los datos , para esto hay 
varios metodos para identificar tus tipos de datos y tambien algunos para poder convertir el tipo de dato al que se necesite

## Time series / DateTime
Aprendi  que trabajar con fechas en la manipulacion de archivos es muy importante porque tal vez tienes que obtner cierta informacion o calculos de ciertas fechas 
para esto existen muchos metodos para poder trabajar con fechas , algunas para poder estraer las fechas otras para obtener las fechas reales dependiendo de la region
donde estes y tambien peudes convertir datos que tienes como fecha de cadena a formato fecha , para esto se usan algunos metodos como df["columna"].dt.year para 
obtener el año o df["columna"].dt.month para obtener el mes y df["columna"].dt.day