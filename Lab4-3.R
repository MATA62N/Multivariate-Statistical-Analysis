 #Lab4-3
getwd()
library(ggplot2)

n<-100
p<-5
ex1<-data.frame(matrix(rnorm(n*p),ncol=p))
# use R i386 version   ÀÛµ¿ ¾ÈµÊ
#library(rggobi)
#ggobi(ex1)

Sigma1<-matrix(c(1, 0.6,0.5,-0.2, -0.3,
                 0.6 , 1, 0.2, -0.4,-0.2,
                 0.5 , 0.2 , 1 , 0.5, 0.1,
                 -0.2,-0.4 ,0.5, 1, 0.2,
                 -0.3,-0.2 ,0.1, 0.2, 1),ncol=5)
e.sigma1<-eigen(Sigma1)
Sigma1.5<-e.sigma1$vectors %*%
  diag(sqrt(e.sigma1$values))%*%
  t(e.sigma1$vectors)
ex2<-matrix(rnorm(n*p),ncol=p)%*%Sigma1.5

test<-read.csv("./Lab4-data/test.csv")
test

test.manova<-manova(cbind(X1,X2)~trt,data=test)
summary(test.manova,test=c("Wilks"))

plastic<-read.csv("./data/plastic.csv")
summary(plastic)

plastic.manova<-manova(cbind(X1,X2,X3)~
                         fac1+fac2+fac1*fac2,data=plastic)
summary(plastic.manova,test=c("Wilks"))

dog<-read.csv("./data/sleeping-dog.csv")
C1<-dog$TRT3+dog$TRT4-dog$TRT1-dog$TRT2
C2<-dog$TRT1+dog$TRT3-dog$TRT2-dog$TRT4
C3<-dog$TRT1+dog$TRT4-dog$TRT2-dog$TRT3
C.tot<-data.frame(C1=C1,C2=C2,C3=C3)
library(ICSNP)
HotellingsT2(C.tot)
x.mean<-colMeans(C.tot)
S<-var(C.tot)
n<-nrow(C.tot)
p<-ncol(C.tot)
T2<-n*t(x.mean)%*%solve(S)%*%x.mean
T2
T2*(n-p)/(p*(n-1))


test.manova= manova(cbind(X1,X2)~trt, data=test)
summary(test.manova)
summary(test.manova, test=c("Wilks"))
