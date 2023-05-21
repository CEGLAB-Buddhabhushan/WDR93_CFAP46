library(plyr)
library(readr)
library(ggplot2)
library(ggpubr)

setwd("/home/ceglab358/BUDDHA/WDR93/main_fig/WDR93_RNA_seq/WDR93_1/")

SRR957515_Testis<- read.table("SRR957515_Testis_Alligator_sinensis_genomeCoverage.bed", header = F, sep = "\t")
SRR957515_Testis_split<- read.table("SRR957515_Testis_Alligator_sinensis_genomeCoverage_split.bed", header = F, sep = "\t")
SRR1619445_Cerebellum<- read.table("SRR1619445_Cerebellum_Struthio_camelus_genomeCoverage.bed", header = F, sep = "\t")
SRR1619445_Cerebellum_split<- read.table("SRR1619445_Cerebellum_Struthio_camelus_genomeCoverage_split.bed", header = F, sep = "\t")
SRR1847415_Testis<- read.table("SRR1847415_Testis_Parus_major_genomeCoverage.bed", header = F, sep = "\t")
SRR1847415_Testis_split<- read.table("SRR1847415_Testis_Parus_major_genomeCoverage_split.bed", header = F, sep = "\t")
SRR1796035_Male_Gonad<- read.table("SRR1796035_Male_Gonad_Anas_platyrhynchos_genomeCoverage.bed", header = F, sep = "\t")
SRR1796035_Male_Gonad_split<- read.table("SRR1796035_Male_Gonad_Anas_platyrhynchos_genomeCoverage_split.bed", header = F, sep = "\t")
SRR1796013_Male_Gonad<- read.table("SRR1796013_Male_Gonad_Anser_cygnoides_genomeCoverage.bed", header = F, sep = "\t")
SRR1796013_Male_Gonad_split<- read.table("SRR1796013_Male_Gonad_Anser_cygnoides_genomeCoverage_split.bed", header = F, sep = "\t")
SRR6374478_Testis<- read.table("SRR6374478_Testis_Cairina_moschata_genomeCoverage.bed", header = F, sep = "\t")
SRR6374478_Testis_split<- read.table("SRR6374478_Testis_Cairina_moschata_genomeCoverage_split.bed", header = F, sep = "\t")

Struthio_camelus_geneBED<- read.table("Struthio_camelus_RNA-seq.bed", header = F, sep = "\t") 
Sc_l1<- Struthio_camelus_geneBED$V4[1]
Sc_l2<- paste("WDR93")
Sc_l3<- Struthio_camelus_geneBED$V4[2]

Alligator_sinensis_geneBED<- read.table("Alligator_sinensis_RNA-seq.bed", header = F, sep = "\t") 
Alligator_sinensis_blastBED<- read.table("blastBED_Alligator_sinensis.bed", header = F, sep= "\t")
As_mid1<- (Alligator_sinensis_geneBED$V2[1]+Alligator_sinensis_geneBED$V3[1])/2
As_mid2<- (Alligator_sinensis_geneBED$V3[1]+Alligator_sinensis_geneBED$V2[2])/2
As_mid3<- (Alligator_sinensis_geneBED$V2[2]+Alligator_sinensis_geneBED$V3[2])/2

As_l1<- Alligator_sinensis_geneBED$V4[1]
As_l2<- Sc_l2
As_l3<- Alligator_sinensis_geneBED$V4[2]

