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
    # jpeg(file=paste0("boxplot_", title, ".jpeg"))
    boxplot(x, main=title)
    # dev.off()
    jpeg(file=paste0("hist_", title, ".jpeg"))
    # hist(x, main=title)
    # dev.off()
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

# roe > 0 year 1
roeYear1.gt0 <- subset(our.data, ROE > 0 & YEAR == 1)
# roe > 0 year 2
roeYear2.gt0 <- subset(our.data, ROE > 0 & YEAR == 2)
# roe > 0 year 3
roeYear3.gt0 <- subset(our.data, ROE > 0 & YEAR == 3)

write.csv(roeYear1.gt0, "C:/Users/86150/Documents/roe-year1-gt0.csv")
write.csv(roeYear2.gt0, "C:/Users/86150/Documents/roe-year2-gt0.csv")
write.csv(roeYear3.gt0, "C:/Users/86150/Documents/roe-year3-gt0.csv")

save(year3, "C:/Users/86150/Documents/year3.csv")

# change year2 column name
year2x <- year2
names(year2x) <- paste0(names(year2x), "2")
head(year2x)
year2x$ROEy <- year2x$ROE2

# change year3 column name
year3x <- year3
names(year3x) <- paste0(names(year3x), "3")
head(year3x)
year3x$ROEy2 <- year3x$ROE3


#year12 <- merge(year1, year2x, by.x="ROEy", by.y="ROE2")
year12 <- merge(year1, year2x, by="ROEy")

#year123 <- merge(year12, year3x, by.x="ROEy2", by.y="ROE3")
year123 <- merge(year12, year3x, by="ROEy2")

write.csv(year123, "C:/Users/86150/Documents/year123.csv")

year12Roe.gt0 <-  subset(year12, ROE > 0 | ROE2 > 0)

head(year12Roe.gt0)
# write.csv(year12, "C:/Users/86150/Documents/year12.csv")
write.csv(year12Roe.gt0, "C:/Users/86150/Documents/year12-roe-gt0.csv")

year12Roe.22 <-  subset(year12, ROE < 0 & ROE2 > 0)
head(year12Roe.22)
write.csv(year12Roe.22, "C:/Users/86150/Documents/year12-roe-22.csv")

# change year3 column name
year3x <- year3
names(year3x) <- paste0(names(year3x), "3")
head(year3x)