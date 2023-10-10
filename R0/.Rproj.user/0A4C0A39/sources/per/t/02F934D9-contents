#' ## Caída de las criptomonedas
#' Durante el año 2022 todas las criptomonedas perdieron gran parte de su valor. 
#' En este *notebook* cuantificaremos y visualizaremos esta caída.
#'
#'Puedes cargar los datos con...

crypto_large = read.csv("crypto.csv")

#' ### Ejercicio 1
#' El data.frame cargado consiste en:
#' 
#' * `unix_time`: es una forma de medir el tiempo relacionada con el sistema operativo
#' Unix. Mide el tiempo pasado desde el 1 de enero de 1970.
#' * `candlestick_low, high, open, close`: precios mínimo, máximo, de apertura y cierre
#' de la criptomoneda para para un día concreto (en dólares). Estos precios se emplean para 
#' hacer "análisis de velas" (si te interesa invertir, puedes leer más [aquí](https://www.investopedia.com/trading/candlestick-charting-what-is-it/). 
#' * `USD_volume`: cantidad de criptomoneda que se ha cambiado a dólares americanos.
#' * `crypto`: nombre de la criptomoneda. 
#'
#' Simplifica el data.frame quedándote con las columnas: `unix_time`, `candlestick_high`, 
#' `candlestick_low` y `crypto`. Simplifica los nombres `candlestick_xxxx` a `high` y `low`.
#' 

View(crypto_large)
new_crypto = crypto_large[ , c(1:3, 7)] 
colnames(new_crypto)[2:3] = c("low", "high")

#'
#' ### Ejercicio 2
#' Para mejorar la legibilidad de las fechas, transforma `unix_time` a una fecha 
#' estándar (yyyy-mm-dd) usando la función `as.POSIXct`. Fíjate que tendrás que 
#' especificar el origen del tiempo usando: `as.POSIXct(?????????, origin = "1970-01-01")`.
#' Guarda las fechas resultantes en una nueva columna `date` del data.frame.
#' 

new_crypto$date = as.POSIXct(new_crypto$unix_time, origin = "1970-01-01")

#' Ejercicio 3
#' Dibuja los precios máximos de las criptomonedas Bitcoin ("BTC") y Ethereum ("ETH")
#' en una misma gráfica. Intenta que la gráfica sea lo más agradable posible añadiendo
#' leyenda, título, etc.

eth = new_crypto[new_crypto$crypto == "ETH", ]
btc = new_crypto[new_crypto$crypto == "BTC", ]
#max_eth = max(eth$high)
#max_btc = max(btc$high)

plot(
        eth$date, log(eth$high),
        type = 'l',
        col = 3,
        xlab = 'Time',
        ylab = 'Price',
        ylim = c(7, 15),
        main = 'Cryptos ETH / BTC'
     )

points(
        btc$date, log(btc$high), 
        type = 'l',
        col = 2,
)

legend('topright', c('ETH', 'BTC'), col = c(3, 2), lty = 1)

#' ### Ejercicio 4
#' Dibuja el valor de todas las criptomonedas usando un bucle *for*. Además, dado
#' que los valores de las monedas son muy distintos (ver gráfica anterior), emplea
#' la escala logarítmica en el eje y (simplemente dibuja `log(high)` en lugar de 
#' `high`; ¡este es un truco muy útil para dibujar valores que tienen escalas 
#' muy distintas!).

doge = new_crypto[new_crypto$crypto == "DOGE", ]
ada = new_crypto[new_crypto$crypto == "ADA", ]

criptomonedas = c("BTC", "ETH", "DOGE", "ADA")
col_counter = 1
for (monedas in criptomonedas){
        crip = new_crypto[new_crypto$crypto == monedas, ]
        if(col_counter == 1){
                plot(
                        crip$date, log(crip$high),
                        type = 'l',
                        xlab = 'Time',
                        ylab = 'Price',
                        col = col_counter,
                        ylim = c(-5, 15),
                        main = 'Cryptos'    
                )
        }else{
                points(
                        crip$date, log(crip$high),
                        type = 'l',
                        col = col_counter
                )
        }
        col_counter = col_counter + 1
        
}
legend('topright', legend = criptomonedas, col = 1:length(criptomonedas),
               lwd = 2)

#' 
#' ### Ejercicio 5
#' Crea una función llamada `calculate_drop` que reciba un data.frame sobre
#' criptomonedas y el nombre de una criptomoneda. La función debe calcular qué
#' fracción de su valor máximo ha llegado a perder una moneda. Para ello, 
#' calcula diferencia entre el valor máximo de `high` y el valor mínimo de `low`, y
#' divide esta diferencia por el valor máximo de `high`:
#' $$\frac{\max{(high)} - \min{(low)}}{\max{(high)}}.$$

#' Esta función nos ayudará a calcular cuánto valor a perdido cada divisa. Usa
#' `sapply` para aplicar la función a cada moneda. ¿Qué moneda ha perdido más valor?

calculate_drop = function(df3, moneda){
  data_crypto = df3[df3$crypto == moneda, ]
  volatilidad = (max(data_crypto$high) - min(data_crypto$low)) / max(data_crypto$high)
}

ej5 = sapply(criptomonedas, calculate_drop, df3 = new_crypto)
print(ej5)
