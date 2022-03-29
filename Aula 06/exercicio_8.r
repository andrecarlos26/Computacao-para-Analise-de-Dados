#1)
v<-c(20,30,4,934,1077,22)
paste(v,'m',sep='')

#2)
poema <- 'No meio do caminho tinha uma pedra
tinha uma pedra no meio do caminho
tinha uma pedra
no meio do caminho tinha uma pedra.

Nunca me esquecerei desse acontecimento
na vida de minhas retinas tão fatigadas.
Nunca me esquecerei que no meio do caminho
tinha uma pedra
tinha uma pedra no meio do caminho
no meio do caminho tinha uma pedra.'
nchar(poema) #Resposta: 333

#3)
txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan")
grep(pattern= "^.an$", txt, value= TRUE)

#4)
txt = "eeer3GHJca1nfgSigmanfaUIOntafan"
str_extract_all(string=txt, pattern="[0-9A-Z]")

#5)
str_extract_all(string=txt, pattern="[^[:lower:]]")

#6)
txt = "tttyUFRPE19PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA"
str_extract_all(string=txt, pattern="UFRPE.*?PPGIA")

#7)
pattern <- "(n|N)egr(o|a)s?"

?paste

#8)
grep("a(ab)*a", c("abababa", "aaba", "aabbaa", "aba", "aabababa"), value=FALSE)

#9)
grep("ab+c?", c("abc", "ac", "abbb", "bbc"), value=FALSE)

#10)
grep("a.[bc]+", c("abc", "abbbbbbbb", "azc", "abcbcbcbc", "ac", 
                  "asccbbbbcbcccc"), value=FALSE)

#11)
grep("[abc|xyz]", c("abc", "xyz", "abc|xyz"), value=TRUE)

#12)
grep("[a-z]+[\\.\\?!]", c("battle!", "Hot", "green", "swamping.", "jump up.", 
                        "undulate?", "is.?"), value=FALSE)

#13)
grep("[a-zA-Z]*[^,]=", c("Butt=", "BotHEr,=", "Ample", "FIdDlE7h=", "Brittle =", 
                         "Other.="), value=FALSE)

#14)
grep("[a-z][\\.\\?!]\\s+[A-Z]", c("A. B", "c! d", "e f", "g. H", "i? J", 
                         "k L"), value=FALSE)

#15)
grep("(very )+(fat )?(tall|ugly) man", c("very fat man", "fat tall man", 
                                         "very very fat ugly man", 
                                         "very very very tall man"), 
     value=FALSE)

#16)
grep("<[^>]+>", c("<an xml tag>", "<opentag> <closetag>", "</closetag>", "<>",
                  "<with attribute=”77”>"), value=FALSE)


#17)
Gapminder <- read.delim("gapminderDataFiveYear.txt")
Paises <- unique(Gapminder$country)

grep("\\band\\b", Paises, value = TRUE)

#18)
length(grep("^Ba", Paises, value = TRUE)) + 
  length(grep("land$", Paises, value = TRUE)) + 
  length(grep("\\bGa", Paises, value = TRUE))
#Resposta: 13
