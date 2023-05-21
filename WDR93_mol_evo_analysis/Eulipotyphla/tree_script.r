library(ape)
a<-read.tree("Eulipotyphla.nwk")
b<-unroot(a)
write.tree(b,"Eulipotyphla.nwk.tree")
