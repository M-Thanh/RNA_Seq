#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=10G
#SBATCH --time=17:30:00
#SBATCH --job-name=index
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/index_annotation.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/index_annotation.e

module load UHTS/Aligner/bowtie/1.2.0;

# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation

cd $READS_DIR

# For the "undesired" RNAs

#bowtie-build GRCh38_p13_r-t-sno-sn-RNA_ENSEMBL_NCBI_GtRNAdb.fa GRCh38_p13_r-t-sno-sn-RNA_ENSEMBL_NCBI_GtRNAdb

bowtie-build rnor_r_sno_sn_t_RNA.fa rnor_r_sno_sn_t_RNA


# For the genome

#bowtie-build GRCh38.p13.genome.fa GRCh38.p13.genome

bowtie-build Rattus_norvegicus.mRatBN7.2.dna.toplevel.fa dna.toplevel

# For the transcriptome
#bowtie-build GRCh38_p13_APPRIS_CDS_plus18.fa GRCh38_p13_APPRIS_CDS_plus18

bowtie-build mRatBN7.2_rn7_APPRIS_CDS_plus18.fa mRatBN7.2_rn7_APPRIS_CDS_plus18


