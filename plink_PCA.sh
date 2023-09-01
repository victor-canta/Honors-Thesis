#!/bin/bash
#SBATCH --job-name=plink_pca
#SBATCH --account=ac_acblackman
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/users/victorcg/pipeline/23pipeline/Biallelic_NoIndels/outputs/pca.err
#SBATCH --output=/global/scratch/users/victorcg/pipeline/23pipeline/Biallelic_NoIndels/outputs/pca.out
#SBATCH --mail-user=victor.cg@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/users/victorcg/pipeline/23pipeline/Biallelic_NoIndels

module load python
source activate plink2


plink2 --vcf 23grand_biallelic_vf_vcftools_pruned0.2_varID_sortFixed.vcf --double-id --pca --allow-extra-chr --out PCA/23grand_0.2_pca
 
