#1)
v1 <- c(3, 7, -5, -7)


#2)
v2 <- seq(1, 50, 1)

#3)
v3 <- c(v1, v2)

#4)
v4 <- seq(0.0, 6.0, 0.1)

#5)
fumante <- rep(c("sim", "não", "não"), 33)

#6)
sum(v1)
sum(v2)

#7)
prod(c(2, 30, 4, 5, 5))

#8)
X <- c(NA, 3, 14, NA, 33, 17, NA, 41)
X[!is.na(X)] #indexação lógica
X[c(2, 3, 5, 6, 8)] #indexação númerica
X[-which(is.na(X))] #which

#9)
sum(is.na(X))

#10)
X[is.na(X)] <- 0 ; X

#11)
xx <- c(1.7, "a")
xx <- c(TRUE, 2)
xx <- c("a", TRUE)
