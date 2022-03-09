#1)
seq <- 1:7

for (i in seq){
  print(i^3)
}

i <- 1
while (i<=7){
  print(i^3)
  i <- i + 1
}

i <- 1
repeat{
  print(i^3)
  i <- i + 1
  if (i > 7){
    break
  }
}

#2)
x <- 1
y <- 40
i <- c(1:10)

for (n in i){
  x <- x + 3
  y <- y - 2
}

#3)
x <- 100
y <- 50
i <- 1

repeat{
  x <- x - i
  y <- y + i
  if (x < y){
    break
  }
}

#4)
while (T){
  n <- rnorm(n=1)
  if (n>1){
    break
  }
  print(n)
}

#5)
while (T){
  n <- rnorm(n=1)
  if (n<0){
    next
  }
  else if (n>1){
    break
  }
  print(n)
}
  
#6) a)
for (i in mtcars){
  print(mean(i, na.rm = T))
}

#6) b)
install.packages("nycflights13")
library("nycflights13")

for (i in nycflights13::flights){
  print(class(i))
}

#6) c)
for (i in iris){
  print(length(unique(i)))
}
