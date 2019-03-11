house = read.csv('./data/07 r sjms3_data.csv', fileEncoding = "GBK")
head(house)

boxplot(house$price)

par(mfrow=c(1,2))

boxplot(price~school, data=house)
boxplot(price~school, data=house, col=c('lightblue', 'lightpink'), names=c('非学区', '学区'), ylab="单位面积房价（万元/平方米）")

boxplot(price~school, data=house, horizontal= T, col=c('lightblue', 'lightpink'), names=c('非学区', '学区'), ylab="单位面积房价（万元/平方米）")
boxplot(price~school, data=house, varwidth=TRUE, col=c('lightblue', 'lightpink'), names=c('非学区', '学区'), ylab="单位面积房价（万元/平方米）")

