source("utils.R")

pp_birthday = function(n) {
  1 - variaciones(365, n) / (365 ^ n)
}

ns = 1:50
ps = pp_birthday(ns)

min(
  ns[ps >= 0.5]
)
