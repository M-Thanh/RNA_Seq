#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4G
#SBATCH --time=14:00:00
#SBATCH --job-name=multifastqc
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/multiqcresult/multiqc_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/multiqcresult/multiqc_%j.e

module load UHTS/Analysis/MultiQC/1.8


# Load tool
module add UHTS/Quality_control/fastqc/0.11.9

# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/multiqcresult

cd $READS_DIR

multiqc .
