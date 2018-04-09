#Lab4-2
library(ggplot2)
getwd()
microwave<-read.csv("./Lab4-data/Microwave.csv")


S=var(microwave)
n=nrow(microwave)
p=ncol(microwave)
alpha=0.5


T2<-n*t(x.bar-mu.0)%*%solve(S)%*%(x.bar-mu.0)
p.value<-1-pf(T2*(n-p)/(p*(n-1)),p,n-p)

p<-c(1:20)
library(ggplot2)
apha<-0.05


#º¯È¯
Y1<-microwave$X1^0.25
Y2<-microwave$X2^0.25
microwave.mod<-data.frame(Y1=Y1,Y2=Y2)

plot1<-ggplot(microwave.mod,aes(x=Y1,y=Y2))+geom_point()

crit.val<-(n-1)*p/(n-p)*qf(1-alpha,p,n-p)
T2<-n*t(x.bar-mu.0)%*%solve(S)%*%(x.bar-mu.0)
crit.val
T2>crit.val





