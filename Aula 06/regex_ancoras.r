# Circunflexo "^" início da string
strings <- c("abcd", "cdab", "cabd", "c abd")
grep("ab", strings, value = TRUE)
grep("^ab", strings, value = TRUE)

#  Cifrão "$" fim de linha
strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ab$", strings, value = TRUE)

# Dígito "\d" encontra correspondência com um número
string <- c("Eu Amo a Rural 2020")
gsub("\\d", "_", string)
