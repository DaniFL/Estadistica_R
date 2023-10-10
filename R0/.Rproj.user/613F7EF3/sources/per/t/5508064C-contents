#' El objetivo de este cuaderno es hacer una introducción práctica a R mediante
#' la resolución de un problema motivante. Intentaremos descargar datos de 
#' del número de casos de Covid-19 por país y comparar la evolución de la pandemia
#' entre distintos países. Algo similar al fichero objetivo_final.png.
#'


#' Sección 1: Lectura de datos, tipos de datos e indexación
#' ===============================================================================
#' * Problema ilustrativo: Descargar datos de Covid-19 por país.
#' * Temas: tipos de datos
#' * Sección del tutorial: (http://htmlpreview.github.io/?https://github.com/constantino-garcia/impatient_r/blob/master/impatient_r.html)
#' "Beyond numbers and data types"-"Formulas" (incluidas)
#'

#' ### Ejercicio 1.a
#' La siguiente tabla muestra los casos de covid en 2020 por país.
#' 
# Alemania Italia Portugal España
# 1337078 1843712 348744 1730575
#' 
#' Explora diferentes opciones para almacenar datos en R. Además, explora cómo
#'  extraer los datos de Portugal y España de la estructura de datos "global".


library(readr)
covid <- read_csv("covid.csv")
View(covid)

#' **versión 1**
countries = c("Germany", "Italy", "Portugal", "Spain")
cases = c(1337078, 1843712, 348744, 1730575) 
table1 = cbind(countries, cases)
print(table1)


#' Para obtener el subconjunto de Portugal (veremos mejores opciones más adelante)
countries[3]
cases[3]

#' Para obtener el subconjunto de España (veremos mejores opciones más adelante)
countries[4]
cases[4]
    
#' Para obtener el subconjunto de Portugal y España (veremos mejores opciones más adelante)
countries[3:4]
cases[c(3, 4)] # Fíjate en las diferentes formas de construir el vector 3,4


#' **versión 2**: para mejorar lo anterior...
print(cases)  
#' ... vamos a vincular countries con cases
names(cases) # Ahora mismo está vacío: NULL
names(cases) = countries # asignamos nombres a los slots del vector
print(cases)

#' ¡Ahora la variable países ya no es útil porque los slots se pueden indexar
#'  tanto con números como con nombres!
# Casos de Portugal:
cases["Portugal"]
cases[3]

# Casos de España:
cases["Spain"]
cases[4]

# Tanto Portugal como España:
cases[c("Spain", "Portugal")]
cases[c(3,4)]
cases[3:4]

#' ¡Una nota avanzada! Realmente existen dos operadores de indexación en R: [[]] y []
#' El operador [[]] solo funciona con índices de longitud 1 e intenta "simplificar"
#' la estructura resultante

#' Compara:
cases[["Spain"]]
cases["Spain"]

#' Esto no funciona:
# cases[[c("Spain", "Portugal")]]

#' Para lo siguiente, restablezcamos el vector de casos al original.
names(cases) = NULL
print(cases)

#' **versión 3**: Hay otras opciones para unir
#' países y casos. Es posible que conozca las listas, pero no las explicaremos aquí.
#' En estadística, usaremos data.frames:

df = data.frame(
    "nombre" = c("Juan", "Alicia"),
    "apellidos" = c("García", "Pérez")
)
print(df)
#' ¿Como crearías un data.frame con columnas llamadas 'nombre_del_pais' y 'numero_de_casos'?
df1 = data.frame(
  "nombre_del_pais" = c("Germany", "Italy", "Portugal", "Spain"),
  "numero_de_casos" = c(1337078, 1843712,  348744, 1730575)
)
print(df1)

#' Los data.frames tienen dos dimensiones: filas y columnas. Por lo tanto, para 
#' extraer datos tenemos que usar dos índices. Por ejemplo, extraigamos el 
#' número de casos de Portugal.
df1[3, 2]
df1[3, ]

#' ¿Cómo extraerías los casos para España?
df1[4,2]
df1[4, ]

#' Para hacer más evidente que los datos se refieren a Portugal o España puedes
#' seleccionar toda la fila:
df1[3, ] # Portugal
df1[4, ] # Spain

#' El truco del "no-índice" también funciona para columnas
df1[, 1] # todos los países
df1[, 2] # todos los casos

