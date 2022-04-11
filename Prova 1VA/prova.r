install.packages(
  c("pacman", "readr", "babynames", "ggplot2", "AER")
  )
pacman::p_load(dplyr, tidyr, stringr, readr, babynames, ggplot2, AER)

#1)
strg <- c("VodKa 30", "CaNa 25", "ViNHo 23", "Ozônio 22")
tolower(paste(strg, "+", sep=""))

#2)
grep("^([0-4][[:punct:]][a-z])", 
     c("5!eAZ", "!6!rrrrDFGT", "R99Tf34!RR", "123?aSd", "1.z11111"), 
     value=TRUE)
#Resposta: 1.z11111

#3)
gambler <- read_file("gambler.txt")
nchar(gambler)
#Resposta: 2565

#4)
babynames <- as.data.frame(babynames)
unique(
  with(babynames, name[str_count(name,"A|a") == max(str_count(name,"A|a"))])
  )
#Resposta: Mayraalejandra OU Mariaalejandra OU Aaradhana

#5)
Forbes2000 <- read_csv("Forbes2000_V2.csv")
ranqueamento  <- function(ranque,  categoria=NULL, opcao){
  R <- Forbes2000
  if (opcao==2){
    R <- R %>% 
      filter(category == categoria)
    if (nrow(R) == 0){
      return ("Categoria não existe!")
    }
  }
  R <- R %>% 
    mutate(ranking = row_number(desc(marketvalue))) %>%
    select(name, category, ranking) %>%
    filter(ranking == ranque)
  if (nrow(R) == 0){
    return ("Ranking não existe!")
  }
  return (R)
}

ranqueamento(ranque=1234, opcao=1)
#Resposta: OTP Bank

#6)
ranqueamento(ranque=198, opcao=1)
#Resposta: Media

#7)
ranqueamento(ranque=45, categoria="Technology hardware & equipment", opcao=2)
#Resposta: Chi Mei Optoelectronics

#8)
ranqueamento(ranque=7, categoria="Bancos", opcao=2)
#Resposta: "Categoria não existe!"

#9)
diamonds %>%
  filter(cut=="Very Good" & carat>0.7) %>%
  summarise(mean(price))
#Resposta: 6512

#10)
diamonds %>%
  filter(carat>0.5) %>%
  filter(price==min(price)) %>%
  select(color)
#Resposta: H

#11)
diamonds %>%
  filter(cut=="Premium") %>%
  summarise(prop = n()/nrow(diamonds))
#Resposta: 0.25567297

#12)
data("Fertility")
Fertility%>%select(age,work)%>%slice(35:50)

#13)
Fertility %>%
  filter(morekids=="yes" & work>30) %>%
  summarise(prop = n()/nrow(Fertility))
#Resposta: 0.103191

#14)
Fertility %>%
  filter(age>=22 & age<=24 & gender1=="male") %>%
  summarise(n()) /
Fertility %>%
  filter(age>=22 & age<=24) %>%
  summarise(n())
#Resposta: 0.5036608


#15)
Catfish <- read_csv("Catfish.csv")
Treatment <- read_csv("Treatment.csv")
Catfish <- Catfish %>%
  gather(key="Month", value="Weight", c(7,8)) %>%
  unite(col="Species", Genus, Species, sep=".")
Catfish_Treatment <- merge(x=Catfish, y=Treatment, by="Tank")

Catfish_Treatment %>%
  filter(Sex=="Male" & Month=="April" & Food=="Treatment2") %>%
  summarise(mean(Weight))
#Resposta: 72.1

#16)
Catfish_Treatment$AcimaMedia<-ifelse(Catfish_Treatment$Weight>mean(Catfish_Treatment$Weight),"V","F")

#17)
Catfish_Treatment %>%
  group_by(Tank) %>%
  filter(AcimaMedia=="V") %>%
  summarise(n())
#Resposta: Todos os Tanks possuem a mesma média.

#18)
nomes <- c("Maria", "Teresa", "Francisca", "Joaquina")
abdominais <- c(42,38, 50, 40)
salto <- c(70,173,150,140)
suspensao <- c(40,71,40,80)
correr <- c(1500,1554,1900,2093)
conhecimento <- c(97,70,40,100)

abdominais.n <- (abdominais-30)/6
salto.n <- (salto-155)/23
suspensao.n <- (suspensao-50)/8
correr.n <- (correr-1829)/274
conhecimento.n <- (conhecimento-75)/12

media <- (abdominais.n + salto.n + suspensao.n + correr.n + conhecimento.n) / 5
nomes[max(media)==media]
#Resposta: Joaquina

#19)
casosCompletos<- function(df, linhas=NA){
  if (anyNA(linhas)){
    return ( sum(complete.cases(df)) )
  }
  return ( sum(complete.cases(df[linhas,])) )
}

casosCompletos(df=airquality)
#Resposta: 111

#20)
aux <- read.csv("tb.csv")
casosCompletos(df=aux, linha=1589:2564)
#Resposta: 59
