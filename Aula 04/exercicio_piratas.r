piratas <- c("Heidel", "Andrew", "Becki", "Madisen", "David")
beber <- c(12, 8, 1, 6, 2)
escalada <- c(100, 520, 430, 200, 700)

#Padronizar a viarável beber
beber.n <- (beber-mean(beber))/sd(beber)

#Padronizar a viarável escalada
escalada.n <- (escalada-mean(escalada))/sd(escalada)

#O melhor pirata
media <- (beber.n + escalada.n)/2

max(media)

piratas[max(media)==media]
