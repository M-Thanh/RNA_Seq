#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=00:30:00
#SBATCH --job-name=sort_bam_files
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_genome/sort_bam_files_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_genome/sort_bam_files_%j.e

# Load tool
module load UHTS/Analysis/samtools/1.10;

# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_genome/

cd $READS_DIR

for x in *.bam; do 
	echo "${x}" 
	samtools sort -@ 4 "${x}" -o "$(basename "${x}" .bam)_sorted.bam" 
done
