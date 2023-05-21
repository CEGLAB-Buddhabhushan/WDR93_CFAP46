#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
file<-args[1]
b=file
a<-read.table(paste(file))
a$gcstar<-a$V4/(a$V2+a$V4)
a$dnds_hyphy<-a$V6/a$V8
a$dnds_paml<-a$V10/a$V12
a$names<-gsub("_"," ",a$V1)
b<- a[,c("gcstar", "dnds_hyphy", "dnds_paml", "names")]
name1<- paste(file,"_gc_star",sep="")
write.table(b, file=name1, quote=T, sep='\t', col.names = NA)
