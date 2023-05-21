
#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
file<-args[1]
library(ggplot2)
library(dplyr)
library(tidyverse)
data <- read.table(paste(file),header = TRUE)

p<-ggplot(data, aes(x = Codon, y = LRT, colour = factor(Selection)))+
  geom_point()+
  geom_segment(aes(xend=Codon), yend=0)+
  facet_grid(vars(Species))+
  labs(title = "Selection analysis using HYPHY-FEL",
       x = "Codon site", y = "LRT")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(legend.position="bottom")
facet_count <- length(unique(data$Species))
height_adjustment <- facet_count * 150

jpeg(paste(file[],".jpeg",sep=""), width=1000, height=height_adjustment)
print(p)
dev.off()
