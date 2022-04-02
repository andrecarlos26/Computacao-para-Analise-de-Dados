install.packages("tidyr")
library(tidyr)

# gather
# Transformando o nome das linhas em colunas
USArrests$State <- rownames(USArrests)
head(USArrests)

df1 <- USArrests %>%
  gather(key="tipo_crime", value="valor", -State)
head(df1)

#spread
df2 <- df1 %>%
spread(key ="tipo_crime", value="valor")
head(df2)

#unite
df3 <- df2%>%
  unite(col = "Murder_Assault",
        Murder, Assault,
        sep = "_")
head(df3)

#separate
df4 <- df3%>%
  separate( col = "Murder_Assault",
            into = c("Murder", "Assault"),
            sep = "_")
head(df4)
