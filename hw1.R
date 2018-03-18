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
P%*%E%*%t(P)
#4 trace(A)
sum(diag(A))

#5 A inverse
A.inv<-solve(A)
A.inv
#6 eigenvalues, eigenvectors A inverse
eigen(A.inv)
#7 spectral decomposition
P <-eigen(A.inv)$vectors
E <-diag(eigen(A.inv)$values)
P%*%E%*%t(P)


#8 AA'
B<- A%*%t(A)
B
#9 eigenvalues and eigenvectors of AA'
eigen(B)

#10 inverse of AA'
solve(B)
#11 AA
C<- A%*%A
C
#12 spectral decomposition of AA
P <-eigen(C)$vectors
E <-diag(eigen(C)$values)
P%*%E%*%t(P)
