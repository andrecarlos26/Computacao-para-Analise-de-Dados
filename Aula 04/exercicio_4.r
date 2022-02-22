#1)
gl(2,100,labels=c("M","F"))

#2)
drinks <- factor(c("beer", "beer", "wine", "water"))
mean(drinks=="beer")

#3)
drinks <- factor(c("beer", "beer", "wine", "water"))
levels(drinks)[1] <- "water"
drinks

#4)
