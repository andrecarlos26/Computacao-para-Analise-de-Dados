#1)
df=data.frame(Theoph)

df%>%select(Dose)

#2)
df%>%filter(Dose>5)

#3)
df%>%slice(10:20)

#4)
df%>%filter(Dose>5&Time>mean(Time))

#5)
df%>%arrange(desc(Wt))

#6)
df%>%arrange(Wt,desc(Time))

#7)
df%>%mutate(tendencia=Time-mean(Time))

#8)
df%>%summarise(max(conc))

#9)
file1 <- ""
file2 <- ""
download.file(file1, destfile = paste(getwd(), "/X673598238_T_ONTIME_REPORTING.csv", sep=""), 
              method = "curl")
download.file(file2, destfile = paste(getwd(), "/L_UNIQUE_CARRIERS.csv_", sep=""), 
              method = "curl")
X <- read.csv("X673598238_T_ONTIME_REPORTING.csv", quote="\"", sep = ",")
Y <- read.csv("L_UNIQUE_CARRIERS.csv_", quote="\"", sep = ",")
df <- merge(x=X, y=Y, by.x="OP_UNIQUE_CARRIER", by.y="Code")

df %>%
  group_by(Description) %>%
  summarise(atraso_max = max(DEP_DELAY_NEW, na.rm=T)) %>%
  filter(atraso_max == max(atraso_max))
#Resposta: American Airlines Inc.

#10)
df %>%
  group_by(Description) %>%
  summarise(atraso_medio = mean(DEP_DELAY_NEW, na.rm=T)) %>%
  filter(atraso_medio == max(atraso_medio))
#Resposta: JetBlue Airways 

#11)
df %>%
  group_by(Description) %>%
  summarise(atraso_medio = mean(DEP_DELAY_NEW, na.rm=T)) %>%
  filter(atraso_medio == min(atraso_medio))
#Resposta: Hawaiian Airlines Inc.

#12)
df %>%
  group_by(Description) %>%
  summarise(atraso_pop = 
              sum(DEP_DELAY_NEW, na.rm=T)/sum(df$DEP_DELAY_NEW, na.rm=T)) %>%
  filter(atraso_pop == max(atraso_pop))
#Resposta: American Airlines Inc.

#13)
fileURL <- "http://stat405.had.co.nz/data/tb.csv"
download.file(fileURL, destfile = paste(getwd(), "/tb.csv", sep=""), 
              method = "curl")

TB <- read.csv("tb.csv")

TB <- TB %>% 
  select(-new_sp)

TB <- TB %>% 
  gather(key="Codigo", value="N_casos", 3:22)

TB <- TB %>%
  separate(col = "Codigo",
           into = c("caso", "tipo", "sexofaixa"),
           sep = "_")

TB <- TB %>%
  separate(col = "sexofaixa",
           into = c("sexo", "faixa"),
           sep = 1)

TB %>%
  filter(iso2=="TH" & sexo=="m") %>%
  summarise(casos_TH_m = sum(N_casos, na.rm=T))
#Resposta: 223309

#14)
TB %>%
  filter(iso2=="US") %>%
  summarise(prop_US = sum(N_casos, na.rm=T)/sum(TB$N_casos, na.rm=T))
##Resposta: 0.003801693

#15)
TB %>%
  filter(faixa==2534 & sexo=="f") %>%
  summarise(casos_2534_f = sum(N_casos, na.rm=T))
#Resposta: 2054610

#16)
TB %>%
  filter(year>=2000 & year<=2009) %>%
  summarise(casos_anos_2000 = sum(N_casos, na.rm=T))
#Resposta: 18056915
