library(httr)
library(jsonlite)
library(dplyr)
library(tm)
library(syuzhet)

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
tweets <- search_recent_tweets(bearer_token, '#stf', 500, 'pt')

#Acessando apenas os textos
tweets <- tweets$data.text

#Pontuando os tweets
s <- get_nrc_sentiment(tweets)

#Esse pacote quebra as emoções em 8 tipos diferentes
#(raiva, antecipação, nojo, medo, alegria, tristeza, surpresa, confiança)
#e os sentimenos em dois tipos (negativo e positivo)

View(s)

#Plotando os sentimentos
barplot(colSums(s), las=2, col = rainbow(10),
          ylab = "Quantidade", main = "Sentimentos com Relação ao STF")
