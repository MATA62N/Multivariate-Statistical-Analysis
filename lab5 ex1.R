#Example1 : Female turtle
setwd("c:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")
getwd()


female<-read.csv("./Lab5-data/ex8-4-female.csv")

head(female)

female<-log(female)
pairs(female,main="Female")
var(female)
female.PC<-princomp(female)
female.PC
prcomp(fmale)
plot(female.PC)
loadings(female.PC)
#comp.1 overall size
#comp.2 1,2 contrast
#comp.3 3 0에 가까움

female.PC1<-prcomp(female)
female.PC1
#prcomp, loading 뭘 쓰던지 사관 없음 
#loading - x변수 변환 할 때 coeifficient 
female.PC1$rotation
predict(female.PC)
pairs(predict(female.PC))
