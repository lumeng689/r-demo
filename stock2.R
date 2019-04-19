rm(list=ls())
# file.choose()
bank.data <- read.csv("C:/Users/86150/Documents/data.csv")
our.data <- data.frame(bank.data)
print(nrow(our.data))

question <- read.csv("C:/Users/86150/Documents/question.csv")
question.data <- data.frame(question)
print(nrow(question.data))

year1 <-  our.data[which(our.data$YEAR == 1), -1]

year2 <-  our.data[which(our.data$YEAR == 2), -1]

year3 <-  our.data[which(our.data$YEAR == 3), -1]

year4 <- question.data[, -1]


data.proc <- year1
year2$flag <- 0
year3$flag <-  0
year4$flag <-  0

for(i in 1: nrow(data.proc)) {
  for (j in 1: nrow(year2)) {
    if (data.proc[i, 'ROEy'] == year2[j, 'ROE'] &  year2[j, 'flag'] != 1) {
      data.proc[i, 'ROE2'] = year2[j, 'ROE']
      data.proc[i, 'ASSET2'] = year2[j, 'ASSET']
      data.proc[i, 'PM2'] = year2[j, 'PM']
      data.proc[i, 'GROWTH2'] = year2[j, 'GROWTH']
      data.proc[i, 'LEV2'] = year2[j, 'LEV']
      data.proc[i, 'ATO2'] = year2[j, 'ATO']
      data.proc[i, 'ROEy2'] = year2[j, 'ROEy']
      
      year2[j, 'flag'] = 1
      break
    }
  }
}

year2.f = subset(year2, flag == 0, -flag)
print(nrow(year2.f))
names(year2.f) <- c('ROE2','ASSET2', 'PM2','GROWTH2',  'LEV2',  'ATO2',  'ROEy2')

year2.f$ROE= NA
year2.f$ASSET= NA
year2.f$PM= NA
year2.f$GROWTH= NA
year2.f$LEV= NA
year2.f$ATO= NA
year2.f$ROEy= NA

data.proc <- rbind(data.proc, year2.f)

print(nrow(data.proc))


for(i in 1: nrow(data.proc)) {
  for (j in 1: nrow(year3)) {
    if (data.proc[i, 'ROEy2'] == year3[j, 'ROE'] &  year3[j, 'flag'] != 1) {
      data.proc[i, 'ROE3'] = year3[j, 'ROE']
      data.proc[i, 'ASSET3'] = year3[j, 'ASSET']
      data.proc[i, 'PM3'] = year3[j, 'PM']
      data.proc[i, 'GROWTH3'] = year3[j, 'GROWTH']
      data.proc[i, 'LEV3'] = year3[j, 'LEV']
      data.proc[i, 'ATO3'] = year3[j, 'ATO']
      data.proc[i, 'ROEy3'] = year3[j, 'ROEy']
      
      year3[j, 'flag'] = 1
      break
    }
  }
}

year3.f = subset(year3, flag == 0, -flag)
print(nrow(year3.f))

names(year3.f) <- c('ROE3','ASSET3', 'PM3','GROWTH3',  'LEV3',  'ATO3',  'ROEy3')

year3.f$ROE= NA
year3.f$ASSET= NA
year3.f$PM= NA
year3.f$GROWTH= NA
year3.f$LEV= NA
year3.f$ATO= NA
year3.f$ROEy= NA

year3.f$ROE2= NA
year3.f$ASSET2= NA
year3.f$PM2= NA
year3.f$GROWTH2= NA
year3.f$LEV2= NA
year3.f$ATO2= NA
year3.f$ROEy2= NA

data.proc <- rbind(data.proc, year3.f)


for(i in 1: nrow(data.proc)) {
  for (j in 1: nrow(year4)) {
    if (data.proc[i, 'ROEy3'] == year4[j, 'ROE'] &  year4[j, 'flag'] != 1) {
      data.proc[i, 'ROE4'] = year4[j, 'ROE']
      data.proc[i, 'ASSET4'] = year4[j, 'ASSET']
      data.proc[i, 'PM4'] = year4[j, 'PM']
      data.proc[i, 'GROWTH4'] = year4[j, 'GROWTH']
      data.proc[i, 'LEV4'] = year4[j, 'LEV']
      data.proc[i, 'ATO4'] = year4[j, 'ATO']
      
      year4[j, 'flag'] = 1
      break
    }
  }
}

year4.f = subset(year4, flag == 0, -flag)
print(nrow(year4.f))
names(year4.f) <- c('ROE4','ASSET4', 'PM4','GROWTH4',  'LEV4',  'ATO4')

year4.f$ROE= NA
year4.f$ASSET= NA
year4.f$PM= NA
year4.f$GROWTH= NA
year4.f$LEV= NA
year4.f$ATO= NA
year4.f$ROEy= NA

year4.f$ROE2= NA
year4.f$ASSET2= NA
year4.f$PM2= NA
year4.f$GROWTH2= NA
year4.f$LEV2= NA
year4.f$ATO2= NA
year4.f$ROEy2= NA

year4.f$ROE3= NA
year4.f$ASSET3= NA
year4.f$PM3= NA
year4.f$GROWTH3= NA
year4.f$LEV3= NA
year4.f$ATO3 = NA

year4.f$ROEy3 = NA


data.proc <- rbind(data.proc, year4.f)

print(nrow(data.proc))

head(data.proc)


write.csv(data.proc, "C:/Users/86150/Documents/one-to-one.csv")