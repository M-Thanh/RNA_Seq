#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=10:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/fastqc/fastqc.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/fastqc/fastqc.e




# load tool

module load UHTS/Quality_control/fastqc/0.11.9

# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data

cd $READS_DIR

# create a dir to save fastqc report
mkdir fastqc                                        #create a dir to save fastqc report

#run fastqc for every fastq file in raw data folder
fastqc -o ./fastqc -f fastq ./raw/*.fastq.gz
