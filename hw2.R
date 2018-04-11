getwd()
setwd("C:/Users/HS/Documents/GitHub/Multivariate-Statistical-Analysis")
college<-read.csv("college.csv")[,-c(1)]
head(college)
summary(college)

#1(a)
# Hotelling T-test
x.bar<-colMeans(college)
mu.0<-matrix(c(500,50,30),ncol=1)
S<-var(college)
n<-nrow(college)
p<-ncol(college)
alpha<-0.05
x.bar;mu.0;S;n;p


T2<-n*t(x.bar-mu.0)%*%solve(S)%*%(x.bar-mu.0)
T2
T2*(n-p)/((n-1)*p)

p.value <- 1-pf(T2*(n-p)/((n-1)*p),p,n-p)
p.value

crit.val<-(n-1)*p/(n-p)*qf(1-alpha,p,n-p)
crit.val

T2>crit.val

#reject the hypothesis at the level of alpha 0.05


#1(b)
# Bonferroni CI
crit.v<-qt(1-alpha/(2*p),n-1)
BSI1.L<-x.bar[1]-crit.v*sqrt(S[1,1]/n)
BSI1.U<-x.bar[1]+crit.v*sqrt(S[1,1]/n)
BSI2.L<-x.bar[2]-crit.v*sqrt(S[2,2]/n)
BSI2.U<-x.bar[2]+crit.v*sqrt(S[2,2]/n)
BSI3.L<-x.bar[3]-crit.v*sqrt(S[3,3]/n)
BSI3.U<-x.bar[3]+crit.v*sqrt(S[3,3]/n)
testBonfSI.f<-function(x)
{ ifelse(x[1]>BSI1.L & x[1]<BSI1.U & x[2]>BSI2.L & x[2]<BSI2.U& x[3]>BSI3.L & x[3]<BSI3.U,1,0)
}
testBonfSI.f(c)


CIb.col<-apply(Z,1,testBonfSI.f)

# Simultaneous CI
crit.v<-(n-1)*p/(n-p)*qf(1-alpha,p,n-p)
SI1.L<-x.bar[1]-sqrt(crit.v)*sqrt(S[1,1]/n)
SI1.U<-x.bar[1]+sqrt(crit.v)*sqrt(S[1,1]/n)
SI2.L<-x.bar[2]-sqrt(crit.v)*sqrt(S[2,2]/n)
SI2.U<-x.bar[2]+sqrt(crit.v)*sqrt(S[2,2]/n)
testSI.f<-function(x)
{ ifelse(x[1]>SI1.L & x[1]<SI1.U & x[2]>SI2.L & x[2]<SI2.U,1,0)
}
SI.col<-apply(Z,1,testSI.f)

