install.packages("dplyr")
library(dplyr)

# filter: Seleciona linhas específicas, de acordo com uma condição que se 
# deseja.
filter(airquality, Temp<70, Wind>14)

# select: Utilizado na seleção de variáveis (colunas).
head(select(airquality, Temp, Wind))

# mutate: Usada para criar novas variáveis.
# Podemos utilizar variáveis criadas dentro do próprio comando.
df <- mutate(airquality, celsius = (airquality$Temp-32)/1.8)
head(df)

# arrange: Utilizada para ordenar as colunas (semelhante a função order()).
head(arrange(df, celsius))

# summarise e group_by: A função summarise() transforma um vetor em um único 
# número de acordo com uma função. 
# Geralmente ela é utilizada em conjunto da função group_by().
summarise(airquality, maxfahrenheit=max(Temp), Contador=n())
temp_by_month <- group_by(airquality, Month)
summarise(temp_by_month, maxfahrenheit=max(Temp))

# operador %>% (chamado de pipe): A grande vantagem do pacote e das funções em 
# formas de verbo aparece quando concatenamos várias operações em sequência com 
# o auxílio do operador %>%.
airquality %>%
  group_by(Month) %>%
  filter(Temp > 80) %>%
  summarise(
    SomaTemp = sum(Temp),
    mediaWind = mean(Wind)
  )
