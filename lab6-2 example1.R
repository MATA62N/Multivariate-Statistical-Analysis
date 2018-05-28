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
#group ������ X ������ ��������
ggpairs(X,aes(color=group))
# 5���� ����, subMuli -red, Upper - green, upper -blue
# X3, X1 green �� ������ �� �׷� ���� ����
# X5 blue ���� ����


lda.result<-lda(X,group)  #numeric data(data.frame format), group data
lda.result
# y= B0+B1X1+B2X2
# y~ x1,x2  (in r)
# group ~ x1,x2,x3,x4,x5
# lda(X, group)

lad.result1<- lda(group~.,data=oil.data)
lad.result1
# �������� ����

summary(lda.result)
lad.result$scaling

#group , x1,x2,x3,x4,x5  -> LD1, LD2

predict.save<- predict(lad.result) 
# ���ο� �����Ͱ� ������ �� ������ ������
summary(predict.save)
predict.save$x
#coefficient?
predict.save$class
#� �׷쿡 �� �� ������ ��
predict.save$posterior 
#�� �׷쿡 �� Ȯ��


LDA.data <- data.frame(predict(lda.result)$x, 
                       predict=predict(lda.result)$class, #LDA ���� ���
                       original=group) #���� �׷�
#������ ����� �� ��, �ٸ��� �߸��� ����
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
#���� ����� ����� ��ġ�ؾ� ��, ��ġ���� �ʴ� ���� �߸��� ��

