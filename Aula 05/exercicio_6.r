#1)
apply(iris[ , 1:4], 1, FUN = mean) #INCORRETO
apply(iris, 2, FUN = mean) #INCORRETO
colMeans(iris) #INCORRETO
apply(iris[ , 1:4], 2, FUN = mean) #CORRETO
sapply(iris[ , 1:4], 2, FUN = mean) #INCORRETO
mapply(iris[ , 1:4], mean) #INCORRETO
apply(iris[1:4, ], 2, FUN = mean) #NCORRETO

#2)
tapply(iris$Petal.Length, iris$Species, mean) #CORRETO
tapply(iris[,3], iris$Species, mean) #CORRETO
with(iris, tapply(Petal.Length, Species, mean)) #CORRETO
sapply(iris, 2, mean) #INCORRETO
mapply(iris$Petal.Length, iris$Species, mean) #INCORRETO
mean(iris$Petal.Length, iris$Species) #INCORRETO



#5)
for (i in 1:4){ 
  
}
print(i) #Resposta: 4

#6)
for (i in 1:4){ 
  break
}
print(i) #Resposta: 1

#7)
for (i in 1:4){ 
  next
}
print(i) #Resposta: 4

#8)
mapply(rep,c("Rural","Amo"),10:1)

#9)
for (i in 1:length(1:3)){
  for (j in 1:10){
    print(j+i-1)
  }
}

#10)
student.df = data.frame(nome = c("Sue", "Eva", "Henry", "Jan"), 
                        sexo = c("f", "f", "m", "m"), 
                        anos = c(21,15,17,19))

student.df$menor<-ifelse(student.df$sexo=="m"&student.df$anos<18,"V","F")

#11)
lapply(USArrests,sum)

#12)
x = 0
a = 0
b = -5

if (a > 0){
  if (b < 0){
    x = x + 5 
  }else if (a > 5){
    x = x + 4
  }else{
    x = x + 3
  }
}else{
  x = x + 2
}

print(x) #Resposta: 2

#13)
x = 0

while (x < 100){
  x=x+2
}

print(x) #Resposta: 100
