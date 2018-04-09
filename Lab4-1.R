#Lab4-1
getwd()
setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")
install.packages("dplyr")
install.packages("ICSNP")
library(dplyr)
library(ICSNP)
sweat<-read.csv("./Lab4-data/sweat.csv")
#첫줄에 변수명 저장되어있고, 읽어들임
summary(sweat)
colMeans(sweat)
apply(sweat,2,mean)
apply(sweat,2,sd)
apply(sweat,2,sum)

sweat$X1
t.test(sweat$X1)
#X1의 ttest , M0=0 디폴트값
# H0:M=M0
#alternative hypothesis: true mean is not equal to 0
t.test(sweat$X1, mu=4)
# H0:Mu=M0=4
#alternative hypothesis: true mean is not equal to 4
t.test(sweat$X1, mu=4, alternative="greater")
#alternative hypothesis: true mean is greater than 4
#95 percent confidence interval:
#3.983912      Inf
#mu0값이 이 신뢰구간 사이에 있으며 reject 못한다는 말
# R은 양측검정만 가능
#
t.test(sweat$X1, mu=4, alternative="less")
t.test(sweat$X1, mu=4, conf.level=0.99)
#confidence intervak조정

#문제
# p-value 0.108,0.16,0.93 reject X, a=0.1,0.5

HotellingsT2(sweat,mu=c(4,50,10))
#T.2 = 2.9045, df1 = 3, df2 = 17, p-value = 0.06493
#reject o when a=0.1

x.bar<-colMeans(sweat)
mu.0<- c(4,50,10)
mu.0
S<-var(sweat)
n<-nrow(sweat)
p<-ncol(sweat)
n
p
alpha<-0.05
alpha
T2<-n*t(x.bar-mu.0)%*%solve(S)%*%(x.bar-mu.0)
T2
T.2<-T2*(n-p)/(p*(n-1))
#compare wuth F-distribytion 
pf(T.2,p,(n-p))
1-pf(T.2,p,(n-p))
#pvalue

