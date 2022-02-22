#1)
x <- factor(c(1, 2, 3, 3, 5, 3, 2, 4, NA))
levels(x)

#2)
f <- factor(c("a", "a", "b", "c", "c", "d"))
f[f == "a"]
f[f %in% c("b", "c")]
f[1:3]
f[-3]

#3)
mths <- c("March", "April", "January", "November", "January", "September", 
          "October", "September", "November", "August", "January", "November",
          "November", "February", "May", "August", "July", "December", "August",
          "August", "September", "November", "February", "April")

mths <- factor(mths, 
               levels = c("January", "February", "March", "April", "May", "June"
                          , "July", "August", "September", "October", "November"
                          , "December"),
               ordered = TRUE)
table(mths)

#4)
Resposta <- factor(c("Concordo", "Concordo", "Concordo Plenamente", "Discordo", 
                     "Concordo"))
Resposta <- factor(Resposta, levels = c("Concordo Plenamente", "Concordo", 
                                        "Discordo Plenamente", "Discordo"),
                   ordered = TRUE)

#5)
z <- factor(c("p", "q", "p", "r", "q"))
levels(z)[levels(z)=="p"] <- "w"
z
