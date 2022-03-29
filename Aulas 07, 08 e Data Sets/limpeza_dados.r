# Link para o arquivo
fileURL <- ""

# Download do arquivo
download.file(fileURL, destfile = paste(getwd(), "/Snail_feeding.csv", sep=""), 
              method = "curl")

# Carregando os dados
Caracol_data <- read.csv(file = "Snail_feeding.csv",
                        header = T,
                        strip.white = T,
                        na.strings = "",
                        stringsAsFactors = T)

# Removendo colunas inúteis
Caracol_data <- Caracol_data[, 1:7]

# Consertando coluna Sex
Caracol_data$Sex <- as.factor(Caracol_data$Sex)
levels(Caracol_data$Sex)
levels(Caracol_data$Sex)[2] <- "female"
levels(Caracol_data$Sex)[3] <- "male"
levels(Caracol_data$Sex)[3] <- "male"

# Consertando coluna Distance
Caracol_data$Distance <- as.character(Caracol_data$Distance)
Caracol_data$Distance <- as.numeric(Caracol_data$Distance)
which(is.na(Caracol_data$Distance))
Caracol_data[682,"Distance"] <- 0.58
Caracol_data[755,"Distance"] <- 0.356452

# Removendo linhas duplicadas
which(duplicated(Caracol_data))
index <- which(duplicated(Caracol_data))
Caracol_data <- Caracol_data[-index, ]

# Consertando coluna Depth
Caracol_data[which(Caracol_data$Depth > 2), ]
Caracol_data[8,6] <- 1.62

# Exportando dados
write.csv(Caracol_data, file= "Caracol_data_checked.csv", row.names = FALSE)
