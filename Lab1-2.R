#0315 Lab1 
library(ggplot2)
A<- matrix(1:10, ncol=5)
B<- matrix(11:20, ncol=5)
A
B
A+B
A*B
A%*%t(B)
# A transepose B

A <- matrix(c(1,2,1,2,3,5,1,5,6),ncol=3)
A

solve(A)
diag(A)
# 대각선 원소만 
diag(diag(A))

x1<- 1:3
x2<- 4:6
rbind(x1,x2)
cbind(x1,x2)

eigen(A)
# eigen values, eigen vectors 
# list 형태로 나타남

A.result <- eigen(A)
class(A.result)

A.result$values
# L
A.result$vectors
# e1, e2, e3 

L<- diag(A.result$values)
L
E<- A.result$vectors
E

E%*%L%*%t(E)
A

E[,1,drop=FALSE] %*% t(E[,1,drop=FALSE])
A.result$values[1] *E[]
E[,1,drop=FALSE]


A1<-
A2
A3

#inverse
L.inv<- diag(1/A.result$values)
E%*%L.inv%*%t(E)
# 자료르 표준화 시킬 떄 필요함
# 분산의 varianse covariance 로 들어갈 떄 이 과정이 필요함
