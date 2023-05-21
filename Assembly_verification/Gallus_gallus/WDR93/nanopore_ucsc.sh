samtools view -b SRR15421342_3_4_5_SRR13494713_4_sorted.bam 10:13170345-13267371 > WDR93_Nanopore_subseted.bam

bamToBed -i WDR93_Nanopore_subseted.bam > WDR93_Nanopore_subseted.bed

awk '{print $0,$3-$2}' WDR93_Nanopore_subseted.bed  | awk '$7 >= 20000 {print $0}'  > WDR93_Nanopore_subseted_20kb.bed

