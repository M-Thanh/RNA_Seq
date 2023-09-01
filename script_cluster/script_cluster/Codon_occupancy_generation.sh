#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=4:42:00
#SBATCH --job-name=codon_accupancy
#SBATCH --mail-user=thanh.nguyen@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/courses/rnaseq_course/ribosome_profiling/mt/data/codon_occupancy/codon_occupancy_%j.o
#SBATCH --error=/data/courses/rnaseq_course/ribosome_profiling/mt/data/codon_occupancy/codon_occupancy_%j.e

# give directory path
READS_DIR=/data/courses/rnaseq_course/ribosome_profiling/mt/data/codon_occupancy/

cd $READS_DIR

./Codon_occupancy_cal.sh \
mRatBN7.2_rn7_APPRIS_CDS_plus18_SingleLine.fa \
neuropil_1_clpd_tr_desired_readsRNA_mRatBN7.2_rn7_APPRIS_CDS_plus18_.sam

mv Codon_occupancy.txt neuropil_1_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
mRatBN7.2_rn7_APPRIS_CDS_plus18_SingleLine.fa \
neuropil_2_clpd_tr_desired_readsRNA_mRatBN7.2_rn7_APPRIS_CDS_plus18_.sam

mv Codon_occupancy.txt neuropil_2_Codon_occupancy.txt


./Codon_occupancy_cal.sh \
mRatBN7.2_rn7_APPRIS_CDS_plus18_SingleLine.fa \
neuropil_3_clpd_tr_desired_readsRNA_mRatBN7.2_rn7_APPRIS_CDS_plus18_.sam

mv Codon_occupancy.txt neuropil_3_Codon_occupancy.txt



./Codon_occupancy_cal.sh \
mRatBN7.2_rn7_APPRIS_CDS_plus18_SingleLine.fa \
somata_1_clpd_tr_desired_readsRNA_mRatBN7.2_rn7_APPRIS_CDS_plus18_.sam

mv ./Codon_occupancy.txt ./somata_1_Codon_occupancy.txt


./Codon_occupancy_cal.sh \
mRatBN7.2_rn7_APPRIS_CDS_plus18_SingleLine.fa \
somata_2_clpd_tr_desired_readsRNA_mRatBN7.2_rn7_APPRIS_CDS_plus18_.sam

mv Codon_occupancy.txt somata_2_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
mRatBN7.2_rn7_APPRIS_CDS_plus18_SingleLine.fa \
somata_3_clpd_tr_desired_readsRNA_mRatBN7.2_rn7_APPRIS_CDS_plus18_.sam

mv Codon_occupancy.txt somata_3_Codon_occupancy.txt
