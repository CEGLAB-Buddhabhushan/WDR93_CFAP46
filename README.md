# WDR93_CFAP46
This GitHub repository contains the data for paper **"Concurrent loss of ciliary genes _WDR93_ and _CFAP46_ in phylogenetically distant birds".**

Buddhabhushan Girish Salve, Amia Miriam Kurian, Nagarjun Vijay

Computational Evolutionary Genomics Lab, Department of Biological Sciences, IISER Bhopal, Bhauri,
Madhya Pradesh, India
*Correspondence: nagarjun@iiserb.ac.in

## Graphical abstract
![graphical_abstract](https://github.com/CEGLAB-Buddhabhushan/WDR93_CFAP46/blob/main/Main_figures/graphical_abstract.jpg)
**Folder Structure**
- **Assembly_verification:** Contain the bam, bed, and UCSC screenshot for long-read verification at _WDR93_ and _CFAP46_ gene locus for the Acanthisitta chloris, Anas platyrhynchos, Anser cygnoides, Calypte anna, and Gallus gallus. **(Fig. 2, Fig. S4, S27, S29-31, S34-36)**
- **CFAP46_blast_results:** Contains the raw read blastn result for the CFAP46 gene for the species in which WDR93 loss and query sequence is used in BLASTN.
- **CFAP46_deletion:** Contains the fasta sequence used to get dot-plot and UCSC browser track data for deletion size comparison with Mallard. **(Fig. 8, Fig. S32-S33)**
- **CLANS:** Contains the _WDR93_ and _NDUFS4_ domain containing clans results. **(Fig. S1)**
- **Events:** The blastn output supporting the gene pseudogenization and MView html file for the Geese and other species where WDR93 is lost. ( Anser brachyrhynchus, Anser cygnoides, Anser indicus, Branta canadensis, Acanthisitta chloris, Calidris pugnax, Calypte anna, and Colius striatus) **(Fig. 3, 4, 7, Fig. S2, S3, S5)** 
- **Main_figures:** Contains the main and abstract figures and the inputs required to get figures like phylogenetic trees from TimeTree and iTOLs. **(Fig. 1-8, abstract_figure)**
- **WDR93_mol_evo_analysis:**  Selection pressure analysis of _WDR93_ gene across clades, checked using RELAX, codeML, gBGC, MEME (Mixed Effects Model of Evolution), and FEL (Fixed Efects Likelihood).
- **CFAP46_mol_evo_analysis:**  Selection pressure analysis of _CFAP46_ gene across clades, checked using RELAX and gBGC (GC-biased gene conversion).
- **Pairwise_alignment:** Contains the pairwise alignment between Mallard and chicken in the _CFAP46_ region.
- **Synteny:**  Contains the NCBI synteny images for _WDR93_. **(Fig. 1)**
- **Transcriptome_analysis:** Contains the input files for coverage plots. Also, contain an IGV screenshot for the _WDR93_ gene. **(Fig. 5-6, Fig. S6-26)**
- **WDR93_blast_results:**  Contains the Genome and SRA blastn results for _WDR93_ for finding the gene disrupting changes and their confirmation.

____________________________________________________________________________________________________________________________________________________
**Prerequisites:**
- TOGA (v1.1.2)
- make_lastz_chains (https://github.com/hillerlab/make_lastz_chains.git)
- PAML (4.9f)
- BLASTN 2.9.0+
- phastBias(1.6)
- mapnh(1.3.0)
- HYPHY 2.5.48(MP)
- HYPHY-MEME 2.3.14.20181224beta(MP) 
- HYPHY-FEL 2.3.14.20181224beta(MP) 
- BWA(0.7.17-r1188)
- Samtools (1.3)
- bedtools (v2.26.0)
- ea-utils (https://github.com/ExpressionAnalysis/ea-utils.git)
- seqtk (1.2-r94)
- Guidance (v2.02)
- PRANK (v.150803)
- IGV (2.8.13)
- STAR (2.7.0d)
- MegaX
- MView (Version 1.67)
- CLANS
- Pfam (34.0)
- R (4.1.0)
- Pymol (Version 2.3.0)

**R packages:**
- ape (5.5)
- phytools (0.7-90)
- ggplot2 (3.3.5)
- ggrepel (0.9.1)
- cowplot (1.1.1)
- dplyr (1.0.7)
- ggplotify (0.1.0)
- grid (4.1.1)
- gridExtra (2.3)
- reshape2 (1.4.4)
