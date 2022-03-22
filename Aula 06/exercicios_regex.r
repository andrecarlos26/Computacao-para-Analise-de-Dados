#1)
# http://play.inginf.units.it/#/
# Respostas no arquivo regexplay.r

#2)
Gapminder <- read.delim("gapminderDataFiveYear.txt")
Paises <- unique(Gapminder$country)

#2) a)
grep("[^e]ee[^e]", Paises, value = TRUE)

#2) b)
grep("^South", Paises, value = TRUE)
grep("land$", Paises, value = TRUE)
grep("(^|\\s)Ga", Paises, value = TRUE)

#2) c)
grep("[[:punct:]]", Paises, value = TRUE)

#2) d)
clean.text <- function(s){
  return(tolower(gsub(pattern = "[^a-zA-Z]", replacement = "", s)))
}

#2) e)
grep("[it]land$", Paises, value = TRUE)
gsub(pattern = "land", replacement = "LAND", grep("[it]land$", Paises, 
                                                  value = TRUE))
