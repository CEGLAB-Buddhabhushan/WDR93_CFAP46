samtools view -b Gal6_packbio_merged.sorted.bam 10:13170345-13267371 > WDR93_PacBio_subseted.bam

bamToBed -i WDR93_PacBio_subseted.bam > WDR93_PacBio_subseted.bed

awk '{print $0,$3-$2}' WDR93_PacBio_subseted.bed  | awk '$7 >= 20000 {print $0}'  > WDR93_PacBio_subseted_20kb.bed

