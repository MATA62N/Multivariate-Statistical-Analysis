# 0315 Lab2 �ٺ���
library(ggplot2)
library(tidyverse)

head(iris)
#iris: data frame , data class � ���� ������ ���� �ʴ´�. 
mpg
class(mpg)
# tibble , ���� �̸� �Ʒ��� class ������ ��
# ��µ� data�� ��µ��� ���� data ������ ��
# �Լ��� ���� ����� ������ data class
# mpg ���� ���� , displ ��ⷮ

ggplot(mpg, aes(x=displ, y=hwy))
# �׸��� �׸��� ���� �⺻ ����
# �׸� �׸��� ��游
# grammar of graphic , ��ȭ���·� +

#�⺻ ������
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
# outliar �ľ� ����
plot(mpg$displ, mpg$hwy, pch=16) 
# R �⺻ plot �Լ� 

ggplot(mpg, aes(x=displ, y=hwy, color=class)) + geom_point()
ggplot(mpg, aes(x=displ, y=hwy, color=drv)) + geom_point()
# aes �Լ��� �� �� �� ����
# ggplot ( aes() ) ���� �Լ��� ��� ���� ����  
# color = class class ���� ���� �ٸ���. legend ����

ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(aes(color=class))
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(aes(color='blue'))
# aes ������ of mapping blue ��� ������ ��� color ��� ���� �ȿ� blue ��� ���� �Ҵ�
# aes ���� �Ҵ�
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(color='blue')
# ������ �ٲٷ��� �ϸ� aes ��� x , �ٱ����� 

#Facceting
ggplot(mpg, aes(x=displ, y=hwy, color=class)) + geom_point() + facet_wrap(~class)
# class ���� ����� graph

# loess    local regression
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth()
# �������� �߼��� �׸���
# ��� �ϸ� �ڷḦ �� �����ϴ���
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth(span=0.2)
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth(method='lm')
ggplot(mpg, aes(x=displ, y=hwy)) + geom_smooth(method='lm')
# regression 


# �� drv ���� distribution �˱�
ggplot(mpg, aes(drv, hwy)) + geom_point()
# ���� ����������, ���� �ڷ��� ������ �� �� ����
ggplot(mpg, aes(drv, hwy)) + geom_point()+ geom_jitter()
#geom_jitter() �̼��� random value �ְ� �ڷ� ��Ѹ���
ggplot(mpg, aes(drv, hwy)) + geom_violin()
ggplot(mpg, aes(hwy)) + geom_histogram() # 30 ���� default 
ggplot(mpg, aes(hwy)) + geom_freqpoly() 
# histogram ����� �̾��ֱ�, ���� �׸����� ���Ҷ�
ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth=2.5) 
ggplot(mpg, aes(hwy, color=drv)) + geom_freqpoly(binwidth=0.5) 
# drv ���� ���� �ٸ���

ggplot(mpg, aes(displ, fill=drv)) + geom_histogram(binwidth=0.5) + facet_wrap(~drv, ncol=1)
# fill: ���θ� ĥ�ϴ� option

ggplot(mpg, aes(manufacturer)) +geom_bar()
# bar chart �׸���

drug <- data.frame(drug=c("A",'B','C'), effect=c(4.2,9.7, 6.1))
ggplot(drug, aes(drug)) + geom_bar()
ggplot(drug, aes(drug, effect)) + geom_bar(stat='identity')
# stat='identity'  �ִ� �״�� �׸���
ggplot(drug, aes(drug, effect)) + geom_point()

#�ð迭

ggplot(economics, aes(date, pop)) +geom_line()
ggplot(economics, aes(date, uempmed)) +geom_line()
# �ڷ� sorting 
ggplot(economics, aes(unemploy/pop,uempmed))+geom_path()+geom_point()
# �ڷ� ��ȣ �������
ggplot(mpg,aes(cty,hwy))+geom_point(alpha=1/3)
# alpha �ڷ��� ������ ����
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
# x,y �� ���� �׸���, ������ data�� missing ó��

ggplot(mpg,aes(drv,hwy))+geom_jitter(width=0.25,na.rm=TRUE)+ylim(NA,30)

p<-ggplot(mpg,aes(displ,hwy,colour=factor(cyl)))+geom_point()
print(p)

