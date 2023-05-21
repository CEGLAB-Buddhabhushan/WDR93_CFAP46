library(ape)
a<-read.tree("Rodentia.nwk")
b<-unroot(a)
write.tree(b,"Rodentia.nwk.tree")
