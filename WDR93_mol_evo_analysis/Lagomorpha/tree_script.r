library(ape)
a<-read.tree("Lagomorpha.nwk")
b<-unroot(a)
write.tree(b,"Lagomorpha.nwk.tree")
