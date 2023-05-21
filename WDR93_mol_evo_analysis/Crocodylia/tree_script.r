library(ape)
a<-read.tree("Crocodylia.nwk")
b<-unroot(a)
write.tree(b,"Crocodylia.nwk.tree")
