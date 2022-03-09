#1)
dados1 <- data.frame(observacaoA = 16:8, observacaoB = c(20:19, 6:12))

#1) a)
sapply(dados1, length)

#1) b)
sapply(dados1, sum)

#1) c)
sapply(dados1, quantile)

#1) d)
sapply(dados1, class)

#1) e)
DerivativeFunction <- function (x) {log10 (x) + 1}
apply(dados1, 2, DerivativeFunction)

#1) f)
sapply(dados1, function(x){log10(x)+1})

#1) g)
sapply(dados1, print)

#2)
data(chickwts)
tapply(chickwts$weight, chickwts$feed, mean)

#3)
over300 <- function(x){
  sum(x>300)
}

tapply(chickwts$weight, chickwts$feed, over300)

#4)
mapply(function(x,y){x+y}, 5:10, 20:25)

#5)
mapply(paste, 1:4, 5:8, sep=LETTERS[1:4])

#6)
set.seed(112)
d = data.frame(matrix(rnorm(1e5 * 10),ncol=10))
d$cat = sample(LETTERS[1:5], 1e5, replace=TRUE)

#6) a)
apply(d[,-11], 2, max)

#6) b)
sapply(d[,-11], max)
lapply(d[,-11], max)

#6 c)
for (i in d[,-11]){
  print(max(i))
}

#7) a)
tapply(d[,-11], d$cat, median)

#7) b)
for (i in d[,-11]){
    print(tapply(i, d$cat, median))
}

#7) c)
sapply(d[,-11], function(x){tapply(x, d$cat, median)})
