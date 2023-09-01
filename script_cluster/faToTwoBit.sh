#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=7:42:00
#SBATCH --job-name=fasta_22Bit_genome_file
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/faToTwoBit/faToTwoBit_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/faToTwoBit/faToTwoBit_%j.e

# Load tool
module load SequenceAnalysis/blat/36;


# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/annotation/faToTwoBit/

cd $READS_DIR

faToTwoBit Rattus_norvegicus.mRatBN7.2.dna.toplevel.fa Rattus_norvegicus.mRatBN7.2.dna.toplevel.2bit
