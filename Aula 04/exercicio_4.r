#1)
gl(2,100,labels=c("M","F"))

#2)
drinks <- factor(c("beer", "beer", "wine", "water"))
mean(drinks=="beer")

#3)
drinks <- factor(c("beer", "beer", "wine", "water"))
levels(drinks)[1] <- "water"
drinks

#4)
nomes <- c("João", "Paula", "Maria", "Ingrid", "José", "Marcos")
pesos <- c(80, 65, 70, 58, 78, 70)
alturas <- c(1.70, 1.66, 1.65, 1.60, 1.76, 1.70)
lista_pessoas <- list(nomes=nomes, pesos=pesos, alturas=alturas)
IMC <- pesos/(alturas^2)
lista_pessoas$IMC <- IMC

lista_pessoas[[1]][1]

#5)
str(lista_pessoas)

#6)
lista_pessoas[[4]][3] #Resposta: 25.71166

#7)
lista <- lapply(airquality, function(x){mean(x)})
lista$Temp

#8)
load("chuvas.RData")
mean(chuvas) #Resposta: 5.049933

#9)
which.max(rowMeans(chuvas)) #Resposta: mun_60

#10)
which.min(colSums(chuvas)) #Resposta: dia_12

#11)
aux<-chuvas["mun_81" , ]; aux<-sum(aux[1:10]) #CORRETO
aux<-chuvas[81 , ]; aux<-sum(aux[1:10]) #CORRETO
aux<-chuvas[81 , ]; aux<-sum(aux[seq(1,10,1)]) #CORRETO
aux<-chuvas["mun_81" ]; aux<-sum(aux[1:10]) #ERRADO
aux<-chuvas["mun_81" , ]; aux<-sum(aux[c(1:10)]) #CORRETO
