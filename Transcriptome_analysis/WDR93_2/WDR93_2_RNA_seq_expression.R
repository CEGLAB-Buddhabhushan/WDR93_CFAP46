library(plyr)
library(readr)
library(ggplot2)
library(ggpubr)

setwd("/home/ceglab358/BUDDHA/WDR93/main_fig/WDR93_RNA_seq/WDR93_2/")

SRR11050687_Testis<- read.table("SRR11050687_Testis_Anolis_carolinensis_genomeCoverage.bed", header = F, sep = "\t")
SRR11050687_Testis_split<- read.table("SRR11050687_Testis_Anolis_carolinensis_genomeCoverage_split.bed", header = F, sep = "\t")
SRR7026362_Testis<- read.table("SRR7026362_Testis_Dromaius_novaehollandiae_genomeCoverage.bed", header = F, sep = "\t")
SRR7026362_Testis_split<- read.table("SRR7026362_Testis_Dromaius_novaehollandiae_genomeCoverage_split.bed", header = F, sep = "\t")
SRR8695301_Testis<- read.table("SRR8695301_Testis_Taeniopygia_guttata_genomeCoverage.bed", header = F, sep = "\t")
SRR8695301_Testis_split<- read.table("SRR8695301_Testis_Taeniopygia_guttata_genomeCoverage_split.bed", header = F, sep = "\t")
SRR2889305_Male_Gonad<- read.table("SRR2889305_Male_Gonad_Gallus_gallus_genomeCoverage.bed", header = F, sep = "\t")
SRR2889305_Male_Gonad_split<- read.table("SRR2889305_Male_Gonad_Gallus_gallus_genomeCoverage_split.bed", header = F, sep = "\t")
SRR1796090_Male_Gonad<- read.table("SRR1796090_Male_Gonad_Meleagris_gallopavo_genomeCoverage.bed", header = F, sep = "\t")
SRR1796090_Male_Gonad_split<- read.table("SRR1796090_Male_Gonad_Meleagris_gallopavo_genomeCoverage_split.bed", header = F, sep = "\t")
SRR1797835_Male_Gonad<- read.table("SRR1797835_Male_Gonad_Phasianus_colchicus_genomeCoverage.bed", header = F, sep = "\t")
SRR1797835_Male_Gonad_split<- read.table("SRR1797835_Male_Gonad_Phasianus_colchicus_genomeCoverage_split.bed", header = F, sep = "\t")

Struthio_camelus_geneBED<- read.table("Struthio_camelus_RNA-seq.bed", header = F, sep = "\t") 
Sc_l1<- Struthio_camelus_geneBED$V4[1]
Sc_l2<- Struthio_camelus_geneBED$V4[2]
Sc_l3<- Struthio_camelus_geneBED$V4[3]
Anolis_carolinensis_geneBED<- read.table("Anolis_carolinensis_RNA-seq.bed", header = F, sep = "\t") 
Anolis_carolinensis_blastBED<- read.table("blastBED_Anolis_carolinensis.bed", header = F, sep= "\t")
Ac_mid1<- (Anolis_carolinensis_geneBED$V2[1]+Anolis_carolinensis_geneBED$V3[1])/2
Ac_mid2<- (Anolis_carolinensis_geneBED$V3[1]+Anolis_carolinensis_geneBED$V2[2])/2
Ac_mid3<- (Anolis_carolinensis_geneBED$V2[2]+Anolis_carolinensis_geneBED$V3[2])/2

Ac_l1<- Anolis_carolinensis_geneBED$V4[1]
Ac_l2<- Sc_l2
Ac_l3<- Anolis_carolinensis_geneBED$V4[2]

