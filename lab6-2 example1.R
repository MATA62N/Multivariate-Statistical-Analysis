#Example 2 : the crude-oil data

library(ggplot2)
library(GGally)
library(CCA)
library(MASS)


setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")
#LDA

oil.data<-read.csv("./Lab6-data/oil.csv")
head(oil.data)
tail(oil.data)
table(oil.data$group)

X<-oil.data[,1:5]
group<- oil.data $group
#group 정보와 X 정보를 나누었음
ggpairs(X,aes(color=group))
# 5가지 변수, subMuli -red, Upper - green, upper -blue
# X3, X1 green 과 나머지 두 그룹 구분 가능
# X5 blue 구분 가능


lda.result<-lda(X,group)  #numeric data(data.frame format), group data
lda.result
# y= B0+B1X1+B2X2
# y~ x1,x2  (in r)
# group ~ x1,x2,x3,x4,x5
# lda(X, group)

lad.result1<- lda(group~.,data=oil.data)
lad.result1
# 수식으로 쓰기

summary(lda.result)
lad.result$scaling

#group , x1,x2,x3,x4,x5  -> LD1, LD2

predict.save<- predict(lad.result) 
# 새로운 데이터가 들어왔을 때 나오는 데이터
summary(predict.save)
predict.save$x
#coefficient?
predict.save$class
#어떤 그룹에 들어갈 지 예측한 값
predict.save$posterior 
#각 그룹에 들어갈 확률


LDA.data <- data.frame(predict(lda.result)$x, 
                       predict=predict(lda.result)$class, #LDA 예측 결과
                       original=group) #원래 그룹
#같으면 제대로 된 것, 다르면 잘못된 것임
LDA.data$error<-LDA.data$predict!=LDA.data$original
LDA.data$error
error.list<-which(oil.data$group !=predict(oil.LDA)$class)
oil.data[error.list,]


ggplot(LDA.data,aes(LD1, LD2)) + 
  geom_point(aes(color=original))
ggplot(LDA.data,aes(LD1, LD2)) + 
  geom_point(aes(color=original, shape=predict))
ggplot(LDA.data,aes(LD1, LD2)) + 
  geom_point(aes(color=original, shape=predict, size=error))
#원래 색깔과 모양이 일치해야 함, 일치하지 않는 것이 잘못된 값


