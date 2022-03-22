texto <- "Eu gosto de Cerveja! #cerveja, @cade_minha_cerveja, Eu gosto (v3.2.2)
#rr2020"

# remove espaços em branco ou tabs
gsub(pattern = "[[:blank:]]", replacement = "", texto)

# Substitui pontuação por espaçoes em branco
gsub(pattern = "[[:punct:]]", replacement = " ", texto)

# remove caracteres alfanuméricos
gsub(pattern = "[[:alnum:]]", replacement = "", texto)