#' Sin embargo, acceder a las columnas es tan útil (lo veremos más adelante) que
#' se puede usar la sintaxis $
df1$nombre_del_pais # países
df1$numero_de_casos # casos

#' Esta sintaxis es más legible que usar df[, 1]. Para hacerlo aún mejor es
#' es una buena idea utilizar nombres cortos y significativos. Cambiemos los 
#' nombres de las columnas de df para hacerlos más cortos:
colnames(df1) = c("pais", "casos") 
print(df1)

#' ### Ejercicio 1.b
#' Carga datos del CSV "covid.csv" y crea un nuevo data.frame con las siguientes columnas:
#'  day, moth, year, cases, deaths, contriesAndTerritories, Cumulative...
#' Además, dado que los nombres son bastante largos, cambia el nombre de los dos últimos a 
#' 'country' y 'cumul_rate'. El data.frame resultante debe llamarse new_data.

library(readr)
data = read.csv("covid.csv")
new_data = data[ ,c("day", "month", "year", "cases", "deaths", "countriesAndTerritories", "Cumulative_number_for_14_days_of_COVID.19_cases_per_100000")]
View(new_data)
# Ejemplo para coger todas las columnas
new_data2 = data
View(new_data2)

colnames(new_data)[6:7] = c("Countries", "Cumul_rate")
colnames(new_data2)[7:12] = c("Countries", "Cumul_rate")

# Correccion clase: 
data = read.csv("covid.csv")
new_data3 = data[ , c(2:7, 12)]

# ===============> Puedes intentar ahora crypto-1

#' ### Ejercicio 2
#' Como queremos dibujar el número de casos en función del tiempo, necesitamos 
#' una nueva columna. ¿Por qué? Considera qué variable se debe utilizar para
#' el eje x del gráfico,
#' ¿día?, ¿mes?, ¿año?. Usar solo una de estas variables no va a funcionar...
#' Debemos usar estas tres variables para crear una nueva variable llamada 'time'
#' que cuenta aproximadamente el número de días desde principios de 2019.
#' Utiliza la fórmula: 
#' $$day + (month - 1) * 30 + (year - 2019) * 365$$
#' (hay una manera mejor, pero ese no es el objetivo del ejercicio).
#' Luego elimina las columnas 'day', 'month' y 'year' del data.frame resultante.

new_data$time = new_data$day + (new_data$month - 1) * 30 + (new_data$year - 2019) * 365
with(covid, day + (month - 1) * 30 + (year - 2019) * 365)

#eliminamos las columnas day, month y year
new_data$day = NULL
new_data = new_data[ , c(-1, -2)]
# EJEMPLO: new_data2 = new_data[ , c(-1,-2,-3)]

#AÑADIR COLUMNAS A DATA.FRAME:
#new_data$nombrecol = 0 o valor de la variable

# ================> Ahora que sabes crear columnas puedes intentar crypto-2

#' Sección 2: indexación lógica y gráficos
#' ===============================================================================
#' * Problema ilustrativo: dibujemos la variable 'cumul_rate' en función del tiempo 
#' para varios países (digamos España y Portugal), para que podamos comparar sus situaciones epidemiológicas.
#' * Temas: lógica e indexación lógica, gráficos.
#' * Secciones del tutorial: Beyond numbers-formulas (both included), Simple graphics in R
#'

xxx = c("A", "B", "C", "D")
xxx == "B"
xxx[xxx == "B"]

#' ### Ejercicio 3 
#' Dibuja la variable 'cumul_rate' frente al 'time' tanto para España como para
#' Portugal. Procede como sigue:
#'
#' 1) crea un data.frame con los datos de España (nómbralo 'spain') y luego
#' crea otro de Portugal ('portugal').
#' 2) Utiliza la función 'plot'.
 
spain = new_data[new_data$Countries == "Spain", ]
portugal = new_data[new_data$Countries == 'Portugal', ]

# Especificamos un ylim grande para que los datos de Portugal quepan en el plot
plot(
    spain$time, spain$Cumul_rate, 
    type = 'l', 
    xlab = 'Days from 1/1/2019',  
    ylab = 'Cumulative rate',
    main = 'Covid-19', 
    ylim = c(0, 1000)
)
# points añade un nuevo gráfico a uno ya existente. lty significa tipo de línea (line type)
points(
    portugal$time, portugal$Cumul_rate, 
    type = 'l', 
    col = 2, 
    lty = 2
)
# ¡Es una buena idea usar leyendas!
legend('topleft', c('Spain', 'Portugal'), col = c(1, 2), lty = c(1, 2))

