library(httr)
library(jsonlite)
library(dplyr)
library(tm)
library(wordcloud)

#Função que faz a busca no Twitter
search_recent_tweets <- function(bearer_token, query, max_results, lang=NULL) { 
  headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))
  
  if (max_results < 10) {
    return("max_results deve ser maior ou igual a 10.")
  }
  
  result <- data.frame()
  first_try <- TRUE
  
  while (nrow(result) < max_results) {
    
    if (first_try) {
      params <- list(query = query, tweet.fields = 'lang', max_results=100)
      first_try <- FALSE
    } else {
      params <- list(query = query, tweet.fields = 'lang', max_results=100, pagination_token = tail(tweets, 1)$meta.next_token)
    }
    
    response <- httr::GET(url = 'https://api.twitter.com/2/tweets/search/recent', httr::add_headers(.headers = headers), query = params)
    obj <- httr::content(response, as = "text")
    tweets <- fromJSON(obj, flatten = TRUE) %>% as.data.frame
    if (!("meta.result_count" %in% colnames(tweets))) {
      return(result)
    } 
    
    if (!is.null(lang)) {
      tweets <- tweets%>%filter(data.lang==lang)
    }
    result <- bind_rows(result, tweets)
  }
  
  return(result[1:max_results,])
}

#Token necessário para consultar o Twitter
bearer_token <- "AAAAAAAAAAAAAAAAAAAAAPfhbQEAAAAAVUeUujEKYKcgWDc3g0bXakoGLFc%3DS3FpG08LMzLmWWPgZLdeHKmaT207WQKKuucNJ0CTeupFdQ1Zs2"

#Consultando o Twitter (Retorna um DF)
tweets <- search_recent_tweets(bearer_token, '#Brasil', 500, 'pt')

#Colapsando todos os twittes em um vetor de uma posição
tweets_t <- paste(tweets$data.text, collapse=" ")

#Criando o source e corpus
tweets_S <- VectorSource(tweets_t)
corpus <- Corpus(tweets_S)

#Limpeza
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("portuguese"))

#Remove URLs
removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
corpus <- tm_map(corpus, removeURL)

#Remove qualquer coisa que não seja letras em português e espaço.
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
corpus <- tm_map(corpus, content_transformer(removeNumPunct))

inspect(corpus)

#Cria a matriz
dtm <- TermDocumentMatrix(corpus)
dtm <- as.matrix(dtm)

#Fornece a frequência de cada palavra
fre <- sort(rowSums(dtm), decreasing=TRUE)

####################################
#     Gera a nuvem de palavras
####################################

wordcloud(corpus, min.freq = 3, max.words=Inf,
          random.order=FALSE, rot.per=0.15,
          colors=brewer.pal(8, "Dark2"), scale=c(8,.2))
