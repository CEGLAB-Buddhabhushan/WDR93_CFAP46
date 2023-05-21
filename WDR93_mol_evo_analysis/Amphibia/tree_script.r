library(ape)
a<-read.tree("Amphibia.nwk")
b<-unroot(a)
write.tree(b,"Amphibia.nwk.tree")