As_x1<- min(Alligator_sinensis_geneBED[1,2:3])
As_x2<- max(Alligator_sinensis_geneBED[1,2:3])
As_x3<- min(Alligator_sinensis_geneBED[2,2:3])
As_x4<- max(Alligator_sinensis_geneBED[2,2:3])
As <- ggplot() +
  geom_line(data = SRR957515_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR957515_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Alligator_sinensis_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR957515_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= As_x1, xmax= As_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= As_x3, xmax= As_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=As_mid1, y=-max(SRR957515_Testis$V4)/7, label= As_l1, fontface = "italic") +
  annotate("text", x =1400000, y=-max(SRR957515_Testis$V4)/7, label = As_l2, fontface = "italic")+
  annotate("text", x =As_mid3, y=-max(SRR957515_Testis$V4)/7, label = As_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Alligator sinensis'))),x ="Genomic Range", y = "Coverage")

Struthio_camelus_geneBED<- read.table("Struthio_camelus_RNA-seq.bed", header = F, sep = "\t") 
Struthio_camelus_blastBED<- read.table("blastBED_Struthio_camelus.bed", header = F, sep= "\t")
Sc_mid1<- (Struthio_camelus_geneBED$V2[1]+Struthio_camelus_geneBED$V3[1])/2
Sc_mid2<- (Struthio_camelus_geneBED$V3[1]+Struthio_camelus_geneBED$V2[2])/2
Sc_mid3<- (Struthio_camelus_geneBED$V2[2]+Struthio_camelus_geneBED$V3[2])/2

Sc_l1<- Struthio_camelus_geneBED$V4[1]
Sc_l2<- Sc_l2
Sc_l3<- Struthio_camelus_geneBED$V4[2]

Sc_x1<- min(Struthio_camelus_geneBED[1,2:3])
Sc_x2<- max(Struthio_camelus_geneBED[1,2:3])
Sc_x3<- min(Struthio_camelus_geneBED[2,2:3])
Sc_x4<- max(Struthio_camelus_geneBED[2,2:3])
Sc <- ggplot() +
  geom_line(data = SRR1619445_Cerebellum ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1619445_Cerebellum_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Struthio_camelus_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1619445_Cerebellum$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Sc_x1, xmax= Sc_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Sc_x3, xmax= Sc_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Sc_mid1, y=-max(SRR1619445_Cerebellum$V4)/7, label= Sc_l1, fontface = "italic") +
  annotate("text", x =6840000, y=-max(SRR1619445_Cerebellum$V4)/7, label = Sc_l2, fontface = "italic")+
  annotate("text", x =Sc_mid3, y=-max(SRR1619445_Cerebellum$V4)/7, label = Sc_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Struthio camelus'))),x ="Genomic Range", y = "Coverage")

Parus_major_geneBED<- read.table("Parus_major_RNA-seq.bed", header = F, sep = "\t") 
Parus_major_blastBED<- read.table("blastBED_Parus_major.bed", header = F, sep= "\t")
Pm_mid1<- (Parus_major_geneBED$V2[1]+Parus_major_geneBED$V3[1])/2
Pm_mid2<- (Parus_major_geneBED$V3[1]+Parus_major_geneBED$V2[2])/2
Pm_mid3<- (Parus_major_geneBED$V2[2]+Parus_major_geneBED$V3[2])/2

Pm_l1<- Parus_major_geneBED$V4[1]
Pm_l2<- Sc_l2
Pm_l3<- Parus_major_geneBED$V4[2]

Pm_x1<- min(Parus_major_geneBED[1,2:3])
Pm_x2<- max(Parus_major_geneBED[1,2:3])
Pm_x3<- min(Parus_major_geneBED[2,2:3])
Pm_x4<- max(Parus_major_geneBED[2,2:3])
Pm <- ggplot() +
  geom_line(data = SRR1847415_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1847415_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Parus_major_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1847415_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Pm_x1, xmax= Pm_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Pm_x3, xmax= Pm_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Pm_mid1, y=-max(SRR1847415_Testis$V4)/7, label= Pm_l1, fontface = "italic") +
  annotate("text", x =12300000, y=-max(SRR1847415_Testis$V4)/7, label = Pm_l2, fontface = "italic")+
  annotate("text", x =Pm_mid3, y=-max(SRR1847415_Testis$V4)/7, label = Pm_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Parus major'))),x ="Genomic Range", y = "Coverage")

Anas_platyrhynchos_geneBED<- read.table("Anas_platyrhynchos_RNA-seq.bed", header = F, sep = "\t") 
Anas_platyrhynchos_blastBED<- read.table("blastBED_Anas_platyrhynchos.bed", header = F, sep= "\t")
Ap_mid1<- (Anas_platyrhynchos_geneBED$V2[1]+Anas_platyrhynchos_geneBED$V3[1])/2
Ap_mid2<- (Anas_platyrhynchos_geneBED$V3[1]+Anas_platyrhynchos_geneBED$V2[2])/2
Ap_mid3<- (Anas_platyrhynchos_geneBED$V2[2]+Anas_platyrhynchos_geneBED$V3[2])/2

Ap_l1<- Anas_platyrhynchos_geneBED$V4[1]
Ap_l2<- Sc_l2
Ap_l3<- Anas_platyrhynchos_geneBED$V4[2]

Ap_x1<- min(Anas_platyrhynchos_geneBED[1,2:3])
Ap_x2<- max(Anas_platyrhynchos_geneBED[1,2:3])
Ap_x3<- min(Anas_platyrhynchos_geneBED[2,2:3])
Ap_x4<- max(Anas_platyrhynchos_geneBED[2,2:3])
Ap <- ggplot() +
  geom_line(data = SRR1796035_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1796035_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Anas_platyrhynchos_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796035_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Ap_x1, xmax= Ap_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Ap_x3, xmax= Ap_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Ap_mid1, y=-max(SRR1796035_Male_Gonad$V4)/7, label= Ap_l1, fontface = "italic") +
  annotate("text", x =14200000, y=-max(SRR1796035_Male_Gonad$V4)/7, label = Ap_l2, fontface = "italic")+
  annotate("text", x =Ap_mid3, y=-max(SRR1796035_Male_Gonad$V4)/7, label = Ap_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Anas platyrhynchos'))),x ="Genomic Range", y = "Coverage")



Anser_cygnoides_geneBED<- read.table("Anser_cygnoides_RNA-seq.bed", header = F, sep = "\t") 
Anser_cygnoides_blastBED<- read.table("blastBED_Anser_cygnoides.bed", header = F, sep= "\t")
Ac_mid1<- (Anser_cygnoides_geneBED$V2[1]+Anser_cygnoides_geneBED$V3[1])/2
Ac_mid2<- (Anser_cygnoides_geneBED$V3[1]+Anser_cygnoides_geneBED$V2[2])/2
Ac_mid3<- (Anser_cygnoides_geneBED$V2[2]+Anser_cygnoides_geneBED$V3[2])/2

Ac_l1<- Anser_cygnoides_geneBED$V4[1]
Ac_l2<- Sc_l2
Ac_l3<- Anser_cygnoides_geneBED$V4[2]

Ac_x1<- min(Anser_cygnoides_geneBED[1,2:3])
Ac_x2<- max(Anser_cygnoides_geneBED[1,2:3])
Ac_x3<- min(Anser_cygnoides_geneBED[2,2:3])
Ac_x4<- max(Anser_cygnoides_geneBED[2,2:3])
Ac <- ggplot() +
  geom_line(data = SRR1796013_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1796013_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Anser_cygnoides_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796013_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Ac_x1, xmax= Ac_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Ac_x3, xmax= Ac_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Ac_mid1, y=-max(SRR1796013_Male_Gonad$V4)/7, label= Ac_l1, fontface = "italic") +
  annotate("text", x =2400000, y=-max(SRR1796013_Male_Gonad$V4)/7, label = Ac_l2, fontface = "italic")+
  annotate("text", x =Ac_mid3, y=-max(SRR1796013_Male_Gonad$V4)/7, label = Ac_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Anser cygnoides'))),x ="Genomic Range", y = "Coverage")

Cairina_moschata_geneBED<- read.table("Cairina_moschata_RNA-seq.bed", header = F, sep = "\t") 
Cairina_moschata_blastBED<- read.table("blastBED_Cairina_moschata.bed", header = F, sep= "\t")
Cm_mid1<- (Cairina_moschata_geneBED$V2[1]+Cairina_moschata_geneBED$V3[1])/2
Cm_mid2<- (Cairina_moschata_geneBED$V3[1]+Cairina_moschata_geneBED$V2[2])/2
Cm_mid3<- (Cairina_moschata_geneBED$V2[2]+Cairina_moschata_geneBED$V3[2])/2

Cm_l1<- Cairina_moschata_geneBED$V4[1]
Cm_l2<- Sc_l2
Cm_l3<- Cairina_moschata_geneBED$V4[2]

Cm_x1<- min(Cairina_moschata_geneBED[1,2:3])
Cm_x2<- max(Cairina_moschata_geneBED[1,2:3])
Cm_x3<- min(Cairina_moschata_geneBED[2,2:3])
Cm_x4<- max(Cairina_moschata_geneBED[2,2:3])
Cm <- ggplot() +
  geom_line(data = SRR6374478_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR6374478_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Cairina_moschata_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR6374478_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Cm_x1, xmax= Cm_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Cm_x3, xmax= Cm_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Cm_mid1, y=-max(SRR6374478_Testis$V4)/7, label= Cm_l1, fontface = "italic") +
  annotate("text", x =8725000, y=-max(SRR6374478_Testis$V4)/7, label = Cm_l2, fontface = "italic")+
  annotate("text", x =Cm_mid3, y=-max(SRR6374478_Testis$V4)/7, label = Cm_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Cairina moschata'))),x ="Genomic Range", y = "Coverage")

png("WDR93_1_RNA_seq_expression.png",width=16,height=9,units="in",res=1200)
ggarrange(As,Sc,Pm,Ap,Ac,Cm, 
          labels = c("A)", "B)", "C)", "D)", "E)", "F)"),
          ncol = 3, nrow = 2,common.legend = TRUE, legend="bottom")
          
  dev.off()
  
###############only exons

  As1df<- Alligator_sinensis_blastBED[Alligator_sinensis_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
  As1 <- ggplot() +
    geom_line(data = SRR957515_Testis ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR957515_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = As1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR957515_Testis$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= As_x1, xmax= As_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= As_x3, xmax= As_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=1375306, y=-max(SRR957515_Testis$V4)/7, label= As_l1, fontface = "italic") +
    annotate("text", x =1405000, y=-max(SRR957515_Testis$V4)/7, label = As_l2, fontface = "italic")+
    annotate("text", x =As_mid3, y=-max(SRR957515_Testis$V4)/7, label = As_l3, fontface = "italic")+
    labs(title=substitute(paste(italic('Alligator sinensis'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))
  
  Sc1df<- Struthio_camelus_blastBED[Struthio_camelus_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
  Sc1 <- ggplot() +
    geom_line(data = SRR1619445_Cerebellum ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1619445_Cerebellum_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Sc1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1619445_Cerebellum$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Sc_x1, xmax= Sc_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Sc_x3, xmax= Sc_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Sc_mid1, y=-max(SRR1619445_Cerebellum$V4)/7, label= Sc_l1, fontface = "italic") +
    annotate("text", x =6840000, y=-max(SRR1619445_Cerebellum$V4)/7, label = Sc_l2, fontface = "italic")+
    annotate("text", x =Sc_mid3, y=-max(SRR1619445_Cerebellum$V4)/7, label = Sc_l3, fontface = "italic")+
    labs(title=substitute(paste(italic('Struthio camelus'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))
  
  
  Pm1df<- Parus_major_blastBED[Parus_major_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
  Pm1 <- ggplot() +
    geom_line(data = SRR1847415_Testis ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1847415_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Pm1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1847415_Testis$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Pm_x1, xmax= Pm_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Pm_x3, xmax= Pm_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Pm_mid1, y=-max(SRR1847415_Testis$V4)/7, label= Pm_l1, fontface = "italic") +
    annotate("text", x =12300000, y=-max(SRR1847415_Testis$V4)/7, label = Pm_l2, fontface = "italic")+
    annotate("text", x =Pm_mid3, y=-max(SRR1847415_Testis$V4)/7, label = Pm_l3, fontface = "italic")+
    labs(title=substitute(paste(italic('Parus major'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))
  
  Ap1df<- Anas_platyrhynchos_blastBED[Anas_platyrhynchos_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
  Ap1 <- ggplot() +
    geom_line(data = SRR1796035_Male_Gonad ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1796035_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Ap1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796035_Male_Gonad$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Ap_x1, xmax= Ap_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Ap_x3, xmax= Ap_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Ap_mid1, y=-max(SRR1796035_Male_Gonad$V4)/7, label= Ap_l1, fontface = "italic") +
    annotate("text", x =14200000, y=-max(SRR1796035_Male_Gonad$V4)/7, label = Ap_l2, fontface = "italic")+
    annotate("text", x =14150260, y=-max(SRR1796035_Male_Gonad$V4)/7, label = Ap_l3, fontface = "italic")+
    labs(title=substitute(paste(italic('Anas platyrhynchos'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))
  
  
  
  Ac1df<- Anser_cygnoides_blastBED[Anser_cygnoides_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
  Ac1 <- ggplot() +
    geom_line(data = SRR1796013_Male_Gonad ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1796013_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Ac1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796013_Male_Gonad$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Ac_x1, xmax= Ac_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Ac_x3, xmax= Ac_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Ac_mid1, y=-max(SRR1796013_Male_Gonad$V4)/7, label= Ac_l1, fontface = "italic") +
    annotate("text", x =2400000, y=-max(SRR1796013_Male_Gonad$V4)/7, label = Ac_l2, fontface = "italic")+
    annotate("text", x =Ac_mid3, y=-max(SRR1796013_Male_Gonad$V4)/7, label = Ac_l3, fontface = "italic")+
    labs(title=substitute(paste(italic('Anser cygnoides'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))
  
  Cm1df<- Cairina_moschata_blastBED[Cairina_moschata_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
  Cm1 <- ggplot() +
    geom_line(data = SRR6374478_Testis ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR6374478_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Cm1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR6374478_Testis$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Cm_x1, xmax= Cm_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Cm_x3, xmax= Cm_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=8783648, y=-max(SRR6374478_Testis$V4)/7, label= Cm_l1, fontface = "italic") +
    annotate("text", x =8725000, y=-max(SRR6374478_Testis$V4)/7, label = Cm_l2, fontface = "italic")+
    annotate("text", x =8705922, y=-max(SRR6374478_Testis$V4)/7, label = Cm_l3, fontface = "italic")+
    labs(title=substitute(paste(italic('Cairina moschata'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))
  
  png("WDR93_1_RNA_seq_expression_exons.png",width=16,height=9,units="in",res=1200)
  ggarrange(As1,Sc1,Pm1,Ap1,Ac1,Cm1, 
            labels = c("A)", "B)", "C)", "D)", "E)", "F)"),
            ncol = 3, nrow = 2,common.legend = TRUE, legend="bottom")
  
  dev.off() 
 
  
  ###############ZoomedIN

  As2df<- Alligator_sinensis_blastBED[Alligator_sinensis_blastBED$V4 %in% c("WDR93_Exon"),]
  As2 <- ggplot() +
    geom_line(data = SRR957515_Testis ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR957515_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = As2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR957515_Testis$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= As_x1, xmax= As_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= As_x3, xmax= As_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=1375306, y=-max(SRR957515_Testis$V4)/7, label= As_l1, fontface = "italic") +
    annotate("text", x =1405000, y=-max(SRR957515_Testis$V4)/7, label = As_l2, fontface = "italic")+
    annotate("text", x =As_mid3, y=-max(SRR957515_Testis$V4)/7, label = As_l3, fontface = "italic")+
    xlim(1377671, 1391485)+
    labs(title=substitute(paste(italic('Alligator sinensis'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('WDR93 Exons'))
  
  Sc2df<- Struthio_camelus_blastBED[Struthio_camelus_blastBED$V4 %in% c("WDR93_Exon"),]
  Sc2 <- ggplot() +
    geom_line(data = SRR1619445_Cerebellum ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1619445_Cerebellum_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Sc2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1619445_Cerebellum$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Sc_x1, xmax= Sc_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Sc_x3, xmax= Sc_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Sc_mid1, y=-max(SRR1619445_Cerebellum$V4)/7, label= Sc_l1, fontface = "italic") +
    annotate("text", x =6840000, y=-max(SRR1619445_Cerebellum$V4)/7, label = Sc_l2, fontface = "italic")+
    annotate("text", x =Sc_mid3, y=-max(SRR1619445_Cerebellum$V4)/7, label = Sc_l3, fontface = "italic")+
    xlim(6820626, 6833289)+
    labs(title=substitute(paste(italic('Struthio camelus'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('WDR93 Exons'))
  
  
  Pm2df<- Parus_major_blastBED[Parus_major_blastBED$V4 %in% c("WDR93_Exon"),]
  Pm2 <- ggplot() +
    geom_line(data = SRR1847415_Testis ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1847415_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Pm2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1847415_Testis$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Pm_x1, xmax= Pm_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Pm_x3, xmax= Pm_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Pm_mid1, y=-max(SRR1847415_Testis$V4)/7, label= Pm_l1, fontface = "italic") +
    annotate("text", x =12300000, y=-max(SRR1847415_Testis$V4)/7, label = Pm_l2, fontface = "italic")+
    annotate("text", x =Pm_mid3, y=-max(SRR1847415_Testis$V4)/7, label = Pm_l3, fontface = "italic")+
    xlim(12302612, 12313352)+
    labs(title=substitute(paste(italic('Parus major'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('WDR93 Exons'))
  
  Ap2df<- Anas_platyrhynchos_blastBED[Anas_platyrhynchos_blastBED$V4 %in% c("WDR93_Exon"),]
  Ap2 <- ggplot() +
    geom_line(data = SRR1796035_Male_Gonad ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1796035_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Ap2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796035_Male_Gonad$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Ap_x1, xmax= Ap_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Ap_x3, xmax= Ap_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Ap_mid1, y=-max(SRR1796035_Male_Gonad$V4)/7, label= Ap_l1, fontface = "italic") +
    annotate("text", x =14200000, y=-max(SRR1796035_Male_Gonad$V4)/7, label = Ap_l2, fontface = "italic")+
    annotate("text", x =14150260, y=-max(SRR1796035_Male_Gonad$V4)/7, label = Ap_l3, fontface = "italic")+
    xlim(14203219, 14213893)+
    labs(title=substitute(paste(italic('Anas platyrhynchos'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('WDR93 Exons'))
  
  
  
  Ac2df<- Anser_cygnoides_blastBED[Anser_cygnoides_blastBED$V4 %in% c("WDR93_Exon"),]
  Ac2 <- ggplot() +
    geom_line(data = SRR1796013_Male_Gonad ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR1796013_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Ac2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796013_Male_Gonad$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Ac_x1, xmax= Ac_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Ac_x3, xmax= Ac_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=Ac_mid1, y=-max(SRR1796013_Male_Gonad$V4)/7, label= Ac_l1, fontface = "italic") +
    annotate("text", x =2400000, y=-max(SRR1796013_Male_Gonad$V4)/7, label = Ac_l2, fontface = "italic")+
    annotate("text", x =Ac_mid3, y=-max(SRR1796013_Male_Gonad$V4)/7, label = Ac_l3, fontface = "italic")+
    xlim(2414060, 2424608)+
    labs(title=substitute(paste(italic('Anser cygnoides'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('WDR93 Exons'))
  
  Cm2df<- Cairina_moschata_blastBED[Cairina_moschata_blastBED$V4 %in% c("WDR93_Exon"),]
  Cm2 <- ggplot() +
    geom_line(data = SRR6374478_Testis ,aes(x = V2, y = V4), color="red")+
    geom_line(data = SRR6374478_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
    geom_rect(data = Cm2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR6374478_Testis$V4)/9 , fill= V4))+
    labs(fill='Gene features')+
    annotate("rect", xmin= Cm_x1, xmax= Cm_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("rect", xmin= Cm_x3, xmax= Cm_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
    annotate("text", x=8783648, y=-max(SRR6374478_Testis$V4)/7, label= Cm_l1, fontface = "italic") +
    annotate("text", x =8725000, y=-max(SRR6374478_Testis$V4)/7, label = Cm_l2, fontface = "italic")+
    annotate("text", x =8705922, y=-max(SRR6374478_Testis$V4)/7, label = Cm_l3, fontface = "italic")+
    xlim(8704705, 8715347)+
    labs(title=substitute(paste(italic('Cairina moschata'))),x ="Genomic Range", y = "Coverage")+
    scale_fill_discrete(labels=c('WDR93 Exons'))
  
  png("WDR93_1_RNA_seq_expression_ZoomedIN.png",width=16,height=9,units="in",res=1200)
  ggarrange(As2,Sc2,Pm2,Ap2,Ac2,Cm2, 
            labels = c("A)", "B)", "C)", "D)", "E)", "F)"),
            ncol = 3, nrow = 2,common.legend = TRUE, legend="bottom")
  
  dev.off() 