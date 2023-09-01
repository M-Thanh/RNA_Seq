# In R studio (for example)

# Installation of the package (to be done only once!)
#install.packages("devtools")

library("devtools")

devtools::install_github("lcalviell/Ribo-seQC") 

#install_github(repo = "lcalviell/Ribo-seQC")
suppressPackageStartupMessages(library("RiboseQC"))

# install.packages("remotes")
# 
# remotes::install_github("lcalviell/Ribo-seQC")

###### Analysis part ######


setwd("F:/RNAseq/R/RiboseQC")

# Load the package
library("RiboseQC")

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = ".",
                         twobit_file = "Rattus_norvegicus.mRatBN7.2.dna.toplevel.2bit",
                         gtf_file = "Rattus_norvegicus.mRatBN7.2.110.gtf",
                         scientific_name = "Rattus.norvegicus",
                         annotation_name = "Rnor_7",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files

genome_bam <- c("bam/neuropil_1_clpd_tr_desired_readsRNA_Rnor_7_dna_sorted.bam",
                "bam/neuropil_2_clpd_tr_desired_readsRNA_Rnor_7_dna_sorted.bam",
                "bam/neuropil_3_clpd_tr_desired_readsRNA_Rnor_7_dna_sorted.bam",
                "bam/somata_1_clpd_tr_desired_readsRNA_Rnor_7_dna_sorted.bam",
                "bam/somata_2_clpd_tr_desired_readsRNA_Rnor_7_dna_sorted.bam",
                "bam/somata_3_clpd_tr_desired_readsRNA_Rnor_7_dna_sorted.bam")

load_annotation("Rattus_norvegicus.mRatBN7.2.110.gtf_Rannot")


###### QC plots ######

RiboseQC_analysis(annotation_file =".",
                  bam_files = genome_bam,
                  fast_mode = T,
                  report_file = "Rnor_Biever_QC.html",
                  sample_names = c("Neuropil_Poly_1", "Neuropil_Poly_2", "Neuropil_Poly_3",
                                   "Somata_Poly_1", "Somata_Poly_2", "Somata_Poly_3"),
                  dest_names = c("Neuropil_Poly_1", "Neuropil_Poly_2", "Neuropil_Poly_3",
                                 "Somata_Poly_1", "Somata_Poly_2", "Somata_Poly_3"),
                  write_tmp_files = F)
