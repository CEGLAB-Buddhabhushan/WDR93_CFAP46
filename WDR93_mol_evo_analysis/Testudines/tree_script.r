library(ape)
a<-read.tree("Testudines.nwk")
b<-unroot(a)
write.tree(b,"Testudines.nwk.tree")
