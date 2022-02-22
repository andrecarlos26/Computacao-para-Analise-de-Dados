boat.names <- c("a", "b", "c", "d")
boat.colors <- c("black", "green", "pink", "blue")
boat.ages <- c(143, 53, 356, 23)
boat.prices <- c(53, 87, 54, 66)
boat.costs <- c(52, 80, 20, 100)

#Adicone o fato que os barcos precisam ser "black"
(boat.prices>70 | boat.prices<=60) & boat.colors=="black"
boat.names[(boat.prices>70 | boat.prices<=60) & boat.colors=="black"]

#Ou que os barcos tenham um custo menor que 80
(boat.colors=="blue" & boat.prices> 60) | boat.costs<80
boat.names[(boat.colors=="blue" & boat.prices>60) | boat.costs<80]