Ac_x1<- min(Anolis_carolinensis_geneBED[1,2:3])
Ac_x2<- max(Anolis_carolinensis_geneBED[1,2:3])
Ac_x3<- min(Anolis_carolinensis_geneBED[2,2:3])
Ac_x4<- max(Anolis_carolinensis_geneBED[2,2:3])
Ac <- ggplot() +
  geom_line(data = SRR11050687_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR11050687_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Anolis_carolinensis_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR11050687_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Ac_x1, xmax= Ac_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Ac_x3, xmax= Ac_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Ac_mid1, y=-max(SRR11050687_Testis$V4)/7, label= Ac_l1) +
  annotate("text", x =260000, y=-max(SRR11050687_Testis$V4)/7, label = Ac_l2)+
  annotate("text", x =Ac_mid3, y=-max(SRR11050687_Testis$V4)/7, label = Ac_l3)+
  labs(title=substitute(paste(italic('Anolis carolinensis'))),x ="Genomic Range", y = "Coverage")

Dromaius_novaehollandiae_geneBED<- read.table("Dromaius_novaehollandiae_RNA-seq.bed", header = F, sep = "\t") 
Dromaius_novaehollandiae_blastBED<- read.table("blastBED_Dromaius_novaehollandiae.bed", header = F, sep= "\t")
Dn_mid1<- (Dromaius_novaehollandiae_geneBED$V2[1]+Dromaius_novaehollandiae_geneBED$V3[1])/2
Dn_mid2<- (Dromaius_novaehollandiae_geneBED$V3[1]+Dromaius_novaehollandiae_geneBED$V2[2])/2
Dn_mid3<- (Dromaius_novaehollandiae_geneBED$V2[2]+Dromaius_novaehollandiae_geneBED$V3[2])/2

Dn_l1<- Dromaius_novaehollandiae_geneBED$V4[1]
Dn_l2<- Sc_l2
Dn_l3<- Dromaius_novaehollandiae_geneBED$V4[2]

Dn_x1<- min(Dromaius_novaehollandiae_geneBED[1,2:3])
Dn_x2<- max(Dromaius_novaehollandiae_geneBED[1,2:3])
Dn_x3<- min(Dromaius_novaehollandiae_geneBED[2,2:3])
Dn_x4<- max(Dromaius_novaehollandiae_geneBED[2,2:3])
Dn <- ggplot() +
  geom_line(data = SRR7026362_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR7026362_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Dromaius_novaehollandiae_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR7026362_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Dn_x1, xmax= Dn_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Dn_x3, xmax= Dn_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Dn_mid1, y=-max(SRR7026362_Testis$V4)/7, label= Dn_l1) +
  annotate("text", x =2670000, y=-max(SRR7026362_Testis$V4)/7, label = Dn_l2)+
  annotate("text", x =Dn_mid3, y=-max(SRR7026362_Testis$V4)/7, label = Dn_l3)+
  labs(title=substitute(paste(italic('Dromaius novaehollandiae'))),x ="Genomic Range", y = "Coverage")

Taeniopygia_guttata_geneBED<- read.table("Taeniopygia_guttata_RNA-seq.bed", header = F, sep = "\t") 
Taeniopygia_guttata_blastBED<- read.table("blastBED_Taeniopygia_guttata.bed", header = F, sep= "\t")
Tg_mid1<- (Taeniopygia_guttata_geneBED$V2[1]+Taeniopygia_guttata_geneBED$V3[1])/2
Tg_mid2<- (Taeniopygia_guttata_geneBED$V3[1]+Taeniopygia_guttata_geneBED$V2[2])/2
Tg_mid3<- (Taeniopygia_guttata_geneBED$V2[2]+Taeniopygia_guttata_geneBED$V3[2])/2

Tg_l1<- Taeniopygia_guttata_geneBED$V4[1]
Tg_l2<- Sc_l2
Tg_l3<- Taeniopygia_guttata_geneBED$V4[2]

