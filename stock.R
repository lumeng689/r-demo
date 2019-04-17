rm(list=ls())
# file.choose()
bank.data <- read.csv("C:/Users/86150/Documents/data.csv")
our.data <- data.frame(bank.data)
print(nrow(our.data))

# The year 1 data
# names c('ROE','ASSET', 'PM','GROWTH',  'LEV',  'ATO',  'ROEy')
year1 <-  our.data[which(our.data$YEAR == 1), -1]

print(nrow(year1))
head(year1)
summary(year1)


# boxplot and hist
showStat <- function (yearStr, yearData) {
  cols <- ncol(yearData) - 1 # exclude ROEy
  for (i in 1: cols) {
    x <- yearData[,i]
    title <- paste(yearStr, names(yearData[i]))
    boxplot(x, main=title)
    hist(x, main=title)
  }
  
  
  for (i in 1: cols) {
    x <- log2(yearData[,i])
    title <- paste(yearStr, " LOG 2 dist", names(yearData[i]))
    boxplot(x, main= title)
    hist(x, main=title)
  }
  
}

# linear 
doLm <- function(yearStr, yearData) {
  c <- names(yearData)
  d <-  c[1: length(c) -1]
  print(d)
  lm1 = lm(as.formula(paste("ROEy ~", paste(d, collapse="+"))), data = yearData)
  summary(lm1)
}

showStat("Year 1", year1)
doLm("Year 1", year1)

# The year 2 data
year2 <-  our.data[which(our.data$YEAR == 2), -1]

print(nrow(year2))
head(year2)
summary(year2)

showStat("Year 2", year2)
doLm("Year 2", year2)

# The year 3 data
year3 <-  our.data[which(our.data$YEAR == 3), -1]

print(paste0("Year 3 total: ", nrow(year3)))
head(year3)
summary(year3)

showStat("Year 3", year3)
doLm("Year 3", year3)


