#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=17:42:00
#SBATCH --job-name=mapping_genome
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_genome/map_genome_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_genome/map_genome_%j.e

# Load tool
module load UHTS/Aligner/bowtie/1.2.0;

module load UHTS/Analysis/samtools/1.10;
#module load SAMtools/1.13-GCC-10.3.0;


# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_genome/

cd $READS_DIR

for x in *RNA.fastq; do
    echo "${x}"
    bowtie \
	-S -t -p 4 -v 1 -m 1 --best --strata \
	/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/dna.toplevel -q "${x}" \
	2> "$(basename "${x}" .fastq)_Rnor_7_dna_log.txt" | \
    samtools view -h -F 4 -b > "$(basename "${x}" .fastq)_Rnor_7_dna.bam"
done



