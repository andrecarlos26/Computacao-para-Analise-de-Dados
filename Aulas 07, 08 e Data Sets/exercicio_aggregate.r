# Qual foi a temperatura média de NY para os meses do estudo descrito no dataset
# airquality ?
aggregate(formula = Temp ~ Month,
          FUN = mean,
          data = airquality)

# Somente para os casos onde o vento foi menor que 10
aggregate(formula = Temp ~ Month,
          FUN = mean,
          subset = Wind < 10,
          data = airquality)