Tg_x1<- min(Taeniopygia_guttata_geneBED[1,2:3])
Tg_x2<- max(Taeniopygia_guttata_geneBED[1,2:3])
Tg_x3<- min(Taeniopygia_guttata_geneBED[2,2:3])
Tg_x4<- max(Taeniopygia_guttata_geneBED[2,2:3])
Tg <- ggplot() +
  geom_line(data = SRR8695301_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR8695301_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Taeniopygia_guttata_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR8695301_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Tg_x1, xmax= Tg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Tg_x3, xmax= Tg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Tg_mid1, y=-max(SRR8695301_Testis$V4)/7, label= Tg_l1) +
  annotate("text", x =12620000, y=-max(SRR8695301_Testis$V4)/7, label = Tg_l2)+
  annotate("text", x =Tg_mid3, y=-max(SRR8695301_Testis$V4)/7, label = Tg_l3)+
  labs(title=substitute(paste(italic('Taeniopygia guttata'))),x ="Genomic Range", y = "Coverage")

Gallus_gallus_geneBED<- read.table("Gallus_gallus_RNA-seq.bed", header = F, sep = "\t") 
Gallus_gallus_blastBED<- read.table("blastBED_Gallus_gallus.bed", header = F, sep= "\t")
Gg_mid1<- (Gallus_gallus_geneBED$V2[1]+Gallus_gallus_geneBED$V3[1])/2
Gg_mid2<- (Gallus_gallus_geneBED$V3[1]+Gallus_gallus_geneBED$V2[2])/2
Gg_mid3<- (Gallus_gallus_geneBED$V2[2]+Gallus_gallus_geneBED$V3[2])/2

Gg_l1<- Gallus_gallus_geneBED$V4[1]
Gg_l2<- Sc_l2
Gg_l3<- Gallus_gallus_geneBED$V4[2]

Gg_x1<- min(Gallus_gallus_geneBED[1,2:3])
Gg_x2<- max(Gallus_gallus_geneBED[1,2:3])
Gg_x3<- min(Gallus_gallus_geneBED[2,2:3])
Gg_x4<- max(Gallus_gallus_geneBED[2,2:3])
Gg <- ggplot() +
  geom_line(data = SRR2889305_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR2889305_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Gallus_gallus_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR2889305_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Gg_x1, xmax= Gg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Gg_x3, xmax= Gg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Gg_mid1, y=-max(SRR2889305_Male_Gonad$V4)/7, label= Gg_l1) +
  annotate("text", x =12810000, y=-max(SRR2889305_Male_Gonad$V4)/7, label = Gg_l2)+
  annotate("text", x =Gg_mid3, y=-max(SRR2889305_Male_Gonad$V4)/7, label = Gg_l3)+
  labs(title=substitute(paste(italic('Gallus gallus'))),x ="Genomic Range", y = "Coverage")



Meleagris_gallopavo_geneBED<- read.table("Meleagris_gallopavo_RNA-seq.bed", header = F, sep = "\t") 
Meleagris_gallopavo_blastBED<- read.table("blastBED_Meleagris_gallopavo.bed", header = F, sep= "\t")
Mg_mid1<- (Meleagris_gallopavo_geneBED$V2[1]+Meleagris_gallopavo_geneBED$V3[1])/2
Mg_mid2<- (Meleagris_gallopavo_geneBED$V3[1]+Meleagris_gallopavo_geneBED$V2[2])/2
Mg_mid3<- (Meleagris_gallopavo_geneBED$V2[2]+Meleagris_gallopavo_geneBED$V3[2])/2

Mg_l1<- Meleagris_gallopavo_geneBED$V4[1]
Mg_l2<- Sc_l2
Mg_l3<- Meleagris_gallopavo_geneBED$V4[2]

