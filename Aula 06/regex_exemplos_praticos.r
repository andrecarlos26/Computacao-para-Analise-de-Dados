# Extrair dígitos de uma sequência de caracteres.
string <- "Meu número é 1006781"
gsub(pattern="[^0-9]", replacement = "",x=string)

# Retornar o index de um valor, caso o mesmo esteja presente em um vetor.
valores <- c("A1","A2","A3","A4","A5","A6","A7")
grep(pattern = "A1|A4",x = valores, value = F)

# Extrair apenas os valores em pares de valoreschave.
string <- c("G1:E001", "G2:E002", "G3:E003")
gsub(pattern = ".*:",replacement = "",x = string)

# Extrair informações contidas dentro de parênteses de uma string.
library(stringr)
string <- "Oq vai fazer amanhã ? (Estudar CPAD) Ver vídeos (Jogar) (Nadar)"
str_extract_all(string, "\\(.*?\\)")[[1]]
?str_extract_all

# Extair endereços de e-mail de uma determinada string.
string <- "ermeson@gmail.com bla bla bla ermeson.andrade@ufrpe.br"
str_extract_all(string=string,pattern="\\S*@\\S*")
