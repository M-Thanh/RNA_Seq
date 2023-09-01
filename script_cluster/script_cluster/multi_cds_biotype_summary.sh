#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4G
#SBATCH --time=14:00:00
#SBATCH --job-name=multifastqc
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/multiQCcounttable/multiqc_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/multiQCcounttable/multiqc_%j.e

module load UHTS/Analysis/MultiQC/1.8



# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/multiQCcounttable/

cd $READS_DIR

multiqc CDS_counts_rawfile.txt.summary --title "quantification_cds"
multiqc biotype_counts_rawfile.txt.summary --title "quantification_bio"
