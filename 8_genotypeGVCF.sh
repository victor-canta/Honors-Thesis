#!/bin/bash
#SBATCH --job-name=geno_db<#>
#SBATCH --account=ac_acblackman
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/23GVCF/backup/outputs/geno_db<#>.err
#SBATCH --output=/global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/23GVCF/backup/outputs/geno_<#>.out
#SBATCH --mail-user=victor.cg@berkeley.edu
#SBATCH --mail-type=All



cd /global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/23GVCF/

module load java


/global/home/users/victorcg/software/gatk-4.2.6.1/gatk --java-options "-Xmx32g -Xms4g" \
                                                       GenotypeGVCFs \
                                                       -R /global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/23GVCF/test/Mguttatus_256_v2.0.fa \
                                                       -V gendb://DBFiles<#> \
                                                       -O db<#>.vcf

 
