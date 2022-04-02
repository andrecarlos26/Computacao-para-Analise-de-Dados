#1)
fileURL <- "http://stat405.had.co.nz/data/tb.csv"
download.file(fileURL, destfile = paste(getwd(), "/tb.csv", sep=""), 
              method = "curl")
TB <- read.csv("tb.csv")

#2)
TB <- TB %>% 
  gather(key="informacao", value="casos", 3:23)

#3)
TB <- TB %>%
  separate(col = "informacao",
           into = c("caso", "tipo", "sexofaixa"),
           sep = "_")

#4)
TB <- TB %>%
  separate(col = "sexofaixa",
           into = c("sexo", "faixa"),
           sep = 1)
