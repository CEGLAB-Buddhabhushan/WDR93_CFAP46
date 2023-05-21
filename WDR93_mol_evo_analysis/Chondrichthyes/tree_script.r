library(ape)
a<-read.tree("Chondrichthyes.nwk")
b<-unroot(a)
write.tree(b,"Chondrichthyes.nwk.tree")
