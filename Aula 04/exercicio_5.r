#1)
mouse.color <- c("purple", "red", "yellow", "brown")
mouse.weight <- c(23, 21, 18, 26)
mouse.info <- data.frame("color"=mouse.color, "weight"=mouse.weight)

str(mouse.info)

#2)
mouse.info[3,]

#3)
mouse.info[,1]

#4)
mouse.info[4,1]

#5)
min(subset(airquality, Month==5)$Ozone, na.rm=TRUE) 
#Resposta: 1

#6)
mean(subset(airquality, Ozone>25 & Temp<90)$Solar.R, na.rm=TRUE) 
#Resposta: 215.2041

#7)
sum(complete.cases(airquality))
#Resposta: 111

#8)
genomas <- as.data.frame(read.csv(
  "https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1"))
str(genomas)

subset(genomas, Chromosomes>40, Organism)

#9)
aux <- subset(genomas, Plasmids>0 & Chromosomes>1)$Organism
"Yangia" %in% aux #TRUE
"Vibrio tubiashii" %in% aux #TRUE
"Acidipila" %in% aux #FALSE
"Vibrio scophthalmi" %in% aux #TRUE
"Acidimicrobiales bacterium" %in% aux #FALSE

#10)
length(unique(genomas$Groups))

#11)
cancer_stats <- as.data.frame(read.csv(
  "https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1"))
str(cancer_stats)

subset(cancer_stats, Class=="Digestive System" & Female.Cases>Male.Cases, Site)
#Resposta: gall

#12)
cancer_stats$Male.Survival.Rate <- with(cancer_stats, 
                                        1 - (Male.Deaths/Male.Cases))
cancer_stats$Female.Survival.Rate <- with(cancer_stats, 
                                          1 - (Female.Deaths/Female.Cases))
subset(cancer_stats, Male.Survival.Rate==max(Male.Survival.Rate, na.rm=TRUE), 
       Site)
#Resposta: Testis

#13)
subset(cancer_stats, Female.Survival.Rate==min(Female.Survival.Rate, na.rm=TRUE)
       , Site)
#Resposta: pancreas
