# Ponto "." literalmente qualquer coisa
strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")
grep("ab.", strings, value = TRUE)

# Lista "[ ]" lista de caracteres de acordo com seu conteúdo
texto <- c("Eu", "Amo", "a", "Rural")
grep(pattern = "[al]", texto, value = TRUE)

numerics = c("123", "27-Abril", "I-II-III", "R 3.0.1")
grep(pattern = "[01]", numerics, value = TRUE)
grep(pattern = "[0-9]", numerics, value = TRUE)
grep(pattern = "[^0-9]", numerics, value = TRUE)

# Escape "\" torna os metacaracteres em texto quando os antecedem
txt <- ("Eu.Amo.a.Ruralinda")
gsub(pattern = ".", " ", txt)
gsub(pattern = "\\.", " ", txt)
