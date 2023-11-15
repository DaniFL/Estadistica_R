"De media se pierden 2 kg con el producto homeopático"

X: pérdida de peso en kg de una persona que toma el producto homeopático
E[X] = mu = 2

1) Formular Hipótesis 
  1.1) Hipótesis nula (H0): mu = 2 (punto de partida)
  1.2) Hipótesis alternativa (H1): mu != 2 (lo que quiero probar)
2) Definir estadístico de contraste
  2.1) Estadístico de contraste
    Bajo H0 X ~ N(2, 2.5^2/50) "nos creemos a los homeopatas"
    Para que esto sea cierto hay que asumir asunciones: 
      - Normalidad
      - Independencia
    X ~ N(mu, sigma^2) --> X ~ N(2, 2.5^2) --> X ~ N(2, 2.5^2/50)
    X = 0.037 (media muestral)
3) Calcular P-valor
  3.1) P-valor: Probabilidad de obtener un estadístico (evento) de contraste al menos tan extremo como el observado bajo H0
    p_valor = 2 * pnorm(0.037, mean = 2, sd = sqrt(2.5^2/n)) // 2*prnorm() ya que hay dos colas
4) Tomar decisión (alpha = 0.05 o 0.01 )
  4.1) Si p_valor < alpha --> Rechazar H0
  4.2) Si p_valor > alpha --> No rechazar H0

*Toda hipótesis planteadas deben ser referentes a parámetros poblacionales

