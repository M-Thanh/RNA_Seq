#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=14:42:00
#SBATCH --job-name=remove_undesiredRNA
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/remove_undesiredRNA/new/remove_undesiredRNA_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/remove_undesiredRNA/new/remove_undesiredRNA_%j.e


## Loads tool
module load UHTS/Aligner/bowtie/1.2.0;


# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/remove_undesiredRNA/new/

cd $READS_DIR

#for x in $(ls -d *tr.fastq); \
#do echo ${x}; \
#bowtie \
#-S \
#-t \
#-p 4 \
#/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/rnor_r_sno_sn_t_RNA \ 
#${x} \
#--un $(basename ${x} .fastq)_desired_reads.fastq \
#2> $(basename ${x} .fastq)_desired_reads_log.txt > /dev/null; done

#chatgpt with >/dev/null
# The redirect > /dev/null at the end of the bowtie command will suppress the standard output. If you want to see the command's output (including potential error messages), you should remove this redirect.

for x in *tr.fastq; do
    echo "${x}"
    bowtie -S -t -p 4 /data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/rnor_r_sno_sn_t_RNA "${x}" --un "$(basename "${x}" .fastq)_desired_readsRNA.fastq" 2> "$(basename "${x}" .fastq)_desired_reads_log.txt" > /dev/null
done


