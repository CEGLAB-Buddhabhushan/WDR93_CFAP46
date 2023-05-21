#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
file<-args[1]
b=file
library(ggplot2)
library(ggrepel)
library(cowplot)
library(dplyr)
library(ggplotify)
library(grid)
library(gridExtra)
a<-read.table(paste(file));
a$gcstar<-a$V4/(a$V2+a$V4)
a$dnds_hyphy<-a$V6/a$V8
a$dnds_paml<-a$V10/a$V12
a$names<-gsub("_"," ",a$V1)
file2<-gsub("_"," ",b)
e<-read.table(paste(file,"_phastout",sep=""),header=T)
sname<-colnames(e)
e$Nucleotide_position<-c(1:length(e[,1]))
names1<-gsub("_"," ",sname)
d <- e %>%
  select(Nucleotide_position, everything())
jpeg(paste(file[],".jpeg",sep=""), width=4000, height=3000)
a[a=="NaN"]<-0
##plotting GC* at y axis and dnds at x axis using ggplot.
p<-ggplot(a,aes(x=a$dnds_hyphy, y=a$gcstar))+ geom_point(aes(dnds_hyphy, gcstar)) + labs(tag = "A) HYPHY") + ggtitle(paste(file2," GC* vs dN/dS", sep=""))  + theme(plot.title = element_text(hjust = 0.5,color="red", size=54, face="bold"),axis.title.x = element_text(color="blue", size=54, face="bold"),axis.title.y = element_text(color="blue", size=54, face="bold"),axis.text=element_text(size=52)) + xlab("dN/dS") + ylab("GC*") + geom_text_repel(aes(dnds_hyphy, gcstar, label=names, fontface="italic",hjust=-0.2), size=15) +guides(size = FALSE) + annotate(geom="text", label="Annotation text") + theme(plot.margin = unit(c(2,2,2,2), "lines"),text = element_text(size=40))
q<-ggplot(a,aes(x=a$V6, y=a$gcstar))+ geom_point(aes(V6, gcstar)) + labs(tag = "B) HYPHY") + ggtitle(paste(file2," GC* vs dN",sep="")) + theme(plot.title = element_text(hjust = 0.5,color="red", size=54, face="bold"),axis.title.x = element_text(color="blue", size=54, face="bold"),axis.title.y = element_text(color="blue", size=54, face="bold"),axis.text=element_text(size=52)) + xlab("dN") + ylab("GC*") +xlim(c((min(a$V6)-0.1),(max(a$V6)+0.2))) + geom_text_repel(aes(V6, gcstar, label=names, fontface="italic",hjust=-0.2), size=15) +guides(size = FALSE) + annotate(geom="text", label="Annotation text") + theme(plot.margin = unit(c(2,2,2,2), "lines"),text = element_text(size=40))

r<-ggplot(a,aes(x=a$V8, y=a$gcstar))+ geom_point(aes(V8, gcstar)) +labs(tag = "C) HYPHY") + ggtitle(paste(file2," GC* vs dS",sep="")) + theme(plot.title = element_text(hjust = 0.5,color="red", size=54, face="bold"),axis.title.x = element_text(color="blue", size=54, face="bold"),axis.title.y = element_text(color="blue", size=54, face="bold"),axis.text=element_text(size=52)) + xlab("dS") + ylab("GC*") +xlim(c((min(a$V8)-0.1),(max(a$V8)+0.2))) + geom_text_repel(aes(V8, gcstar, label=names, fontface="italic",hjust=-0.2), size=15) +guides(size = FALSE) + annotate(geom="text", label="Annotation text") + theme(plot.margin = unit(c(2,2,2,2), "lines"),text = element_text(size=40))

s<-ggplot(a,aes(x=a$dnds_paml, y=a$gcstar))+ geom_point(aes(dnds_paml, gcstar)) + labs(tag = "D) PAML") + ggtitle(paste(file2," GC* vs dN/dS", sep="")) + theme(plot.title = element_text(hjust = 0.5,color="red", size=54, face="bold"),axis.title.x = element_text(color="blue", size=54, face="bold"),axis.title.y = element_text(color="blue", size=54, face="bold"),axis.text=element_text(size=52)) + xlab("dN/dS") + ylab("GC*") + geom_text_repel(aes(dnds_paml, gcstar, label=names, fontface="italic",hjust=-0.2), size=15) +guides(size = FALSE) + annotate(geom="text", label="Annotation text") + theme(plot.margin = unit(c(2,2,2,2), "lines"),text = element_text(size=40))

t<-ggplot(a,aes(x=a$V10, y=a$gcstar))+ geom_point(aes(V10, gcstar)) + labs(tag = "E) PAML") + ggtitle(paste(file2," GC* vs dN",sep="")) + theme(plot.title = element_text(hjust = 0.5,color="red", size=54, face="bold"),axis.title.x = element_text(color="blue", size=54, face="bold"),axis.title.y = element_text(color="blue", size=54, face="bold"),axis.text=element_text(size=52)) + xlab("dN") + ylab("GC*")  +xlim(c((min(a$V10)-0.1),(max(a$V10)+0.2)))+ geom_text_repel(aes(V10, gcstar, label=names, fontface="italic",hjust=-0.2), size=15) +guides(size = FALSE) + annotate(geom="text", label="Annotation text") + theme(plot.margin = unit(c(2,2,2,2), "lines"),text = element_text(size=40))

u<-ggplot(a,aes(x=a$V12, y=a$gcstar))+ geom_point(aes(V12, gcstar)) + labs(tag = "F) PAML") + ggtitle(paste(file2," GC* vs dS",sep="")) + theme(plot.title = element_text(hjust = 0.5,color="red", size=54, face="bold"),axis.title.x = element_text(color="blue", size=54, face="bold"),axis.title.y = element_text(color="blue", size=54, face="bold"),axis.text=element_text(size=52)) + xlab("dS") + ylab("GC*") +xlim(c((min(a$V12)-0.1),(max(a$V12)+0.2)))+ geom_text_repel(aes(V12, gcstar, label=names, fontface="italic",hjust=-0.2), size=15) +guides(size = FALSE) + annotate(geom="text", label="Annotation text") + theme(plot.margin = unit(c(2,2,2,2), "lines"),text = element_text(size=40))
d2 <- d[,-1]
rownames(d2) <- d[,1]
d3=data.matrix(d2)
require(reshape2)
d_m <- melt(d3)
g<- ggplot() + geom_line(data = d_m, aes(x = Var1, y = value, group = Var2,colour=factor(Var2)),size=10)+theme(legend.text=element_text(face="italic"),legend.title=element_text(size=30))+ scale_color_discrete(name="Species") + labs(tag = "G")+ ggtitle("gBGC vs Nucleotide position ")+theme(plot.title = element_text(hjust = 0.5,color="red", size=54, face="bold"),axis.title.x = element_text(color="blue", size=54, face="bold"),axis.title.y = element_text(color="blue", size=54, face="bold"),axis.text=element_text(size=52),legend.text=element_text(size=30)) + xlab("Nucleotide position ") + ylab("gBGC") + guides(size=FALSE) + theme(plot.margin = unit(c(2,2,2,2), "lines"),text = element_text(size=40))
grid.arrange(p,q,r,s,t,u,g,layout_matrix= rbind(c(1,2,3),c(4,5,6),c(7,7,7)))

