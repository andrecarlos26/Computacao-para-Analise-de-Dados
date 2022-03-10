#1)
area_triangulo <- function(b, h){
  A <- (b*h)/2
  return(A)
}

area_triangulo(5, 10)

#2)
somatorio <- function(n){
  S <- sum(1:n)
  return(S)
}

somatorio(4)

#3)
celcius <- function(f){
  c <- 5/9*(f-32)
  return(c)
}

celcius(105)

#5)
vector_stats <- function(v){
  a <- length(v)
  b <- sum(v)
  c <- ifelse(a%%2==0, v[1], tail(v,1))
  return(list(length=a, sum=b, element=c))
}

vector_stats(c(1,2,3,4))
vector_stats(c(1,2,3,4,5))

#6)
letters_pos <- function(word){
  word <- toupper(word)
  pos <- rep(NA, nchar(word))
  for (i in 1:nchar(word)){
    pos[i] <- which(LETTERS==substr(word,i,i))
  }
  return(pos)
}

letters_pos("bruno")

#7)
matrix_builder <- function(v1=c(1,2,3), v2=c(4,5,6), v3=c(7,8,9), ...){
  options(warn=2)
  m <- cbind(v1, v2, v3)
  l <- list(matrix=m, colSums=colSums(m))
  options(warn=1)
  return(l)
}

matrix_builder()
