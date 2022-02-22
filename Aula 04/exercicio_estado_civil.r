x <- factor(c("Solteiro", "Casado", "Casado", "Solteiro"))
x <- factor(x, levels = c("Solteiro", "Casado", "Divorciado"))

#modifica o segundo elemento
x[2] <- "Divorciado"

#não pode atribuir valores fora do níveis
x[3] <- "Viúvo"

#adiciona um nível
levels(x) <- c(levels(x), "Viúvo")
x[3] <- "Viúvo"

#altere o quarto elemento para União Estável
levels(x) <- c(levels(x), "União Estável")
x[4] <- "União Estável"

x[2] <- "Solteiro"

#alterando todos da mesma categoria de uma vez
levels(x)[1] <- "Não casado"
