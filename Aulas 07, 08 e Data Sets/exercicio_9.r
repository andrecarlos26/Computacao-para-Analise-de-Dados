#1)
fileURL <- ""
download.file(fileURL, destfile = paste(getwd(), "/catsM.csv", sep=""), 
              method = "curl")
catsM <- read.csv("catsM.csv")

mean(catsM$Bwt) #Resposta: 2.9

#2)
Caracol_data <- read.csv("Caracol_data_checked.csv")
mean(Caracol_data$Depth) #Resposta: 1.507601

#3)
max(Caracol_data[Caracol_data$Size=="small" & Caracol_data$Sex=="female", 5], 
    na.rm = T)
#Resposta: 1

#4)
fileURL <- ""
download.file(fileURL, destfile = paste(getwd(), "/Sparrows.csv", sep=""), 
              method = "curl")

Sparrows <- read.table(file="Sparrows.csv", header=TRUE)
Sparrows <- read.table(file="Sparrows.csv", header=TRUE, sep=",")
View(Sparrows)

#5)
Sparrows <- read.csv("Sparrows.csv", stringsAsFactors=TRUE)
min(Sparrows[Sparrows$Species=="SSTS", 5])
max(Sparrows[Sparrows$Species=="SSTS", 5])
#Resposta: 29.2, 33.5

#6)
which(duplicated(Sparrows))
#Resposta: 23, 37, 140

#7)
levels(Sparrows$Sex)
levels(Sparrows$Sex)[1] <- "Female"
levels(Sparrows$Sex)[2] <- "Female"
levels(Sparrows$Sex)[3] <- "Male"
mean(Sparrows[Sparrows$Sex=="Female", 4])
mean(Sparrows[Sparrows$Sex=="Male", 4])
#Resposta: 21.12007, 21.62668

#8)
which(is.na(Sparrows$Wing))

#9)
Sparrows[64, 3] <- 59
Sparrows[250, 3] <- 56.5
Sparrows[806, 3] <- 57
mean(Sparrows$Wing) #Resposta: 57.86205

#10)
Sparrows_Ordenado<-Sparrows[order(Sparrows$Wing,Sparrows$Head),]
