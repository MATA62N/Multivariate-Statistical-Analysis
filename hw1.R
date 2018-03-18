#hw1

A <- matrix(c(1,2,1,2,3,2,1,2,6),
            ncol=3, byrow=T)
A

#1 rank(A)
library(Matrix)
rankMatrix(A)
#2 eigenvalues, eigenvectors
eigen(A)
#3 spectral decomposition
P <-eigen(A)$vectors
E <-diag(eigen(A)$values)
P
E
P%*%E%*%t(P)

#4 trace(A)
diag(A)
#5 A inverse
E.inv <- diag(1/eigen(A)$values)
E.inv
#6 eigenvalues, eigenvectors A inverse
eigen(E.inv)
#7 spectral decomposition
P%*%E.inv%*%t(P)
#8
B<- A%*%t(A)
B
#9 
eigen(B)
#10
diag(1/eigen(B)$values)
#11
C<- A%*%A
C
#12
P%*%C%*%t(P)
