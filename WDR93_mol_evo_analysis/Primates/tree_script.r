library(ape)
a<-read.tree("Primates.nwk")
b<-unroot(a)
write.tree(b,"Primates.nwk.tree")
