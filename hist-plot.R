house = read.csv('./data/05 r sjms1_data.csv')
head(house)

hist(house$price)

hist(house$price, xlab="单位面积房价（万元/平方米）", ylab="频数", main="单位面积房价直方图", col="lightblue")

par(mfrow=c(1,2 ))

hist(house$price, breaks=10, xlab="单位面积房价（万元/平方米）", ylab="频数", main="单位面积房价直方图", col="lightblue")

hist(house$price, breaks=100, xlab="单位面积房价（万元/平方米）", ylab="频数", main="单位面积房价直方图", col="lightblue")
