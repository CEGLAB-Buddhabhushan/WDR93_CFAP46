library(ape)
a<-read.tree("Chiroptera.nwk")
b<-unroot(a)
write.tree(b,"Chiroptera.nwk.tree")
