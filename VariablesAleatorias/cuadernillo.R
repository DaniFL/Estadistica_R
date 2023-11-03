# Ejercicio 30 

# R: radio producido al tirar manivela
# N: nº piezas con un radio entra ... en 500 piezas

# R~N(10, s^2= )
# N~B(500, P(7.5 < R < 11))
# Es binomial ya que existe un exito (pieza entre rango de radio) fracaso (pieza no este en ese rango), además cada fabricación de pieza es independiente 
# a) E[N] (esperanza) = casos * p = 500 * P(7.5 < R < 11)

# P(7.5 < R < 11) = F(11) - F(7.5) = pnorm(11, 10, sd = 2) - pnorm(7.5, 10, sd = 2)
esperanza_n = 500 * pnorm(11, 10, sd = 2) - pnorm(7.5, 10, sd = 2)
