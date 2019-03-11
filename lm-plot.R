data = read.table('./data/08 r hgfx1_data.txt', header = T)

head(data)
summary(data)

lm1 = lm(ROE ~ ROEt + ATO + PM + LEV + GROWTH + PB + ARR + INV + ASSET, data = data)
summary(lm1)

par(mfrow = c(2, 2))

plot(lm1, which = c(1:4))