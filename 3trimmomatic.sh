#!/bin/bash
#SBATCH --job-name=mole_trim
#SBATCH --account=fc_blackman
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/users/victorcg/pipeline/files/mol_eco/mole_outputs/missed.error.txt
#SBATCH --output=/global/scratch/users/victorcg/pipeline/files/mol_eco/mole_outputs/missed.output.txt
#SBATCH --mail-user=victor.cg@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/users/victorcg/pipeline/files/mol_eco/missed

export MODULEPATH=/clusterfs/vector/home/groups/software/sl-7.x86_64/modfiles:$MODULEPATH

module load trimmomatic

for f in *1.fastq; do input1=${f%_1.fastq}; java -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/trimmomatic/0.36/trimmomatic-0.36.jar PE ${input1}_1.fastq ${input1}_2.fastq ${input1}_1.trim.fastq ${input1}_1.untrim.fastq ${input1}_2.trim.fastq ${input1}_2.untrim.fastq ILLUMINACLIP:NexteraPE-PE.fa:2:30:10 SLIDINGWINDOW:4:15; done
