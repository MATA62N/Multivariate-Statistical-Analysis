# 0312 Lab1 Multivariate-Statistical-Analysis
install.packages("tidyverse")
install.packages('ggplot2')
library(tidyverse)
library(ggplot2)

#Assignment
X<-sqrt(2*3)
X
class(X)  
#스칼라 값 - 길이가 1인 벡터로 인식

ls(pos=1)

x<-c(-1,2,5)
x
x[1]
x[2]
x[3]

class
class(x)  
# numeric

xx<-c('A','B','C')
xx
class(xx) 
#charater

3:10
#3부터 10까지 가는 동안 1씩 증가
seq(3,10)
#sequence 만들기, 시작점, 끝점 지정, 1씩 증가
seq(3,10, by=0.5)
#sequence 만들기, 시작점, 끝점 지정, 0.5씩 증가
seq(3,10, length=6)
#sequence 만들기, 시작점, 끝점 지정, 값이 6개

#logical value T and F
a<- c(T,F)
a
as.numeric(a)
#숫자형 변수로 바꾸어줌
(1:5)>3
#[1] FALSE FALSE FALSE  TRUE  TRUE

#matrix
matrix(c(1,2,3,4,5,6),ncol=2)
#col number = 2, bycol is defaul. 
matrix(c(1,2,3,4,5,6),ncol=2, byrow=TRUE)
c(matrix(c(1,2,3,4,5,6),ncol=2))
c(matrix(c(1,2,3,4,5,6),ncol=2, byrow=TRUE))
# c()는 벡터 단위로 바꾸어 주는 함수

#data frames
#원자료를 typing 해서 입력하는 것이 아니라, csv file  을 불러들여서 
# continuous vs category variable
x<- rnorm(100)
#random number of nomal distrubution  100개
x1<- rnorm(100)
x2<- rt(df=3,100)
#random number of t-distribution, df 자유도
x3<- sample(1:10, 100,replace=TRUE)
#dafault FALSE 
x4<- sample(LETTERS[1:10],100,replace=TRUE)
LETTERS[1:10]
# 대문자 A to Z 에서 처음 10개

class(x1)
class(x4)

x.dat <- data.frame(A1=x1, A2=x2, A3=x3, A4=x4)
x.dat
#data frame 형식은 vector 길이가 같아야 함
#warning 제일 긴 벡터길이에 맞춰서 recycling : 길이 짧은 제일 앞 데이터를 뒤로

class(x.dat)
head(x.dat)
class(x.dat$A1)  #numeric
class(x.dat$A2)  #numeric
class(x.dat$A3)  #integer
class(x.dat$A4)  #factor
#facter 범주형 변수 : 첫번 째 범주의 이름이 A 이고 두번째 변수 이름이 B 라고 생각
class(x4)
#character 분석하기 전 상태

head(x.dat$A3)
head(x.dat$A4)
#level 
head(x4)

as.numeric(x4)
#다 못바꿈
as.numeric(x.dat$A4)
#다 바꿔준다
#범주형 변수를 처리하는 방법이 데이터 분석에서 중요


#list 
#data frame을 좀 더 자유롭게 한 형태
# matrix : 모든 원소가 하나의 class
# data frame : 모든 원소가 다른 class 
# list : 범주의 class 달라도됨, 길이도 달라도 됨
# list 만들 필요는 없지만 필요한 결과를 추출하기 위해서는 list 의 구조를 알아야 함

q<- list(name='Cox', wife='Marry',husband='Fred', no.child=3, child.age=c(4,6,9))
q


#sub-setting/selecting 
x<- 11:20
x
x[c(1,5,10)]
x[-c(1,5,10)]
x[(1:10)>5]
x[x>15]
x>15
which(x>15)
x[which(x>15)]
#which : 15보다 큰 수가 몇번쨰 인지?

#iris
dim(iris) 
# 150 5 
# 150 개의 observation 
# 5 개의 변수 
data(iris)
head(iris)
tail(iris)
class(iris)
# data frame 
# Species 는 '' 없음 factor
summary(iris)
#  Species 범주형 자료기 때문에 setosa , versicolor, virginica 각각 50개 

iris$Species=='setosa'
iris$Species=='virginica'
iris$Species=='virginica'

iris[iris$Species=='setosa',]

tail(iris[iris$Species=='setosa','Petal.Width'])
tail(iris[iris$Species=='setosa',c('Petal.Width','Petal.Length')])


#SAS 그룹별 평균 by Species
#R 그룹별 평균 tapply()
tapply(iris$Petal.Width, iris$Species, mean)
tapply(iris$Petal.Width, iris$Species, sd)


#Matrix Algebra 

#transpose %*% 
#solve()   : solve the linear system , inverse - > Ax=b , A,b 값을 주면 x 

