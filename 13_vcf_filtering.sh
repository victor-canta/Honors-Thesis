#!/bin/bash
#SBATCH --job-name=max-miss
#SBATCH --account=ac_acblackman
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/users/victorcg/pipeline/23pipeline/outputs/max-miss.err
#SBATCH --output=/global/scratch/users/victorcg/pipeline/23pipeline/outputs/max-miss.out
#SBATCH --mail-user=victor.cg@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/users/victorcg/pipeline/23pipeline

module load bio/vcftools

#remove sites missing 75% of data

vcftools --vcf 23grandest_vf_c1.vcf --max-missing 0.25 --recode --recode-INFO-all --stdout | gzip > 23grandest_vf_max-miss.vcf.gz


#remove individuals with too much missingness
#vcftools --gzvcf 23grandest_vf_max-miss.vcf.gz  --remove-indv IM28 --remove-indv <insert actual individuals> --out #data.ed.imiss90 --recode --recode-INFO-all --stdout | gzip > 23grandest_vf_max-miss_miss90.vcf.gz

#filter for sites missing 60% of tata
vcftools --gzvcf 23grandest_vf_max-miss90 --max-missing 0.4 --recode --recode-INFO-all --stdout | gzip > 23grandest_vf_max-miss60_miss90.vcf.gz
