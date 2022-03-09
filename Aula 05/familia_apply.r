Bebidas <- c("Brahma","Cacildis","Heineken","Skol","Corona",
             "Bud Light","DeBron","Budweiser","Ekäut","Snow Beer",
             "Bavária","Bohemia","Crystal","Kaiser", "Itaipava",
             "Schin","Antarctica","Amstel","Colorado","Capunga")

set.seed(100)
precos <- runif(20, min = 2, max = 10)
vendas <- runif(20, min = 20, max = 100)
estoque <- sample(c(20:50), size = 20, replace = TRUE)

# criação de um dataset
dataset_loja <- data.frame(id_produto = c(1:20), Bebidas = Bebidas,
                           preco = precos, total_vendas = vendas,
                           total_estoque = estoque)
head(dataset_loja)

#Função apply()
aux_apply <- apply(X = dataset_loja[,-c(1,2)], MARGIN = 2, FUN = sum)
class(aux_apply)
View(aux_apply)

#Função lapply()
aux_lapply <- lapply(X = dataset_loja[,-c(1,2)], FUN = sum)
class(aux_lapply)
View(aux_lapply)

#Função sapply()
aux_sapply <- sapply(X = dataset_loja[,-c(1,2)], FUN = sum)
class(aux_sapply)
View(aux_sapply)

#Como faço para obter as classes ou o tamanho das colunas usando sapply
sapply(X = dataset_loja, FUN = class)
sapply(X = dataset_loja, FUN = length)

#Aplicando em um vetor
sapply(X = Bebidas, FUN = nchar)

#Função tapply()
dataset_loja$fornecedores <- sample(c("Fornecedor 1","Fornecedor2",
                                      "Fornecedor 3", "Fornecedor 4"), 
                                    size = 20, replace = TRUE)

aux_tapply <- tapply(dataset_loja[,"preco"], dataset_loja[,"fornecedores"], mean)
class(aux_tapply)
View(aux_tapply)
?tapply

#Função mapply()
aux_mapply <- mapply(FUN = function(x,y,z){(x*y)+z}, dataset_loja[,c("preco")],
       dataset_loja[,c("total_estoque")], dataset_loja[,c("total_vendas")])
class(aux_mapply)
View(aux_mapply)