# ================> Ahora que sabes hacer plots puedes intentar crypto-3

#' Sección 3: bucles
#' ===============================================================================
#' * Problema motivador: dibujemos la variable 'cumul_rate' frente al 'time' para 
#' una gran lista de países sin duplicar código!
#' * Temas: bucles
#' * Secciones del tutorial: Programming
#' 
#' ### Ejercicio 4
#' Dibujemos la variable 'cumul_rate' contra el 'time' para
#' los siguientes países: Spain, Portugal, Italy, France, Germany.
#' ¡Usa un bucle for/ while!
#'
countries = c("Spain", "Portugal", "Italy", "France", "Germany")
# col_counter significa "contador de color" y se usa para cambiar los colores y
# estilos de línea (lty; line-type) para los distintos plots
# and line styles of the plots. También incrementaremos el grosor de la línea a
# 2 (lwd; line-width)

col_counter = 1
for (country in countries) {
    plot_data = new_data[new_data$Countries == country, ]
    if (col_counter == 1) {
        plot(
          plot_data$time, plot_data$Cumul_rate,
          xlab = 'Days from 1/1/2019',  
          ylab = 'Cumulative rate',
          lty = 1,
          lwd = 2,
          type = "l",
          #xlim = c(0,max(plot_data$time)),
          #ylim = c(0,max(plot_data$Cumul_rate)),
          main = 'Ejercicio 4')
    } else {
        points(
          plot_data$time, plot_data$Cumul_rate,
          lty = 1,
          type = "l",
          lwd = 2,
          col = col_counter)
    }
    col_counter = col_counter + 1
}
legend('topleft', legend = countries, col = 1:length(countries),
         lwd = 2)

# ================> Ahora que sabes hacer fors puedes intentar crypto-4

#' 
#' Sección 4: funciones, paquetes y alcance
#' ===============================================================================
#' * Problema ilustrativo: Calculemos el número total de casos desde el
#' inicio de la recopilación de datos para los países anteriores. Esto debe ser almacenado
#' en un nuevo data.frame/vector. Luego, imprimamos la información usando algún ASCII-art.
#' * Temas: funciones, scoping, paquetes, apply
#' * Secciones del tutorial: Functions, packages, scoping
#' 

my_sum = function(x, y) {
  z = x + y
  return(z)
}
# Versión mejorada
my_sum2 = function(x, y) {
  x + y
}

#' ### Ejercicio 5
#' Utiliza una función y sapply para calcular el número total de casos desde el
#' inicio de la recopilación de datos para los países anteriores. Esto debe ser almacenado
#' en un nuevo data.frame/vector. 

count_cases_in_country = function(df, country) {
    data_by_country = df[df$Countries == country, ]
    sum(data_by_country$cases)
}

#' Opción 1) con bucles

countries
results = c()
for (country in countries) {
    new_result = count_cases_in_country(new_data, country) 
    results = c(results, new_result) #añado nueva informacion al vector en cada vuelta del bucle
}
names(results) = countries #slots
print(results)

#' Opción 2) funciones de apply!

results2 = sapply(countries, count_cases_in_country, df = new_data)
print(results2)
print(countries)

#' Opción 3) Funciones lambda (Avanzado!)

results3 = sapply(
    countries, 
    function(country) {
        data_by_country = new_data[new_data$Countries == country,] 
        (sum(data_by_country$cases))
    }
)
print(results3)

# ===============> Ahora que conoces sapply puedes hacer crypto-5

#' ### Ejercicio 6
#' Imprime la informacíón del ejercicio anterior
#' usando la función say del paquete 'cowsay' para que la información la proporcione
#' un tiburón (¡debes mirar la documentación!)
#'

install.packages("cowsay")
library('cowsay') # Recuerda instalarlo antes con install.packages("cowsay")
for (country in names(results)) {
    msg = paste("The number of cases in", country, "is", results[country])
    say(msg, by = "")
}

#library(help = 'cowsay')
#cowsay::say("Hola sara")


#' ### Ejercicio 6
#' Instala los paquetes tidyverse y easystats, que usaremos
#' durante el curso. ¡Esto puede llevar bastante tiempo!

install.packages("tidyverse")
install.packages("easystats")
