#1)
fileURL <- "https://raw.githubusercontent.com/ndphillips/ThePiratesGuideToR/master/data/caffeinestudy.txt"
download.file(fileURL, destfile = paste(getwd(), "/caffeinestudy.txt", sep=""), 
              method = "curl")
cafeina <- read.table("caffeinestudy.txt", header=T)

#2)
cafeina %>%
  group_by(gender) %>%
  summarise(idadeMedia = mean(age))
  
aggregate(formula = age ~ gender,
          FUN = mean,
          data = cafeina)

#3)
cafeina %>%
  group_by(drink) %>%
  summarise(idadeMedia = mean(age))

aggregate(formula = age ~ drink,
          FUN = mean,
          data = cafeina)

#4)
cafeina %>%
  group_by(gender, drink) %>%
  summarise(idadeMedia = mean(age))

#5)
cafeina %>%
  group_by(age) %>%
  summarise(scoreMediana = median(score))

aggregate(formula = score ~ age,
          FUN = median,
          data = cafeina)

#6)
cafeina %>%
  filter(gender == "male") %>%
  group_by(age) %>%
  summarise(scoreMediana = median(score))

aggregate(formula = score ~ age,
          FUN = max,
          subset = gender == "male",
          data = cafeina)

#7)
cafeina %>%
  group_by(drink) %>%
  summarise(Media = mean(score),
            Mediana = median(score),
            Maximo = max(score),
            DP = sd(score))

#8)
cafeina %>%
  filter(gender=="female") %>%
  filter(age>20) %>%
  group_by(drink, cups) %>%
  summarise(Media = mean(score),
            Mediana = median(score),
            Maximo = max(score),
            DP = sd(score))
