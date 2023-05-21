hyphy<- read.table("Final_HYPHY_RELAX.Results.txt", sep = "\t", header  = T)
df <- data.frame(hyphy)

Actinopterygii_group1_df<- df[df$clade=="Actinopterygii_group1",]
Actinopterygii_group1_df$adjusted_p_value <- p.adjust(Actinopterygii_group1_df$pval, method = "fdr")
write.table(Actinopterygii_group1_df, file='Actinopterygii_group1.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Actinopterygii_group2_df<- df[df$clade=="Actinopterygii_group2",]
Actinopterygii_group2_df$adjusted_p_value <- p.adjust(Actinopterygii_group2_df$pval, method = "fdr")
write.table(Actinopterygii_group2_df, file='Actinopterygii_group2.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Actinopterygii_group3_df<- df[df$clade=="Actinopterygii_group3",]
Actinopterygii_group3_df$adjusted_p_value <- p.adjust(Actinopterygii_group3_df$pval, method = "fdr")
write.table(Actinopterygii_group3_df, file='Actinopterygii_group3.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Actinopterygii_group4_df<- df[df$clade=="Actinopterygii_group4",]
Actinopterygii_group4_df$adjusted_p_value <- p.adjust(Actinopterygii_group4_df$pval, method = "fdr")
write.table(Actinopterygii_group4_df, file='Actinopterygii_group4.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Actinopterygii_group5_df<- df[df$clade=="Actinopterygii_group5",]
Actinopterygii_group5_df$adjusted_p_value <- p.adjust(Actinopterygii_group5_df$pval, method = "fdr")
write.table(Actinopterygii_group5_df, file='Actinopterygii_group5.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Afrotheria_df<- df[df$clade=="Afrotheria",]
Afrotheria_df$adjusted_p_value <- p.adjust(Afrotheria_df$pval, method = "fdr")
write.table(Afrotheria_df, file='Afrotheria.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Amphibia_df<- df[df$clade=="Amphibia",]
Amphibia_df$adjusted_p_value <- p.adjust(Amphibia_df$pval, method = "fdr")
write.table(Amphibia_df, file='Amphibia.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Artiodactyla_df<- df[df$clade=="Artiodactyla",]
Artiodactyla_df$adjusted_p_value <- p.adjust(Artiodactyla_df$pval, method = "fdr")
write.table(Artiodactyla_df, file='Artiodactyla.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Aves_group1_df<- df[df$clade=="Aves_group1",]
Aves_group1_df$adjusted_p_value <- p.adjust(Aves_group1_df$pval, method = "fdr")
write.table(Aves_group1_df, file='Aves_group1.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Aves_group2_df<- df[df$clade=="Aves_group2",]
Aves_group2_df$adjusted_p_value <- p.adjust(Aves_group2_df$pval, method = "fdr")
write.table(Aves_group2_df, file='Aves_group2.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Aves_group3_df<- df[df$clade=="Aves_group3",]
Aves_group3_df$adjusted_p_value <- p.adjust(Aves_group3_df$pval, method = "fdr")
write.table(Aves_group3_df, file='Aves_group3.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Aves_group4_df<- df[df$clade=="Aves_group4",]
Aves_group4_df$adjusted_p_value <- p.adjust(Aves_group4_df$pval, method = "fdr")
write.table(Aves_group4_df, file='Aves_group4.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Carnivora_df<- df[df$clade=="Carnivora",]
Carnivora_df$adjusted_p_value <- p.adjust(Carnivora_df$pval, method = "fdr")
write.table(Carnivora_df, file='Carnivora.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Chiroptera_df<- df[df$clade=="Chiroptera",]
Chiroptera_df$adjusted_p_value <- p.adjust(Chiroptera_df$pval, method = "fdr")
write.table(Chiroptera_df, file='Chiroptera.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Chondrichthyes_df<- df[df$clade=="Chondrichthyes",]
Chondrichthyes_df$adjusted_p_value <- p.adjust(Chondrichthyes_df$pval, method = "fdr")
write.table(Chondrichthyes_df, file='Chondrichthyes.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Crocodylia_df<- df[df$clade=="Crocodylia",]
Crocodylia_df$adjusted_p_value <- p.adjust(Crocodylia_df$pval, method = "fdr")
write.table(Crocodylia_df, file='Crocodylia.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Eulipotyphla_df<- df[df$clade=="Eulipotyphla",]
Eulipotyphla_df$adjusted_p_value <- p.adjust(Eulipotyphla_df$pval, method = "fdr")
write.table(Eulipotyphla_df, file='Eulipotyphla.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Monotremata_Metatheria_df<- df[df$clade=="Monotremata_Metatheria",]
Monotremata_Metatheria_df$adjusted_p_value <- p.adjust(Monotremata_Metatheria_df$pval, method = "fdr")
write.table(Monotremata_Metatheria_df, file='Monotremata_Metatheria.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Perissodactyla_df<- df[df$clade=="Perissodactyla",]
Perissodactyla_df$adjusted_p_value <- p.adjust(Perissodactyla_df$pval, method = "fdr")
write.table(Perissodactyla_df, file='Perissodactyla.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Primates_df<- df[df$clade=="Primates",]
Primates_df$adjusted_p_value <- p.adjust(Primates_df$pval, method = "fdr")
write.table(Primates_df, file='Primates.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Rodentia_df<- df[df$clade=="Rodentia",]
Rodentia_df$adjusted_p_value <- p.adjust(Rodentia_df$pval, method = "fdr")
write.table(Rodentia_df, file='Rodentia.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Serpentes_df<- df[df$clade=="Serpentes",]
Serpentes_df$adjusted_p_value <- p.adjust(Serpentes_df$pval, method = "fdr")
write.table(Serpentes_df, file='Serpentes.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Squamata_df<- df[df$clade=="Squamata",]
Squamata_df$adjusted_p_value <- p.adjust(Squamata_df$pval, method = "fdr")
write.table(Squamata_df, file='Squamata.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)
Testudines_df<- df[df$clade=="Testudines",]
Testudines_df$adjusted_p_value <- p.adjust(Testudines_df$pval, method = "fdr")
write.table(Testudines_df, file='Testudines.HYPHY-RELAX.tsv', quote=T, sep='\t', col.names = NA)

Final_HYPHY_RELAX<-rbind(Actinopterygii_group1_df,Actinopterygii_group2_df,Actinopterygii_group3_df,Actinopterygii_group4_df,Actinopterygii_group5_df,Afrotheria_df,Amphibia_df,Artiodactyla_df,Aves_group1_df,Aves_group2_df,Aves_group3_df,Aves_group4_df,Carnivora_df,Chiroptera_df,Chondrichthyes_df,Crocodylia_df,Eulipotyphla_df,Monotremata_Metatheria_df,Perissodactyla_df,Primates_df,Rodentia_df,Serpentes_df,Squamata_df,Testudines_df)
write.table(Final_HYPHY_RELAX, file='Final.HYPHY-RELAX_p_adj.tsv', quote=T, sep='\t', col.names = NA)
