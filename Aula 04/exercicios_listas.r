#1)
v <- list("a", "b", "c")
names(v) <- c("Um", "Dois", "Tres")
str(v)

#2)
lista <- list(a=1:10, b=letters[1:3], c="Rural")
lista$a
lista[[2]]

#3)
v <- list(a=1:10, b="Bom Dia!", c="Rural")
v$z <- "2017"
str(v)

#4)
v[3] <- NULL
str(v)

#5)
x <- list(c(1,2,3), c("A","B","C"))
x[[2]][x[[2]]=="A"] <- "W"
str(x)

#6)
v <- list(a=1:10, b="Bom Dia!", c="Rural")
v[[1]][] <- 1
str(v)

#7)
v <- list(a=1:10, b="Bom Dia!", c="Rural")
length(v)
length(v$a)
