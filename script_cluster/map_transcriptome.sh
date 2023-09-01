#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=17:42:00
#SBATCH --job-name=mapping_transcriptome
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_transcriptome/map_transcriptome_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_transcriptome/map_transcriptome_%j.e

# Load tool
module load UHTS/Aligner/bowtie/1.2.0;


# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/map_transcriptome/

cd $READS_DIR

for x in *RNA.fastq; do
    echo "${x}"
    bowtie \
	-t -p 4 -v 1 -m 1 --best --strata --norc \
	/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/mRatBN7.2_rn7_APPRIS_CDS_plus18 \
	 -q "${x}" \
	-S "$(basename "${x}" .fastq)_mRatBN7.2_rn7_APPRIS_CDS_plus18_.sam"
	2> "$(basename "${x}" .fastq)_mRatBN7.2_rn7_APPRIS_CDS_plus18_log.txt" 
done




