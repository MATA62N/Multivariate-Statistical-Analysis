#hw1

A <- matrix(c(1,2,1,2,3,2,1,2,6),
            ncol=3, byrow=T)
A

#rank(A)
library(Matrix)
rankMatrix(A)
#eigenvalues, eigenvectors
eigen(A)
#spectral decomposition
P <-eigen(A)$vectors
E <-diag(eigen(A)$values)
P
E
P%*%E%*%t(E)

#trace(A)
diag(A)
#A inverse
E.inv <- diag(1/eigen(A)$values)
E.inv
#eigenvalues, eigenvectors A inverse
eigen(E.inv)
#spectral decomposition
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
