rm(list=ls())
# file.choose()
bank.data <- read.csv("C:/Users/86150/Documents/bank.csv")
our.data <- data.frame(bank.data)

y <- our.data$aum
for (i in 14: ncol(our.data)) {
  x <- our.data[,i]
  col_name <- names(our.data[i])
  plot(x=x,y=y,type="p",main=paste("aum vs", col_name),xlab=col_name, ylab="aum") #散点�?
}


our.data

our.data1 <- our.data[which(our.data$insurance200_m > 500), ]
# summary(our.data1)
class(our.data$insurance200_m)
#our.data1 <- our.data$insurance200_m > 500

our.data1


x1 <- our.data$deposit30_n
class(x1)
x2 <- our.data[,14]
class(x2)

str(our.data)
library(ggplot2)

#客户增长的线性回�?

y1 <- our.data$customer  #客户新增户数

customer.lm.data <- data.frame(y1)

x1 <- our.data$trust_n  #信托销售笔�?
customer.lm.data$x1 <- x1

x2 <- our.data$fund_n  #私募销售笔�?
customer.lm.data$x2 <- x2

x3 <- our.data$financing_n  #大单理财销售笔�?
customer.lm.data$x3 <- x3

x4 <- our.data$family.trust_n  #家族信托销售笔�?
customer.lm.data$x4 <- x4

x5 <- our.data$deposit100_n  #100万以上定期销售笔�?
customer.lm.data$x5 <- x5

x6 <- (our.data$deposit50_n - our.data$deposit100_n)  #50-100万定期销售笔�?
customer.lm.data$x6 <- x6

x7 <- (our.data$deposit30_n - our.data$deposit50_n)  #30-50万定期销售笔�?
customer.lm.data$x7 <- x7

x8 <- our.data$gold50_n  #黄金销�?50万以上笔�?
customer.lm.data$x8 <- x8

x9 <- (our.data$gold25_n - our.data$gold50_n)  #黄金销�?25-50万笔�?
customer.lm.data$x9 <- x9

x10 <- (our.data$gold20_n - our.data$gold25_n)  #黄金销�?20-25万笔�?
customer.lm.data$x10 <- x10

x11 <- our.data$insurance30_n  #期缴保险30万以上笔�?
customer.lm.data$x11 <- x11

x12 <- (our.data$insurance25_n-our.data$insurance30_n)  #期缴保险25-30万笔�?
customer.lm.data$x12 <- x12

x13 <- (our.data$insurance20_n-our.data$insurance25_n)  #期缴保险20-25万笔�?
customer.lm.data$x13 <- x13

x14 <- our.data$insurance200_n  #趸缴保险200万以上笔�?
customer.lm.data$x14 <- x14

x15 <- (our.data$insurance150_n-our.data$insurance200_n)  #趸缴保险150-200万笔�?
customer.lm.data$x15 <- x15

x16 <- (our.data$insurance100_n-our.data$insurance150_n)  #趸缴保险100-150万笔�?
customer.lm.data$x16 <- x16

customer.lm.model <- lm(customer.lm.data)
summary(customer.lm.model)