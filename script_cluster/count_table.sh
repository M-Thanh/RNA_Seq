#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=17:42:00
#SBATCH --job-name=count_table
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/count_table/count_table_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/count_table/count_table_%j.e

# Load tool
module load UHTS/Analysis/subread/2.0.1;

# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/

cd $READS_DIR


# Count reads on CDS

featureCounts -T 4 -t CDS -g gene_id -a /data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/Rattus_norvegicus.mRatBN7.2.110.gtf -o count_table/CDS_counts_rawfile.txt sorted_bam/*_sorted.bam


# Extract GeneID and Sample column

cut -f 1,7-10 count_table/CDS_counts_rawfile.txt > count_table/CDS_counts_processed.txt

# extract columns 1 and columns 7 to 12 from the raw read count file generated in the previous step

cut -f 1,7-12 count_table/CDS_counts_rawfile.txt > count_table/CDS_counts_1712_processed.txt


# Addition

# Extract reads mapped to different biotypes
featureCounts -T 4 -t exon -g gene_biotype -a /data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/Rattus_norvegicus.mRatBN7.2.110.gtf -o count_table/biotype_counts_rawfile.txt  sorted_bam/*_sorted.bam

# Extract Biotype and Sample columns
cut -f 1,7-10 /count_table/biotype_counts_rawfile.txt > count_table/biotype_counts_processed.txt
cut -f 1,7-12 count_table/biotype_counts_rawfile.txt > count_table/biotype_counts_1712_processed.txt
