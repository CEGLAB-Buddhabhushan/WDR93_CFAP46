
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
  labs(title = paste(file[],sep=""),
       x = "Codon site", y = "LRT")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(legend.position="bottom") +
  scale_color_manual(values = c("Positive" = "red",
                                "Negative" = "green"))

facet_count <- length(unique(data$Species))
height_adjustment <- facet_count * 1.6

png(paste(file[],".png",sep=""), width = 11, height = height_adjustment, units = 'in', res = 600)
print(p)
dev.off()
