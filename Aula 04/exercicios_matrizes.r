#1)
x <- matrix(c(7,3,9,8,1,8,9,5,6), 3, 3)
det(x) #Determinante
t(x) #Transposta
solve(x) #Inversa

#2)
x[1,]
x[2,]
x[,2]
x[1,2]
x[,2:3]

#3)
x <- c(7,1,3)
y <- c(8,6,4)
z <- c(9,2,5)
A <- matrix(c(x,y,z), ncol=3)
rownames(A) <- c("a", "b", "c")

#4)
v <- 1:12
A <- matrix(v, 4, 3)
colnames(A) <- c("x", "y", "z")
rownames(A) <- c("a", "b", "c", "d")

#5)
A <- matrix(v, 4, 3, byrow=TRUE)

#6)
m <- matrix(c(1,2,3,4), nrow=2)
m[2,2]
3*m
m+m
m>2
sum(m == 3)
