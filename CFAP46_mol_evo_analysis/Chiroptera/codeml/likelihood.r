b<-read.table("compiled_result.txt",header=F,skip=1,sep="\t")
d<-as.data.frame(matrix(ncol = 15, nrow = 0))
colnames(d)<-colnames(b)
l=dim(b)[1]
for (i in seq (1,l,1)){
c=b[i,]
c$pvalm0_bfree<-pchisq(2*(c$V14-c$V6),df=c$V15-c$V7,lower.tail=F)
c$pavalbne_bfree<-pchisq(2*(c$V14-c$V10),df=c$V15-c$V11,lower.tail=F)
d<-rbind(d,c)
}
write.table(d,file="Final_result.txt",quote=F,sep="\t",col.names=F,row.names=F)
