
lst <- lapply(1: 10, function(i) {paste0("x",i)})
lst

c <- c(lst)

c


v <- vector()
for (i in 1: ncol(our.data)) {
  c <- paste0("x",i)
  v[i] <- c
}

colnames(our.data) <- c(v)



ouput <- sapply(1: 10, function(v) return(paste0("x", v)))
ouput