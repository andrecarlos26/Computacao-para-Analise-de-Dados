View(InsectSprays)

#Vai dar erro
df <- InsectSprays %>%
  spread(key="spray", value="count")

df <- InsectSprays %>%
  group_by(spray) %>%
  mutate(grouped_id = row_number())
  
df <- df %>%
  spread(key="spray", value="count") %>%
  select(-grouped_id)
