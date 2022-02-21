#5)
sum((10:20)^2)

#6)
X <- 133
Y <- 36
Z <- X+Y
raiz_Z <- sqrt(Z)
log_raiz_Z <- log(raiz_Z)
round(log_raiz_Z, 0) #Resposta: 3

#7)
soma_fib <- sum(0,1,1,2,3)
log_soma_fib = log(soma_fib)
round(log_soma_fib, 3) #Resposta: 1,946

#8)
dx <- deriv(~ sin(x)+x, "x")
x <- 2
v_deriv <- attr(eval(dx), "gradient")
round(v_deriv, 3) #Resposta: 0,584

#9)
fat_10 <- factorial(10)
log_fat10 <- log10(fat_10)
round(log_fat10, 2) #Resposta: 6,56

#10)
c <- 300000000
m <- 10
E <- m*(c^2)
log_E <- log(E)
round(log_E, 2) #Resposta: 41,34

#11)
v <- c(2,5,7,8,9)
f_v <- v^3 + v^2 + v
mean(f_v) #Resposta: 394,2
