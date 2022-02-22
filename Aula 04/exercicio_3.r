#4)
#Carregando os dados
competidoras <- c("Maria", "Joana")
abdominal <- c(42, 38)
salto <- c(102, 173)
suspensao <- c(38, 71)
correr <- c(2149, 1554)
conhecimento <- c(97, 70)

#Padronizando os dados
abdominal.n <- (abdominal-30)/6
salto.n <- (salto-155)/23
suspensao.n <- (suspensao-50)/8
correr.n <- (correr-1829)/274
conhecimento.n <- (conhecimento-75)/12

#A melhor competidora
media <- (abdominal.n + salto.n + suspensao.n +correr.n + conhecimento.n)/5
competidoras[max(media)==media] #Resposta: Joana

#5)
load("vetor.RData")

#media
mean(vetor01, na.rm=TRUE) #Resposta: 4.992657

#mediana
median(vetor01, na.rm=TRUE) #Resposta: 4.998

#desvio padrão
sd(vetor01, na.rm=TRUE) #Resposta: 2.881812

#qtd de faltosos
sum(is.na(vetor01)) #Resposta: 321

#percentual de faltosos
sum(is.na(vetor01)) / length(vetor01) #Resposta: 0.0214

#7 < nota < 8
sum(vetor01>7 & vetor01<8, na.rm=TRUE) #Resposta: 1446

#nota<1 OU nota>9
sum(vetor01<1 | vetor01>9, na.rm=TRUE) #Resposta: 2933
