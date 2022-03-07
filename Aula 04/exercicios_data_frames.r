#1) a)
Familia <- data.frame(nome = character(0), idade = numeric(0), 
                      sexo = factor(character(0), levels=c("F", "M")), 
                      stringsAsFactors = FALSE)

Familia[1,] <- list("Bruno", 25, "M")
Familia[2,] <- list("Mayra", 24, "F")
Familia[3,] <- list("Maria", 40, "F")
Familia[4,] <- list("João", 35, "M")
Familia[5,] <- list("Jonas", 15, "M")

#1) b)
Familia$ano100 <- as.numeric(format(Sys.Date(), "%Y")) + (100 - Familia$idade)
mean(Familia$ano100)

#1) c)
mean(Familia$idade)
mean(subset(Familia, sexo=="F")$idade)

#2) a)
Piratas <- data.frame(Name = character(0), Sex = factor(character(0), 
                                                        levels=c("F","M")),
                      Age = numeric(0), Superhero = character(0), 
                      Tattoos = numeric(0))

Piratas[1,] <- list("Astrid", "F", 30, "Batman", 11)
Piratas[2,] <- list("Lea", "F", 25, "Superman", 15)
Piratas[3,] <- list("Sarina", "F", 25, "Batman", 12)
Piratas[4,] <- list("Remon", "M", 29, "Spiderman", 5)
Piratas[5,] <- list("Letzia", "F", 22, "Batman", 65)
Piratas[6,] <- list("Babice", "F", 22, "Antman", 3)
Piratas[7,] <- list("Jonas", "M", 35, "Batman", 9)
Piratas[8,] <- list("Wendy", "F", 19, "Superman", 13)
Piratas[9,] <- list("Niveditha", "F", 32, "Maggott", 900)
Piratas[10,] <- list("Gioia", "F", 21, "Superman", 0)

#2) b)
median(Piratas$Age)

#2) c)
median(subset(Piratas, Sex=="F")$Age)
median(subset(Piratas, Sex=="M")$Age)

#2) d)
max(subset(Piratas, Sex=="M")$Tattoos)

#2) e)
nrow(subset(Piratas, Sex=="F" & Age<32)) / nrow(Piratas)

#2) f)
Piratas$Tattoos.Per.Year <- round(Piratas$Tattoos / Piratas$Age, 2)

#2) g)
subset(Piratas, Tattoos.Per.Year==max(Tattoos.Per.Year), Name)

#2) h)
subset(Piratas, Superhero=="Superman", Name)

#2) i)
mean(subset(Piratas, Age>20 & Superhero=="Batman")$Tattoos)
