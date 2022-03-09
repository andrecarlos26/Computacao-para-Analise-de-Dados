#Calcula as médias das colunas de airquality
saida <- vector("double", ncol(airquality))

for (i in seq_along(airquality)){
  saida[i] <- mean(airquality[,i], na.rm = T)
}

#Calcula as somas das colunas 5 e 6 de airquality
saida <- vector()

for (i in 5:6){
  saida <- cbind(saida, sum(airquality[,i], na.rm=T))
}
