# Ou "|" condicional de ocorrências
strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")
grep("abc|abd", strings, value = TRUE)

# Grupo "( )" conjunto de combinações
strings <- c("ha", "haha", "hahaha", "kkkk")
grep("(ha)+", strings, value = TRUE)
strings <- c("Bom-dia", "Boa-Noite", "Boa-Tarde")
grep("Boa-(Tarde|Noite)", strings, value = TRUE)

# Retrovisor (Back Reference) "\1 … \9" texto casado por algum grupo (de 1 a 9)
strings <- c("Eu amo a Rural", "Eu amo amo a Rural")
grep("Eu (amo) \\1 a Rural", strings, value = T)
numeros<-c(1,30,344,333,555,3333,33)
grep("([0-9])\\1\\1" , numeros, value = T)
