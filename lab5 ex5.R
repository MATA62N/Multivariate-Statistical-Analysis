#lab5 Example3 stock price data
getwd()
stocks<-read.csv("./Lab5-data/stocks.csv")
head(stocks)
colMeans(stocks)
var(stocks)
round(var(stocks),6)

stockss<-scale(stocks, center=T, scale=T)
#data 표준화 
colMeans(stockss) #평균이 0 에 가까워짐 
var(stockss) 

#PCA  factor anaylsis
summary(princomp(stockss))
plot(princomp(stockss))
pairs(stocks)
pairs(stockss)
(f1<- factanal(stockss,factors=1))
## The p‐value is 0.00847  H0 reject, 1개로는 충분하지 않음
(f2<- factanal(stockss,factors=2))
## The p‐value is 0.448  H0 conclude, 2개면 ok

#rotation 
(f2.1<-factanal(stockss,factors=2,rotation="none"))
(f2.1<-factanal(stockss,factors=2,rotation="varimax"))

