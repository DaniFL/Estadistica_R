# Simular variable aleatoria normal
# X: altura españoles en cm
# X ~ N(170, sd = 10)

# Muestra aleatoria
N =100
sims = replicate(10000, {
  muestra = rnorm(N, 170, sd = 10)
  # Construir un Intervalo Confianza
  confianza = 0.98 # 1-alfa (nivel confianza -> media real este dentro del intervalo que hemos construido)
  significancion = 1 - confianza # alfa
  
  mean(muestra) + qnorm(1 - significancion/2) * 10 / sqrt(N) # lado derecho de la media
  mean(muestra) - qnorm(1 - significancion/2) * 10 / sqrt(N) # lado izquierdo de la media
  
  ic = mean(muestra) + c(-1,1) * qnorm(1 - significancion/2) * 10 / sqrt(N) # intervalo de confianza
  (170 >= ic[1]) && (170 <= ic[2]) # Comprobar si 170 esta dentro del intervalo de confianza
})

mean(sims)


######################

# 1) Cargar los datos: 
library(readr)
pieces <- read_csv("Intervalos_Conf/1-single_normal_cis/data_1/pieces.csv")
pieces = pieces$piece_size_cm
View(pieces)
# X ~ N(5, sd)
# X: longitud de piezas

# 2) Comprobar asunciones del ic 
# 2.1) Normalidad -> histograma
hist(pieces)
# 2.2) Independencia: a) Muestra aleatoria b) Poblacion muy grande comparado con la muestra
# Asumo que el tamaño de la muestra es menor al 10% del tamaño de la poblacion

# 3) Construir un Intervalo Confianza
# Muestra aleatoria
n = length(pieces)
confianza = 0.99
alpha = 1 - confianza
s2 = var(pieces)
qs = qchisq(c(1-alpha / 2, alpha / 2), df = n-1)
ic = (n-1) * s2 / qs
ic

######################

# 1) Cargar los datos:
library(readr)
new_york <- read_csv("Intervalos_Conf/1-single_normal_cis/data_1/new_york.csv")
horas_sueño = new_york$sleep_hours

# 2) Comprobar asunciones del ic
#   Podemos asumir población inf, muestra muy pequeña comparada con la población
#   Normalidad -> histograma
hist(horas_sueño)
# El histograma no es muy normal, pero podemos asumir que la muestra es aleatoria

# 3) Construir un Intervalo Confianza llamando a t.test()
confianza = 0.96
alpha = 1 - confianza
ttest = t.test(horas_sueño, conf.level = confianza)
ttest$conf.int

######################

# 1) Cargar los datos:
library(readr)






