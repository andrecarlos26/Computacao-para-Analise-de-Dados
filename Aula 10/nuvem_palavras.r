#Pacotes que serão usados
install.packages("tm")
install.packages("wordcloud")
library(tm)
library(wordcloud)
library(readr)

#Carregar
motivos <- read_csv("motivos.csv")

#Colapsando todos os comentários em um vetor de uma posição
motivos <- paste(motivos$"2019.1", collapse=" ")

# Para processar o texto usando o pacote tm, é necessário converter esses dados
# em um formato chamado corpus, que pode ser processado pelo pacote tm
VS <- VectorSource(motivos)
corpus <- Corpus(VS)

#Verificando o arquivo corpus gerado
inspect(corpus)

####################################
#             Limpeza
####################################

#Coloca tudo em minúsculo
corpus <- tm_map(corpus, content_transformer(tolower))

#Remove pontuação
corpus <- tm_map(corpus, removePunctuation)

#Remove espaços extras em branco
corpus <- tm_map(corpus, stripWhitespace)

#Remove números
corpus <- tm_map(corpus, removeNumbers)

#Remove palavras ruído
corpus <- tm_map(corpus, removeWords, stopwords('portuguese'))

####################################
#          Fim da Limpeza
####################################

#Verificando o arquivo corpus após a limpeza.
inspect(corpus)

#Converte para o formato de uma matriz.
tdm <- as.matrix(TermDocumentMatrix(corpus))

#Fornece as frequências ordenadas de cada palavra.
fre <- sort(rowSums(tdm), decreasing=TRUE)

#Escolhendo um subconjunto dos dados.
aux <- subset(fre, fre>2)

#Plota o gráfico de barras dos termos mais frequentes
barplot(aux, las=2, col=rainbow(10))

####################################
#     Gera a nuvem de palavras
####################################

wordcloud(corpus, min.freq = 1, max.words=60,
          random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))
