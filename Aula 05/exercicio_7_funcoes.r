prisoes <- function(estados, tiposPrisoes){
  if (FALSE %in% (estados %in% rownames(USArrests))){
    resultado <- "Estado Inválido"
  }
  else if (FALSE %in% (tiposPrisoes %in% colnames(USArrests))){
    resultado <- "Tipo de Prisão Inválida"
  }
  else{
    p = sum(USArrests[estados, tiposPrisoes])
    um_estado <- length(estados) == 1
    resultado <- paste("O total de prisoes", 
                       ifelse(um_estado,"do estado","dos estados"), 
                       toString(estados), "é", p)
  }
  return(resultado)
}

prisoes(estados="Oregon", tiposPrisoes=c("Rape","Murder"))
prisoes(estados=c("Nevada","Washington"), tiposPrisoes=c("UrbanPop","Assault"))
prisoes(estados="Pernambuco", tiposPrisoes=c("Rape","Murder"))

minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0, VA_2=0, VA_3=0, 
                          Opt=1, threshold=7){

  #Substitui NAs por 0
  Exe_1[is.na(Exe_1)] <- 0
  Exe_2[is.na(Exe_2)] <- 0
  
  #Média da 1VA
  if (Opt==1){
    
    #Validação da quantidade de notas
    if (length(VA_1)!=1){
      return("Quantidade de Notas Inválidas para a 1 VA!")
    }
    
    #Validação de notas entre 0 e 10
    if (T%in%(Exe_1<0|Exe_1>10) | VA_1<0|VA_1>10){
      return("Nota(s) Inválida(s) para a 1 VA!")
    }
    
    media_VA1 <- ((mean(Exe_1)*5) + (VA_1*5))/10
    texto <- paste("Média da 1VA:", media_VA1, 
                   ifelse(media_VA1>=threshold, "-- Acima da Média", 
                          "-- Abaxo da Média"))
    return(texto)
    
  }
  
  #Média da 2VA
  else if (Opt==2){
    
    #Validação da quantidade de notas
    if (length(Proj)!=1 | length(VA_2)!=1){
      return("Quantidade de Notas Inválidas para a 2 VA!")
    }
    
    #Validação de notas entre 0 e 10
    if (T%in%(Exe_2<0|Exe_2>10) | Proj<0|Proj>10 | VA_2<0|VA_2>10){
      return("Nota(s) Inválida(s) para a 2 VA!")
    }
    
    media_VA2 <- ((mean(Exe_2)*2) + (Proj*5) + (VA_2*3))/10
    texto <- paste("Média da 2VA:", media_VA2, 
                   ifelse(media_VA2>=threshold, "-- Acima da Média", 
                          "-- Abaxo da Média"))
    return(texto)
    
  }
  
  #Média da 3VA
  else if (Opt==3){
    
    #Validação da quantidade de notas
    if (length(VA_3)!=1){
      return("Quantidade de Notas Inválidas para a 3 VA!")
    }
    
    #Validação de notas entre 0 e 10
    if (VA_3<0|VA_3>10){
      return("Nota(s) Inválida(s) para a 3 VA!")
    }
    
    texto <- paste("Média da 3VA:", media_VA3, 
                   ifelse(media_VA3>=threshold, "-- Acima da Média", 
                          "-- Abaxo da Média"))
    return(texto)
    
  }
  
  #Média Final
  else if (Opt==4){
    
    #Validação da quantidade de notas
    if (length(VA_1)!=1 | length(Proj)!=1 | length(VA_2)!=1 | length(VA_3)!=1){
      return("Quantidade de Notas Inválidas para a Média Final!!")
    }
    
    #Validação de notas entre 0 e 10
    if (T%in%(Exe_1<0|Exe_1>10) | VA_1<0|VA_1>10 | T%in%(Exe_2<0|Exe_2>10) | 
        Proj<0|Proj>10 | VA_2<0|VA_2>10 | VA_3<0|VA_3>10){
      return("Nota(s) Inválida(s) para a Média Final!")
    }
    
    #Calcula as médias da VAs
    media_VA1 <- ((mean(Exe_1)*5) + (VA_1*5))/10
    media_VA2 <- ((mean(Exe_2)*2) + (Proj*5) + (VA_2*3))/10
    
    #Maiores notas: VA2 e VA3
    if (min(media_VA1, media_VA2, VA_3) == media_VA1){
      mediaGeral <- (media_VA2 + VA_3) / 2
    }
    
    #Maiores notas: VA1 e VA3
    else if (min(media_VA1, media_VA2, VA_3) == media_VA2){
      mediaGeral <- (media_VA1 + VA_3) / 2
    }
    
    #Maiores notas: VA1 e VA2
    else if(min(media_VA1, media_VA2, VA_3) == VA_3){
      mediaGeral <- media_VA1 + media_VA2 / 2
    }
    
    texto <- paste(mediaGeral, ifelse(mediaGeral>=7, "-- Aprovado!!", "-- Na Final!!"))
    return(texto)
    
  }
  
  else{
    return("Opção Inválida!")
  }
  
}