Mg_x1<- min(Meleagris_gallopavo_geneBED[1,2:3])
Mg_x2<- max(Meleagris_gallopavo_geneBED[1,2:3])
Mg_x3<- min(Meleagris_gallopavo_geneBED[2,2:3])
Mg_x4<- max(Meleagris_gallopavo_geneBED[2,2:3])
Mg <- ggplot() +
  geom_line(data = SRR1796090_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1796090_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Meleagris_gallopavo_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796090_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Mg_x1, xmax= Mg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Mg_x3, xmax= Mg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Mg_mid1, y=-max(SRR1796090_Male_Gonad$V4)/7, label= Mg_l1) +
  annotate("text", x =12030000, y=-max(SRR1796090_Male_Gonad$V4)/7, label = Mg_l2)+
  annotate("text", x =Mg_mid3, y=-max(SRR1796090_Male_Gonad$V4)/7, label = Mg_l3)+
  labs(title=substitute(paste(italic('Meleagris gallopavo'))),x ="Genomic Range", y = "Coverage")

Phasianus_colchicus_geneBED<- read.table("Phasianus_colchicus_RNA-seq.bed", header = F, sep = "\t") 
Phasianus_colchicus_blastBED<- read.table("blastBED_Phasianus_colchicus.bed", header = F, sep= "\t")
Pc_mid1<- (Phasianus_colchicus_geneBED$V2[1]+Phasianus_colchicus_geneBED$V3[1])/2
Pc_mid2<- (Phasianus_colchicus_geneBED$V3[1]+Phasianus_colchicus_geneBED$V2[2])/2
Pc_mid3<- (Phasianus_colchicus_geneBED$V2[2]+Phasianus_colchicus_geneBED$V3[2])/2

Pc_l1<- Phasianus_colchicus_geneBED$V4[1]
Pc_l2<- Sc_l2
Pc_l3<- Phasianus_colchicus_geneBED$V4[2]

Pc_x1<- min(Phasianus_colchicus_geneBED[1,2:3])
Pc_x2<- max(Phasianus_colchicus_geneBED[1,2:3])
Pc_x3<- min(Phasianus_colchicus_geneBED[2,2:3])
Pc_x4<- max(Phasianus_colchicus_geneBED[2,2:3])
Pc <- ggplot() +
  geom_line(data = SRR1797835_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1797835_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Phasianus_colchicus_blastBED, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1797835_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Pc_x1, xmax= Pc_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Pc_x3, xmax= Pc_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Pc_mid1, y=-max(SRR1797835_Male_Gonad$V4)/7, label= Pc_l1) +
  annotate("text", x =12090000, y=-max(SRR1797835_Male_Gonad$V4)/7, label = Pc_l2)+
  annotate("text", x =Pc_mid3, y=-max(SRR1797835_Male_Gonad$V4)/7, label = Pc_l3)+
  labs(title=substitute(paste(italic('Phasianus colchicus'))),x ="Genomic Range", y = "Coverage")

png("WDR93_2_RNA_seq_expression.png",width=16,height=9,units="in",res=1200)
ggarrange(Ac,Dn,Tg,Gg,Mg,Pc, 
          labels = c("A)", "B)", "C)", "D)", "E)", "F)"),
          ncol = 3, nrow = 2,common.legend = TRUE, legend="bottom")
dev.off()

###############only exons

