# 0315 Lab2 다변량
library(ggplot2)
library(tidyverse)

head(iris)
#iris: data frame , data class 등에 대한 정보는 주지 않는다. 
mpg
class(mpg)
# tibble , 변수 이름 아래에 class 정보를 줌
# 출력된 data와 출력되지 않은 data 정보를 줌
# 함수를 만든 사람이 지정한 data class
# mpg 변수 설명 , displ 배기량

ggplot(mpg, aes(x=displ, y=hwy))
# 그림을 그리기 위한 기본 정보
# 그림 그리는 배경만
# grammar of graphic , 층화형태로 +

#기본 산점도
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
# outliar 파악 쉬움
plot(mpg$displ, mpg$hwy, pch=16) 
# R 기본 plot 함수 

ggplot(mpg, aes(x=displ, y=hwy, color=class)) + geom_point()
ggplot(mpg, aes(x=displ, y=hwy, color=drv)) + geom_point()
# aes 함수는 다 들어갈 수 있음
# ggplot ( aes() ) 이하 함수에 모두 적용 가능  
# color = class class 별로 색깔 다르게. legend 제공

ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(aes(color=class))
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(aes(color='blue'))
# aes 에센팅 of mapping blue 라는 변수가 없어서 color 라는 범주 안에 blue 라는 변수 할당
# aes 변수 할당
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(color='blue')
# 색깔을 바꾸려고 하면 aes 사용 x , 바깥에서 

#Facceting
ggplot(mpg, aes(x=displ, y=hwy, color=class)) + geom_point() + facet_wrap(~class)
# class 별로 나누어서 graph

# loess    local regression
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth()
# 전반적인 추세선 그리기
# 어떻게 하면 자료를 잘 설명하는지
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth(span=0.2)
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth(method='lm')
ggplot(mpg, aes(x=displ, y=hwy)) + geom_smooth(method='lm')
# regression 


# 각 drv 별로 distribution 알기
ggplot(mpg, aes(drv, hwy)) + geom_point()
# 점이 겹쳐져있음, 실제 자료의 분포를 알 수 없음
ggplot(mpg, aes(drv, hwy)) + geom_point()+ geom_jitter()
#geom_jitter() 미세한 random value 주고 자료 흩뿌리기
ggplot(mpg, aes(drv, hwy)) + geom_violin()
ggplot(mpg, aes(hwy)) + geom_histogram() # 30 개가 default 
ggplot(mpg, aes(hwy)) + geom_freqpoly() 
# histogram 꼭대기 이어주기, 같은 그림에서 비교할때
ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth=2.5) 
ggplot(mpg, aes(hwy, color=drv)) + geom_freqpoly(binwidth=0.5) 
# drv 별로 색깔 다르게

ggplot(mpg, aes(displ, fill=drv)) + geom_histogram(binwidth=0.5) + facet_wrap(~drv, ncol=1)
# fill: 내부를 칠하는 option

ggplot(mpg, aes(manufacturer)) +geom_bar()
# bar chart 그리기

drug <- data.frame(drug=c("A",'B','C'), effect=c(4.2,9.7, 6.1))
ggplot(drug, aes(drug)) + geom_bar()
ggplot(drug, aes(drug, effect)) + geom_bar(stat='identity')
# stat='identity'  있는 그대로 그리기
ggplot(drug, aes(drug, effect)) + geom_point()

#시계열

ggplot(economics, aes(date, pop)) +geom_line()
ggplot(economics, aes(date, uempmed)) +geom_line()
# 자료 sorting 
ggplot(economics, aes(unemploy/pop,uempmed))+geom_path()+geom_point()
# 자료 번호 순서대로
ggplot(mpg,aes(cty,hwy))+geom_point(alpha=1/3)
# alpha 자료의 투명도 조절
ggplot(mpg,aes(cty,hwy))+geom_point(alpha=1/3)+
  xlab("city driving (mpg)")+ ylab("highway driving (mpg)")
ggplot(mpg,aes(cty,hwy))+geom_point(alpha=1/3)+
  xlab(NULL)+ ylab(NULL)
ggplot(mpg,aes(drv,hwy))+geom_jitter()
ggplot(mpg,aes(drv,hwy))+geom_jitter(width=0.25)

X11()
# active window 

ggplot(mpg,aes(drv,hwy))+geom_jitter(width=0.25)+
  xlim("f","r")+ylim(20,30)
# x,y 축 범위 그리기, 범위밖 data는 missing 처리

ggplot(mpg,aes(drv,hwy))+geom_jitter(width=0.25,na.rm=TRUE)+ylim(NA,30)

p<-ggplot(mpg,aes(displ,hwy,colour=factor(cyl)))+geom_point()
print(p)


