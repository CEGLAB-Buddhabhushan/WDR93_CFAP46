library(ape)
a<-read.tree("Serpentes.nwk")
b<-unroot(a)
write.tree(b,"Serpentes.nwk.tree")
