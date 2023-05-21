library(ape)
a<-read.tree("Monotremata_Metatheria.nwk")
b<-unroot(a)
write.tree(b,"Monotremata_Metatheria.nwk.tree")
