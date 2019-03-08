getwd()

house = read.csv('./data/06 r sjms2_data.csv')
head(house)

a = table(house$floor);a
barplot(a)

a = a[order(a, decreasing = 1)]
barplot(a)

barplot(a, names.arg = c("高层", "中层", "低层", "地下室"),main="二手房楼层分布柱状图", xlab="楼层高度", ylab="频数", col=rainbow(5, alpha = 0.4))

b = table(house$CATE, house$school);b
#
barplot(b, names.arg = c("非学区房", "学区房"), beside=T, col=rainbow(6, alpha=0.4), legend.text=c('朝阳','东城','丰台','海淀','石景山','西城'))
# 
barplot(b, names.arg = c("非学区房", "学区房"), beside=F, col=rainbow(6, alpha=0.4), legend.text=c('朝阳','东城','丰台','海淀','石景山','西城'))
