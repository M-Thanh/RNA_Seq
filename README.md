# RNA_Seq
This is a project of Ribosome profiling from RNA sequencing course
This project is a part of the Ribosome Profiling module within the RNA Sequencing course from the Bioinformatics and Computational Biology program, provided by the University of Bern and the University of Fribourg.



Case study:
A recent study (DOI: 10.1126/science.aay4991) analyzed protein translation in the cell body and the processes of the neurons. A key conclusion of this study is that the neuronal bodies preferentially translate via polysomes while mRNA in the neuronal processes are preferably translated by monosomes. 

BioProject accession number: PRJNA550323

Organism of interest: Rattus norvegicus (Rat)

Samples of interest:

SRR9596295: Somata_Polysome_01

SRR9596296: Somata_Polysome_02

SRR9596300: Somata_Polysome_03

SRR9596310: Neuropil_Polysome_01

SRR9596303: Neuropil_Polysome_02

SRR9596304: Neuropil_Polysome_03


Go throught the basic Ribosome profiling data analysis in this project step by step to answer the question: "Is there a difference between polysome mediated translation in somata and neuropil?"


Work flow:

Find the data of interest
Procure the data
Quality control
Data preprocessing
Prepare annotations
Remove undesired RNA
Map to genome
Map to transcriptome
QC: Periodicity, read distribution, frame
Differential expression analysis
GO analysis
Estimation of codon decoding speed



*** the main.txt contains all commands run interactive on cluster IBU (linux system)

*** the .sh script files to run on cluster are on folder script_cluster

*** the .R script files are on folder script_R (I run on my own laptop, R version 4.2.2)

