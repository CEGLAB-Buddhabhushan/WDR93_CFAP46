library(ape)
a<-read.tree("Perissodactyla.nwk")
b<-unroot(a)
write.tree(b,"Perissodactyla.nwk.tree")
