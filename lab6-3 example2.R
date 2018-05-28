#Example 3 : Iris data

library(ggplot2)
library(GGally)
library(CCA)
library(MASS)

setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")

#sampling
data(iris)
head(iris)

set.seed(20080526)  
#돌릴때마다 값이 달라지는 것을 방지

training<-c(sample(1:50,size=40,replace=F),
            sample(51:100,size=40,replace=F),
            sample(101:150,size=40,replace=F))
#120개의 샘플 추출

training.D<-iris[training,]
test.D<-iris[-training,]
#training, test dataset
training.data<-training.D[,1:4]
training.group<-training.D[,5]
test.data<-test.D[,1:4]
test.group<-test.D[,5]

iris.LDA<-lda(training.data,training.group)
iris.LDA
#150개 그룹에서 120개 정보를 가지고 

error.training<-which(training.group!=predict(iris.LDA,training.data)$class)
training.D[error.training,]
error.test<-which(test.group!=predict(iris.LDA,test.data)$class)
test.D[error.test,]


LDA.data<-data.frame(predict(iris.LDA,iris[,-5])$x,
                     predict=predict(iris.LDA,iris[,-5])$class,
                     original=iris[,5])
#그룹정보를 빼고 projection 
LDA.data$error <-LDA.data$predict !=LDA.data$original
LDA.data
table(LDA.data$error)
LDA.data$error

ggplot(LDA.data,aes(LD1,LD2))+
  geom_point(aes(color=original,shape=predict,size=error))
LDA.data$test<- 1:150


error.training<-which(training.D[,5] !=predict(iris.LDA, training.D[,5])$class)
training.D[error.training,]


error.list<-which(oil.data$group !=predict(oil.LDA)$class)
oil.data[error.list,]
