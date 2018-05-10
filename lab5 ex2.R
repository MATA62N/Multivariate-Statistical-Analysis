#lab5 example2  national track records- female

track<-read.csv("./Lab5-data/pca-1.csv")
head(track)
tail(track)

summary(track)
rownames(track)<-track[,1]  
track<-track[,-1]

pairs(track, main="Track : Female")
round(var(track),3)
round(cor(track),3)
track.pc<-princomp(track,cor=TRUE)
summary(track.pc)
loadings(track.pc)
plot(track.pc)

track.pc1<-princomp(track)
loadings(track.pc1)


#factor anaylsis

trackss<-scale(track, scale=T, center=T )
(f1<-factanal(trackss, factors=2))
#x1,x2,x3 factor1, x4,x5,x6,x7 factor2
(f1<-factanal(trackss, factors=3))
#x4, x7 애매함, 분류가 제대로 안됨