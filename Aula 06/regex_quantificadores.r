# Asterisco "*" qualquer quantidade
strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac*b", strings, value = TRUE)

# Mais "+" ao menos uma ocorrência
strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac+b", strings, value = TRUE)

# Opcional "?" no máximo uma ocorrência
strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac?b", strings, value = TRUE)

# Chaves "{n,m}" número mínimo e máximo de repetições
strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac{2}b", strings, value = TRUE)
grep("ac{2,}b", strings, value = TRUE)
grep("ac{2,3}b", strings, value = TRUE)
