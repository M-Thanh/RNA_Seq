#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH --time=7:00:00
#SBATCH --job-name=download_raw_files
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/load_sample_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw/load_sample_%j.e




# load tool
module load UHTS/Analysis/sratoolkit/2.10.7


# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/raw

cd $READS_DIR

#module load SRA-Toolkit/3.0.5-gompi-2021a;

# the latest version is not working
#ModuleCmd_Load.c(213):ERROR:105: Unable to locate a modulefile for 'SRA-Toolkit/3.0.5-gompi-2021a'



# download the interested samples
prefetch SRR9596295				#  Somata_Polysome_01
prefetch SRR9596296				#  Somata_Polysome_02
prefetch SRR9596300				#  Somata_Polysome_03
prefetch SRR9596310				#  Neuropil_Polysome_01
prefetch SRR9596303				#  Neuropil_Polysome_02
prefetch SRR9596304				#  Neuropil_Polysome_03	

# Move the .sra files in one directory

mv SRR9596295/SRR9596295.sra .
mv SRR9596296/SRR9596296.sra .
mv SRR9596300/SRR9596300.sra .
mv SRR9596310/SRR9596310.sra .
mv SRR9596303/SRR9596303.sra .
mv SRR9596304/SRR9596304.sra .

# delete the folder 
rm -r SRR9596295 SRR9596296 SRR9596300 SRR9596310 SRR9596303 SRR9596304

# convert sra files to fastq using fastq dump. 
# use --gzip to compress the output fastq files to fast.gz


fastq-dump --gzip SRR*.sra			

