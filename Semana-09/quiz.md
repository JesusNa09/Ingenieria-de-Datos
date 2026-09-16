# Quiz

¿Qué es la limpieza de datos?
Es el analisis, identificacion de datos incorrectos o nulos, modificar o eliminar estos datos, es darle un tratamiento a datos incorrectos para que esten
lo mas correctos a las necesidades requeridas para su presentacion final

¿Por qué es importante en Data Engineering?
Es muy importante porque ayudar a poder mostrar y entregar los datos con mayoe calidad y fiabilidad a la hora de que otros equipos puedan trabajar para obtener
los resultados correctos

¿Qué diferencia existe entre isnull() e isna()?
La diferencia entre estos dos metodos es que isnull() muestra los registros incorrectos o nullos y isna() presenta los registros que presentan ausencia de valor indicados con Nan

¿Qué hace df.isnull().sum()?
Los que hace estos dos metodos es que isnull() muestra los registros nullos o incorrectos y el metodo sum() cuenta lo registros que previamente se identificaron mal por el metodo isnull()

¿Qué hace dropna()?
El metodo lo que hace es eliminar registros si lo combinas con otro metodo eliminara esos registros con esa condicion de metodo que indiques

¿Qué hace fillna()?
Este metodo lo que hace es poner segun el valor que establezcas a los registros que no tienen algun valor generalmente con un 0 numerico o Nan en caracter

¿Qué hace duplicated()?
Este metodo lo que hace es identificar los registros que se encuentra duplicados

¿Qué hace drop_duplicates()?
Este metodo lo que hace es eliminar todos los registros de tu DataFrame que esten duplicados

¿Para qué sirve .str.strip()?
Este metodo lo que hace es quitar los espacios al inicio y al final de tus valores del tipo caracter

¿Qué hace .str.lower()?
Este metodo lo que hace es convertir tus valores de tipo en texto en minusculas

¿Para qué sirve astype()?
Este metodo lo que hace es convertir tus datos de un tipo a otros segun tu establezcas el nuevo tipo de dato

¿Qué hace pd.to_numeric()?
Este metodo lo que hace es convertir tu datos de un tipo a datos del tipo numerico

¿Qué significa errors="coerce"?
Esta parte de codigo lo qu hace es que si algunos datos no se pudieron convertir a tipo numerico este va a forzar esos valores por Nan para poder controlar de mejor manera estos registros

¿Para qué sirve pd.to_datetime()?
Este metodo loq ue hace es convertir datos a tipo fecha

¿Por qué no debemos eliminar automáticamente todos los valores nulos?
No se deden borrar todos los registros con valores nulos porque dependiendo de lo que te soliciten a veces se tendran que contabilizar esos registros cambiandoles
su valor por alguno que se puede leer para obtener los datos o idnicaciones requeridas

¿Qué significa que una limpieza forma parte de Transform?
Significa que en un proceso ETL la parte en la que se realiza toda la modificacion y manipulacion de los datos se encuentra en el punto de Transformacion

Explica este proceso:
ventas_sucias.csv
        ↓
pd.read_csv()
        ↓
DataFrame
        ↓
Detección de nulos
        ↓
Eliminación de duplicados
        ↓
Conversión de tipos
        ↓
Validación
        ↓
Creación de total
        ↓
ventas_limpias.csv

¿Qué parte corresponde a Extract?
La parte de la extraccion corresponde desde que ves el tipo de archivo que se leera, la parte en la que la lees y la parte en la que conviertes tus datos en un DataFrame
ventas_sucias.csv
        ↓
pd.read_csv()
        ↓
DataFrame
        ↓
En general es donde obtienes los datos de tus archivos

¿Qué parte corresponde a Transform?
La parte que corresponde a la transformacion es la parte en la que detectas los valores nulos, eliminas los valores duplicados, realizas la conversion de datos, realizaz la validacion y la creacion de tus columnas que necesites 
Detección de nulos
        ↓
Eliminación de duplicados
        ↓
Conversión de tipos
        ↓
Validación
        ↓
Creación de total
En general es donde realizas toda la manipulacion de datos para poder presentarlos de manera confiable con los datos que y resultados correctos

¿Qué parte corresponde a Load?
Es la parte donde cargas ya tus datos con la limpieza aplicada anteriormente 
ventas_limpias.csv
En general es cuando muestras tus datos ya con una limpieza y manipulacion hecha previamente