library(ape)
a<-read.tree("Squamata.nwk")
b<-unroot(a)
write.tree(b,"Squamata.nwk.tree")
