install.packages("CCA")
library(CCA)
# canonical correlations of covariance (unstandardized data)
cca <- cancor(X, Y)
# cca (the normal way)
Sx <- cov(X)
Sy <- cov(Y)
Sxy <- cov(X,Y)
Sxeig <- eigen(Sx, symmetric=TRUE)
Sxisqrt <- Sxeig$vectors %*% diag(1/sqrt(Sxeig$values)) %*% t(Sxeig$vectors)
Syeig <- eigen(Sy, symmetric=TRUE)
Syisqrt <- Syeig$vectors %*% diag(1/sqrt(Syeig$values)) %*% t(Syeig$vectors)
Xmat <- Sxisqrt %*% Sxy %*% solve(Sy) %*% t(Sxy) %*% Sxisqrt
Ymat <- Syisqrt %*% t(Sxy) %*% solve(Sx) %*% Sxy %*% Syisqrt
Xeig <- eigen(Xmat, symmetric=TRUE)
Yeig <- eigen(Ymat, symmetric=TRUE)
# compare correlations (same)
cca$cor
#[1] 0.7702006 0.5033532 0.4184145 0.3052556
rho <- sqrt(Xeig$values)
rho
#[1] 0.7702006 0.5033532 0.4184145 0.3052556
sqrt(Yeig$values[1:p])
#[1] 0.7702006 0.5033532 0.4184145 0.3052556


# standardize data
(Xs <- scale(X))
(Ys <- scale(Y))
(XYs<-scale(XY))
# canonical correlations of correlation (standardized data)
ccas <- cancor(Xs, Ys)
# cca (the normal way)
(Sx <- Xs)
(Sy <- Ys)
(Sxy <- XYs)
Sxeig <- eigen(Sx, symmetric=TRUE)
Sxisqrt <- Sxeig$vectors %*% diag(1/sqrt(Sxeig$values)) %*% t(Sxeig$vectors)
Syeig <- eigen(Sy, symmetric=TRUE)
Syisqrt <- Syeig$vectors %*% diag(1/sqrt(Syeig$values)) %*% t(Syeig$vectors)
Xmat <- Sxisqrt %*% Sxy %*% solve(Sy) %*% t(Sxy) %*% Sxisqrt
Ymat <- Syisqrt %*% t(Sxy) %*% solve(Sx) %*% Sxy %*% Syisqrt
Xeig <- eigen(Xmat, symmetric=TRUE)
Yeig <- eigen(Ymat, symmetric=TRUE)
# compare correlations (same)
ccas$cor

[1] 0.7702006 0.5033532 0.4184145 0.3052556
> sqrt(Xeig$values)
[1] 0.7702006 0.5033532 0.4184145 0.3052556
> sqrt(Yeig$values[1:p])
[1] 0.7702006 0.5033532 0.4184145 0.3052556

# compare linear combinations (different?)
> Ahat <- Sxisqrt %*% Xeig$vectors
> Bhat <- Syisqrt %*% Yeig$vectors
> sum((ccas$xcoef * sqrt(n-1) - Ahat)^2)
[1] 3.332536e-29
> sum((ccas$ycoef[,1:p] * sqrt(n-1) - Bhat[,1:p])^2)
[1] 11.59453
# note that the signing is arbitary!!
> ccas$ycoef[,1:p] * sqrt(n-1)
> Bhat[,1:p]
[,1] [,2] [,3] [,4]
[1,] 0.1439138 -0.2404940 -0.5274876 -0.13754449
[2,] 0.1373435 0.7655659 1.2826821 0.96359176
[3,] -0.3023537 -1.0519285 0.1514027 -0.52923644
[4,] 0.4396044 -1.0374417 -0.6303782 0.49905604
[5,] 0.3564702 0.4110878 0.0253127 -1.09325282
[6,] 0.1855627 0.5731149 0.2615838 -0.09007821
> Bhat[,1:p] <- Bhat[,1:p] %*% diag(c(-1,1,-1,1))
> sum((ccas$ycoef[,1:p] * sqrt(n-1) - Bhat[,1:p])^2)
[1] 1.132493e-28




#10-10
X<-matrix(c(1.0,0.615,
            0.615,1.0), ncol=2, byrow=TRUE);X
Y<-matrix(c(1.0,-0.269,
            -0.269,1.0), ncol=2, byrow=TRUE);Y
XY<-matrix(c(-0.111,-0.266,
             -0.195,-0.085),ncol=2, byrow=TRUE);XY

  
matrix(c(1.0,0.615,-0.111,-0.266,
             0.615,1.0,-0.195,-0.085,
             -0.111,-0.195,1.0,-0.269,
             -0.266,-0.085,-0.269,1.0), ncol=4, byrow=TRUE)
Sx <- X
Sy <- Y
Sxy <- XY
(Sxeig <- eigen(Sx, symmetric=TRUE))
(Sxisqrt <- Sxeig$vectors %*% diag(1/sqrt(Sxeig$values)) %*% t(Sxeig$vectors))
(Syeig <- eigen(Sy, symmetric=TRUE))
(Syisqrt <- Syeig$vectors %*% diag(1/sqrt(Syeig$values)) %*% t(Syeig$vectors))

(Xmat <- Sxisqrt %*% Sxy %*% solve(Sy) %*% t(Sxy) %*% Sxisqrt)
(Ymat <- Syisqrt %*% t(Sxy) %*% solve(Sx) %*% Sxy %*% Syisqrt)
(Xeig <- eigen(Xmat, symmetric=TRUE))
(Yeig <- eigen(Ymat, symmetric=TRUE))

rho <- sqrt(Xeig$values)
rho

a<-Sxisqrt%*%Xeig$vectors
b<-Syisqrt%*%Yeig$vectors
a
b

#9-10
L<-matrix(c(0.602, 0.2,
            0.467, 0.154,
            0.926, 0.143,
            1, 0,
            0.874, 0.476,
            0.894, 0.327),ncol=2,byrow = TRUE)
cor<- matrix(c(1.0, 0.505, 0.569, 0.602, 0.621, 0.603,
               0.505, 1.0, 0.422, 0.467, 0.482, 0.450,
               0.569, 0.422, 1.0, 0.926, 0.877, 0.878,
               0.602, 0.467, 0.926, 1.0, 0.874, 0.894,
               0.621, 0.482, 0.877, 0.874, 1.0, 0.937,
               0.603, 0.450, 0.878, 0.894, 0.937, 1.0), ncol=6, byrow=TRUE)

#a.
LLt<- L%*%t(L)
LLt

kpsi<- cor-round(LLt,3)
psi<-diag(6)*diag(kpsi)
psi
#d.
cor-round(LLt,3)-psi
