# Ejercicios cuadernillo probabilidad

 
# Ejercicio 16

'''
 a tarjetas blancas y b tarjetas negras se barajan conjuntamente.
   a) Calcular la probabilidad de que la primera tarjeta blanca está en la posición k.
   b) En general, calcular la probabilidad de que la i- ́esima tarjeta blanca ocupe la posición k.
'''
 
#   a Blancas
#   b negras 
#   P(primera blanca en pos k)

# Elementos repetidos 
# Importa orden

# a = 3
# b = 4

# P(encontrar A por 1ª vez en pos 4) 
# Casos Totales (MISSISIPPI)

casostot = choose(7, 3) # choose(a+b/a)
# 7!/(3!*4!) = choose(7, 3) = choose(a + b / a)

# Casos Favorables

# 1) B/B/B/A/./././ (1ªA en pos 4)
# 2) Completar 3 posiciones restantes (tengo 1B y 2A) --> 3!/(2!*1!) = choose(3,1)

casosfav = choose(3,1) # choose((b + b - k)/(a - 1))

# Aplicando Laplace: Casos Fav / Casos Tot

a = casosfav/casostot # ==> choose((b + b - k)/(a - 1)) / choose(a + b / a)

# longitud total = b + a - k
# nº de As = a - 1
# nº de Bs = b-(k-1)

function(k, a, b){
  
}
  
# ------------------------------------  
  # Elementos distintos (no repetidos)
  # Importa orden 
 
# Casos Totales 
#   (a+b)! (Permutación)

# Casos Favorables
#   1) Prerrelleno con restricción
#       B/B/B/A/././.
#   2) Decido apellido de A: a formas
#      Decido apellido para (k-1)Bs: (Ejercicio Podio - VARIACIÓN) --> Var(b, k-1)
#   3) Ordenar resto de elementos (Permutación): Me quedan (a + b - k) elementos
#       (a + b - k)!

# Resultado: 

# = (a * Var(b, k-1) * (a + b - k)!) / (a+b)!

ejercicio_16 = function(k, a, b){
  casos_t = factorial(a+b)
  casos_f = ((a * var(b, k - 1)) * factorial(a + b - k))
  casos_f/casos_t
}

factorial(5)

a = 3
b= 4
k = 4
casos_t = factorial(a+b)
casos_f = (a * var(b, k - 1) * factorial(a + b - k))
casos_f/casos_t

#  Ejercicio 51

'''
En una fiesta, cada individuo tiene una copa con su nombre. Snedecor deja su copa sobre una mesa
libre y, tras un rato, se encuentra con que encima de la mesa hay n copas y que ya no sabe cuál es la
suya. Snedecor tiene que ir mirando una por una cada copa para ver cuál es la suya (con cuidado de
ir apartando las copas que ya ha comprobado). Sabiendo que con una probabilidad p la copa se la ha
llevado previamente otra persona por error, razona detalladamente cuál es probabilidad de que Snedecor
compruebe más de k copas (si Snedecor encuentra su copa al k-ésimo intento este no sería un “suceso exitoso”
porque no ha comprobado más de k copas). Pista: razona por casos.
'''

# Importa orden 
# Elementos repes

# n = 8 copas

# Casos Totales

factorial(8)/factorial(7)

# Casos Favorables

#   1) Restricción
#        X/X/X/X/././././
#   2) Pongo Tick: 4 Opciones 
#        n-k

# P(<4) = p + (1-p) * (4/8) --> P(<k) = p + (1 - p) * ((n - k) / n)

# Ejercicio 31

'''
En una competición al mejor de 7, el primer equipo que llegue a 4 victorias gana. 
Suponemos que en cada partido el equipo A gana de forma independiente con probabilidad "p."

  a) Si un equipo va ganando 3 a 0, ¿cuál es la probabilidad de que sea el equipo A el que va ganando?
  b) Si un equipo va ganando 3 a 0, ¿cuál es la probabilidad de que sea este equipo el que gane la competición?
  c) Si p es igual a 1/2, ¿cuál es la probabilidad de que el equipo que gane el primer juego gane la competición?
'''

# a) 

# pa = P([AAA] | [AAA] U [BBB]) = P({AAA} & {AAA, BBB}) / P({AAA, BBB}) = P({AAA}) / P({AAA, BBB}) = P^3 / P({AAA} U {BBB}) = P^3 / P ^3 + (1-P)^3

# b) 

# P(A gane al menos 1 partido) "Al menos" --> suceso complementario = 1 - P(A no gane ninguno) = 1 - P(B gane todos) = 1 - (1-p)^4
# pb = (1-p)^3
# Resultado = pa * (1 - (1-p)^4) + pb * (1-p)^4 



# Ejercicio 18 

'''
Se lanzan dos monedas y se tira un dado tantas veces como caras se hayan obtenido.

 a) Halla la probabilidad de que la suma de las puntuaciones sea 6.

 b) Si sabemos que el resultado del juego es que los dados han sumado 6, ¿cuál es la probabilidad de haber obtenido 0 caras, 1 cara o 2 caras?
'''

