library(ape)
a<-read.tree("Artiodactyla.nwk")
b<-unroot(a)
write.tree(b,"Artiodactyla.nwk.tree")
