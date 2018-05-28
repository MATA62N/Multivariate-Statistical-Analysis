#Example 4 : Public Utility data

library(ggplot2)
library(GGally)
library(CCA)
library(MASS)

setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")

utility<-read.csv("./Lab6-data/public.csv")
head(utility)  
util.data<-utility[,1:8]
rownames(util.data)<-utility[,9]  # 9번째 observation name 
dist.util<-dist(util.data,method="euclidean") # 유클라디안 거리

# h cluster 
h.complete<-hclust(dist.util,method="complete")  #거리 matrix,방법
summary(h.complete)
#어느 지점에서 합쳐지는지 알 수 있음
plot(h.complete,hang=-1,main="complete linkage")
# hang= -1 줄맞춤 

#자르기, cluster 결과정보
#1,2,3의 순서없음 , 그룹이름
cutree(h.complete, h=7000) #높이에서 나누기
cutree(h.complete, k=3) #그룹개수 3개로 나누기

h.complete<-hclust(dist.util,method="single")
plot(h.complete,hang=-1,main="single linkage")
cutree(h.complete,h=1900)
cutree(h.complete,k=3)

h.complete<-hclust(dist.util,method="average")
plot(h.complete,hang=-1,main="average linkage")
cutree(h.complete,h=4000)
cutree(h.complete,k=3)

kmeans.util<-kmeans(util.data,3) 
#몇 개의 클러스터로 나눌 것인지 제시
kmeans.util

#group 정보가 없을 때 clustering 해보기
util.data$cluster<-kmeans.util$cluster
util.LDA<-lda(util.data[,-9],util.data[,9])
LDA.data<-data.frame(predict(util.LDA)$x,
                     predict=predict(util.LDA)$class,
                     cluster=as.factor(util.data[,9]))
LDA.data$error <-LDA.data$predict !=LDA.data$cluster
head(LDA.data)
ggplot(LDA.data,aes(LD1,LD2))+geom_point(aes(color=cluster,shape=predict,size
                                             =error))








