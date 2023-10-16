#X: nº de caras en n lanzamientos 
#distribución de la VA X: P(X=x)

p_x = function(x, n){
  choose(n, x) /(2^n)
}

n= 100
xs = 0:100
ps = p_x(xs, n)
plot(xs, ps, type = "h", ylab = "aa", xlab ="BB" )

# No sean equiprobables

p_x2 = function(x, n, p){
  ejercicio = choose(n,x) * p^x *(1-p)^(n-x)
}

n=100
p = 0.10
xs= 0:100
ps2 = p_x2(xs, n, p)
plot(xs, ps2)

F_x = function(x, n= 100, p= 0.5){
  ps = p_x2(0:x, n, p)
  sum(ps)
}

F_x = Vectorize(F_x)
F_x(10)

plot(xs, F_x(xs), type="s")

F_x(60) - F_x(39)
F_x(59) - F_x(40)
F_x(59) - F_x(39)



#integral x^2 dx
#integrales definidas (R o wolfram alfa)
#integrales indefinidas (wolfram alfa)

result = integrate(function(x) x^2, lower = 2, upper = 3)
result$value