Ac1df<- Anolis_carolinensis_blastBED[Anolis_carolinensis_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
Ac1 <- ggplot() +
  geom_line(data = SRR11050687_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR11050687_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Ac1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR11050687_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Ac_x1, xmax= Ac_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Ac_x3, xmax= Ac_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=229964, y=-max(SRR11050687_Testis$V4)/7, label= Ac_l1, fontface = "italic") +
  annotate("text", x =260000, y=-max(SRR11050687_Testis$V4)/7, label = Ac_l2, fontface = "italic")+
  annotate("text", x =Ac_mid3, y=-max(SRR11050687_Testis$V4)/7, label = Ac_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Anolis carolinensis'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))

Dn1df<- Dromaius_novaehollandiae_blastBED[Dromaius_novaehollandiae_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]

Dn1 <- ggplot() +
  geom_line(data = SRR7026362_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR7026362_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Dn1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR7026362_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Dn_x1, xmax= Dn_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Dn_x3, xmax= Dn_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=2690726, y=-max(SRR7026362_Testis$V4)/7, label= Dn_l1, fontface = "italic") +
  annotate("text", x =2670000, y=-max(SRR7026362_Testis$V4)/7, label = Dn_l2, fontface = "italic")+
  annotate("text", x =Dn_mid3, y=-max(SRR7026362_Testis$V4)/7, label = Dn_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Dromaius novaehollandiae'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))

Tg1df<- Taeniopygia_guttata_blastBED[Taeniopygia_guttata_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]
Tg1 <- ggplot() +
  geom_line(data = SRR8695301_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR8695301_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Tg1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR8695301_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Tg_x1, xmax= Tg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Tg_x3, xmax= Tg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=12637351, y=-max(SRR8695301_Testis$V4)/7, label= Tg_l1, fontface = "italic") +
  annotate("text", x =12620000, y=-max(SRR8695301_Testis$V4)/7, label = Tg_l2, fontface = "italic")+
  annotate("text", x =Tg_mid3, y=-max(SRR8695301_Testis$V4)/7, label = Tg_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Taeniopygia guttata'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))

Gg1df<- Gallus_gallus_blastBED[Gallus_gallus_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]

Gg1 <- ggplot() +
  geom_line(data = SRR2889305_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR2889305_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Gg1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR2889305_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Gg_x1, xmax= Gg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Gg_x3, xmax= Gg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Gg_mid1, y=-max(SRR2889305_Male_Gonad$V4)/7, label= Gg_l1, fontface = "italic") +
  annotate("text", x =12810000, y=-max(SRR2889305_Male_Gonad$V4)/7, label = Gg_l2, fontface = "italic")+
  annotate("text", x =Gg_mid3, y=-max(SRR2889305_Male_Gonad$V4)/7, label = Gg_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Gallus gallus'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))

Mg1df<- Meleagris_gallopavo_blastBED[Meleagris_gallopavo_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]

Mg1 <- ggplot() +
  geom_line(data = SRR1796090_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1796090_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Mg1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796090_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Mg_x1, xmax= Mg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Mg_x3, xmax= Mg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Mg_mid1, y=-max(SRR1796090_Male_Gonad$V4)/7, label= Mg_l1, fontface = "italic") +
  annotate("text", x =12030000, y=-max(SRR1796090_Male_Gonad$V4)/7, label = Mg_l2, fontface = "italic")+
  annotate("text", x =Mg_mid3, y=-max(SRR1796090_Male_Gonad$V4)/7, label = Mg_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Meleagris gallopavo'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))

Pc1df<- Phasianus_colchicus_blastBED[Phasianus_colchicus_blastBED$V4 %in% c("MINAR1_Exon","WDR93_Exon","PEX11A_Exon"),]

Pc1 <- ggplot() +
  geom_line(data = SRR1797835_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1797835_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Pc1df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1797835_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Pc_x1, xmax= Pc_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Pc_x3, xmax= Pc_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Pc_mid1, y=-max(SRR1797835_Male_Gonad$V4)/7, label= Pc_l1, fontface = "italic") +
  annotate("text", x =12090000, y=-max(SRR1797835_Male_Gonad$V4)/7, label = Pc_l2, fontface = "italic")+
  annotate("text", x =Pc_mid3, y=-max(SRR1797835_Male_Gonad$V4)/7, label = Pc_l3, fontface = "italic")+
  labs(title=substitute(paste(italic('Phasianus colchicus'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('MINAR1 Exons', 'PEX11A Exons', 'WDR93 Exons'))

png("WDR93_2_RNA_seq_expression_exons.png",width=16,height=9,units="in",res=1200)
ggarrange(Ac1,Dn1,Tg1,Gg1,Mg1,Pc1, 
          labels = c("A)", "B)", "C)", "D)", "E)", "F)"),
          ncol = 3, nrow = 2,common.legend = TRUE, legend="bottom")

dev.off() 

###############zoomedIN

Ac2df<- Anolis_carolinensis_blastBED[Anolis_carolinensis_blastBED$V4 %in% c("WDR93_Exon"),]
Ac2 <- ggplot() +
  geom_line(data = SRR11050687_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR11050687_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Ac2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR11050687_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Ac_x1, xmax= Ac_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Ac_x3, xmax= Ac_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=229964, y=-max(SRR11050687_Testis$V4)/7, label= Ac_l1, fontface = "italic") +
  annotate("text", x =260000, y=-max(SRR11050687_Testis$V4)/7, label = Ac_l2, fontface = "italic")+
  annotate("text", x =Ac_mid3, y=-max(SRR11050687_Testis$V4)/7, label = Ac_l3, fontface = "italic")+
  xlim(242176, 257998)+
  labs(title=substitute(paste(italic('Anolis carolinensis'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('WDR93 Exons'))

Dn2df<- Dromaius_novaehollandiae_blastBED[Dromaius_novaehollandiae_blastBED$V4 %in% c("WDR93_Exon"),]
identify_rows <- SRR7026362_Testis$V2 >= 2676694 & SRR7026362_Testis$V2 <= 2691000
data_range1 <- SRR7026362_Testis[identify_rows, ]  
identify_rows2<- SRR7026362_Testis_split$V2 >= 2676694 & SRR7026362_Testis_split$V2 <= 2691000
data_range2 <- SRR7026362_Testis_split[identify_rows, ]  
Dn2 <- ggplot() +
  geom_line(data = SRR7026362_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR7026362_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Dn2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR7026362_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Dn_x1, xmax= Dn_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Dn_x3, xmax= Dn_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=2690726, y=-max(SRR7026362_Testis$V4)/7, label= Dn_l1, fontface = "italic") +
  annotate("text", x =2670000, y=-max(SRR7026362_Testis$V4)/7, label = Dn_l2, fontface = "italic")+
  annotate("text", x =Dn_mid3, y=-max(SRR7026362_Testis$V4)/7, label = Dn_l3, fontface = "italic")+
  xlim(2676694, 2689329)+
  labs(title=substitute(paste(italic('Dromaius novaehollandiae'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('WDR93 Exons'))
Dn3 <- ggplot() +
  geom_line(data = data_range1 ,aes(x = V2, y = V4), color="red")+
  geom_line(data = data_range2 ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Dn2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(data_range1$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Dn_x1, xmax= Dn_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Dn_x3, xmax= Dn_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=2690726, y=-max(data_range1$V4)/7, label= Dn_l1, fontface = "italic") +
  annotate("text", x =2670000, y=-max(data_range1$V4)/7, label = Dn_l2, fontface = "italic")+
  annotate("text", x =Dn_mid3, y=-max(data_range1$V4)/7, label = Dn_l3, fontface = "italic")+
  xlim(2676694, 2689329)+
  labs(title=substitute(paste(italic('Dromaius novaehollandiae'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('WDR93 Exons'))
Tg2df<- Taeniopygia_guttata_blastBED[Taeniopygia_guttata_blastBED$V4 %in% c("WDR93_Exon"),]
Tg2 <- ggplot() +
  geom_line(data = SRR8695301_Testis ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR8695301_Testis_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Tg2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR8695301_Testis$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Tg_x1, xmax= Tg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Tg_x3, xmax= Tg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=12637351, y=-max(SRR8695301_Testis$V4)/7, label= Tg_l1, fontface = "italic") +
  annotate("text", x =12620000, y=-max(SRR8695301_Testis$V4)/7, label = Tg_l2, fontface = "italic")+
  annotate("text", x =Tg_mid3, y=-max(SRR8695301_Testis$V4)/7, label = Tg_l3, fontface = "italic")+
  xlim(12625530, 12635986)+
  labs(title=substitute(paste(italic('Taeniopygia guttata'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('WDR93 Exons'))

Gg2df<- Gallus_gallus_blastBED[Gallus_gallus_blastBED$V4 %in% c("WDR93_Exon"),]

Gg2 <- ggplot() +
  geom_line(data = SRR2889305_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR2889305_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Gg2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR2889305_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Gg_x1, xmax= Gg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Gg_x3, xmax= Gg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Gg_mid1, y=-max(SRR2889305_Male_Gonad$V4)/7, label= Gg_l1, fontface = "italic") +
  annotate("text", x =12810000, y=-max(SRR2889305_Male_Gonad$V4)/7, label = Gg_l2, fontface = "italic")+
  annotate("text", x =Gg_mid3, y=-max(SRR2889305_Male_Gonad$V4)/7, label = Gg_l3, fontface = "italic")+
  xlim(12822406, 12828497)+
  labs(title=substitute(paste(italic('Gallus gallus'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('WDR93 Exons'))

Mg2df<- Meleagris_gallopavo_blastBED[Meleagris_gallopavo_blastBED$V4 %in% c("WDR93_Exon"),]

Mg2 <- ggplot() +
  geom_line(data = SRR1796090_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1796090_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Mg2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1796090_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Mg_x1, xmax= Mg_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Mg_x3, xmax= Mg_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Mg_mid1, y=-max(SRR1796090_Male_Gonad$V4)/7, label= Mg_l1, fontface = "italic") +
  annotate("text", x =12030000, y=-max(SRR1796090_Male_Gonad$V4)/7, label = Mg_l2, fontface = "italic")+
  annotate("text", x =Mg_mid3, y=-max(SRR1796090_Male_Gonad$V4)/7, label = Mg_l3, fontface = "italic")+
  xlim(12046445, 12053008)+
  labs(title=substitute(paste(italic('Meleagris gallopavo'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('WDR93 Exons'))

Pc2df<- Phasianus_colchicus_blastBED[Phasianus_colchicus_blastBED$V4 %in% c("WDR93_Exon"),]

Pc2 <- ggplot() +
  geom_line(data = SRR1797835_Male_Gonad ,aes(x = V2, y = V4), color="red")+
  geom_line(data = SRR1797835_Male_Gonad_split ,aes(x = V2, y = V4), color="green",alpha = .3)+
  geom_rect(data = Pc2df, aes(xmin = V2, xmax = V3, ymin = 0, ymax = -max(SRR1797835_Male_Gonad$V4)/9 , fill= V4))+
  labs(fill='Gene features')+
  annotate("rect", xmin= Pc_x1, xmax= Pc_x2, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("rect", xmin= Pc_x3, xmax= Pc_x4, ymin=0, ymax=Inf, alpha=0.2, fill="red")+
  annotate("text", x=Pc_mid1, y=-max(SRR1797835_Male_Gonad$V4)/7, label= Pc_l1, fontface = "italic") +
  annotate("text", x =12090000, y=-max(SRR1797835_Male_Gonad$V4)/7, label = Pc_l2, fontface = "italic")+
  annotate("text", x =Pc_mid3, y=-max(SRR1797835_Male_Gonad$V4)/7, label = Pc_l3, fontface = "italic")+
  xlim(12096161, 12102207)+
  labs(title=substitute(paste(italic('Phasianus colchicus'))),x ="Genomic Range", y = "Coverage")+
  scale_fill_discrete(labels=c('WDR93 Exons'))

png("WDR93_2_RNA_seq_expression_zoomedIN.png",width=16,height=9,units="in",res=1200)
ggarrange(Ac2,Dn3,Tg2,Gg2,Mg2,Pc2, 
          labels = c("A)", "B)", "C)", "D)", "E)", "F)"),
          ncol = 3, nrow = 2,common.legend = TRUE, legend="bottom")

dev.off() 
