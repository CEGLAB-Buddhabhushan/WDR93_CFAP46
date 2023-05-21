library(ape)
a<-read.tree("Carnivora.nwk")
b<-unroot(a)
write.tree(b,"Carnivora.nwk.tree")
