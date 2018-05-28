library(ggplot2)
library(GGally)
library(CCA)
setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")
tot.data<- read.csv("./lab6-data/cc-1.csv")
tot.data

#y1 x1 정도만 데이터 상관관계가 있어보임

ggpairs(tot.data)
n<-row(tot.data)
Y<-tot.data[,1:2]
X<-tot.data[,3:5]
matcor(X,Y)

cc.result<-cc(X,Y)
cc.result
summary(cc.result)    #사람들이 만들떄 print 문 안넣었음 list 형태
# correlation matrix 
# U1 U2, V1, V2 coefficient xcoet, ycoef
cc.result$xcoef  #U1 U2
cc.result$ycoef  #V1 V2
summary(lm(Y1~X1, tot.data))
str(cc.result)

CCA.data<-data.frame(U1=cc.result$scores$xscores[,1],
                     U2=cc.result$scores$xscores[,2],
                     V1=cc.result$scores$yscores[,1],
                     V2=cc.result$scores$yscores[,2])
ggplot(CCA.data,aes(U1,V1))+geom_point()+ggtitle("1st canonical plot")
#U1, V1 은 correlation 이 높음
ggplot(CCA.data,aes(U2,V2))+geom_point()+ggtitle("2nd canonical plot")
#U2, V2 은 correlation 낮음, U2, V2은 사용할 필요가 없음


tot.cor<-matcor(X,Y)
img.matcor(tot.cor,type=1)
img.matcor(tot.cor,type=2)
# 추후분석은 알아서 하기 
# U1 overall mean

