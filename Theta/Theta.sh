#!/bin/bash
#$ -S /bin/bash
#$ -N C3.MODC.ATLAS.GlobDiv  ##job name
#$ -l tmem=16G #RAM
#$ -l h_vmem=16G #enforced limit on shell memory usage
#$ -l h_rt=10:00:00 ##wall time.
#$ -j y  #concatenates error and output files (with prefix job1)
#$ -t 1-40


#Run on working directory
cd $SGE_O_WORKDIR


#Path to software
export LD_LIBRARY_PATH=/share/apps/openblas-0.3.6/lib:/share/apps/armadillo-9.100.5/lib64:$LD_LIBRARY_PATH
ATLAS=/share/apps/genomics/atlas-0.9/atlas


#Define variables
SHAREDFOLDER=/SAN/ugi/LepGenomics
SPECIES=C3_Aricia_agestis_FP
REF=$SHAREDFOLDER/$SPECIES/RefGenome/GCA_905147365.1_ilAriAges1.1_genomic.fna
INPUT=$SHAREDFOLDER/$SPECIES/04_ATLAS/MODC
OUTPUT=$SHAREDFOLDER/$SPECIES/04_ATLAS/MODC
TASK=theta



##Define ARRAY
NAME=$(sed "${SGE_TASK_ID}q;d" modc.bamlist)


#Run analysis
#while IFS=  read -r line; do $ATLAS task=$TASK bam=$INPUT/$line; done < $INPUT

$ATLAS task=$TASK bam=$INPUT/${NAME}
