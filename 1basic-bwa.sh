#!/bin/bash
#SBATCH --job-name= basic-bwa
#SBATCH --account=fc_blackman
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=0:10:00
#SBATCH --error=/global/scratch/users/victorcg/outputs/error.txt
#SBATCH --output=/global/scratch/users/victorcg/outputs/output.txt
#SBATCH --mail-user=example@email.edu
#SBATCH --mail-type=All

#aligns fastq reads into a sam
cd directory
for f in *_1.fastq; do NAME=`echo $f | cut -d "_" -f 1`; bwa mem -t 7 Mguttatus_256_v2.0.fa ${NAME}_1.fastq ${NAME}_2.fastq > path/$NAME.sam; done
