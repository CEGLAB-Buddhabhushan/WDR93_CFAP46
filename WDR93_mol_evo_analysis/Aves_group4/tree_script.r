library(ape)
a<-read.tree("Aves_group4.nwk")
b<-unroot(a)
write.tree(b,"Aves_group4.nwk.tree")
