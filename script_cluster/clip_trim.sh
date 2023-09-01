#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20G
#SBATCH --time=24:00:00
#SBATCH --job-name=clip_trim
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/clip_trim.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/clip_trim.e
##SBATCH --partitiion-pcourse80



# load tool
module load UHTS/Quality_control/cutadapt/2.5


# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw

cd $READS_DIR



###################
# remove adapters from raw fastq files 
###################

#Clip "AGATCGGAAGAGCACACGTCTGAA" sequence from the 3' end.
#Cut 2 nt from the 5' end


# Clip 3' adapter and 2 nt from the 5' end

for x in $(ls -d *.fastq.gz); do echo ${x}; \
cutadapt \
-j 12 \
-a AGATCGGAAGAGCACACGTCTGAA \
-q 25 \
--cut 2 \
--minimum-length 22 \
--discard-untrimmed \
--overlap 3 \
-e 0.2 \
-o $(basename ${x} .fastq.gz)_clpd.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_clpd_log.txt; done

###################
# trim adapters the clipped fastq 
###################
#cut 10 nt from the 3' end


for x in $(ls -d *_clpd.fastq.gz); do echo ${x}; \
cutadapt \
-j 12 \
-q 25 \
--cut -10 \
--minimum-length 22 \
-o $(basename ${x} .fastq.gz)_tr.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_tr_log.txt; done

