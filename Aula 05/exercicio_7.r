source("exercicio_7_funcoes.r")

#1)
y <- 5

mult <- function(x,y){
  return(x*y)
}

mult(10) #Resposta: Erro

#2)
y <- 5

mult <- function(x){
  return(x*y)
}

mult(10) #Resposta: 50

# OBS: As funções utilizadas para responder as questões abaixo estão definidas
# no arquivo exercicio_7_funcoes.r

#3)
prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))
#Resposta: 40.1

#4)
prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault"))
#Resposta: Estado Inválido

#5)
prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), 
        tiposPrisoes=c("Rape","UrbanPop","Assault"))
#Resposta: 693.5

#6)
prisoes(estados=c("Vermont","Wisconsin", "Texas"), 
        tiposPrisoes=c("Rape","Assalto"))
#Resposta: Tipo de Prisão Inválida

#7)
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,NA,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), 
              Proj=c(7,5), VA_2=7, VA_3=9, Opt=1, threshold=8)
#Resposta: Média da 1VA: 7.45454545454546 -- Abaxo da Média

#8)
minhasNotas_1(Exe_1=c(10,9,7,5,NA,4,5,6,7,8,NA), VA_1=2, Exe_2=c(10,5.7,7.8,NA), 
              Proj=4, VA_2=7, VA_3=9, Opt=2, threshold=5)
#Resposta: Média da 2VA: 5.275 -- Acima da Média

#9)
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), 
              Proj=c(4,5), VA_2=7, VA_3=9, Opt=2, threshold=8)
#Resposta: Quantidade de Notas Inválidas para a 2 VA!

#10)
minhasNotas_1(Exe_1=c(NA,NA,7.5,1,10,2,5,6,7,8,10), VA_1=4, 
              Exe_2=c(7,11,8.8,5,7,8), Proj=4, VA_2=7, VA_3=9, Opt=4, 
              threshold=7) 
#Resposta: Nota(s) Inválida(s) para a Média Final!

#11)
minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(6,8,9,8,5,7,8), 
              Proj=7, VA_2=7, VA_3=9, Opt=4, threshold=8)
#Resposta: 8.34090909090909 -- Aprovado!!

#Exemplo da dúvida com o professor
minhasNotas_1(Exe_1=c(5,7,9,4), VA_1=10, Exe_2=c(5,2), Proj=4, VA_2=c(8,5), 
              VA_3=9, Opt=1, threshold=8)
