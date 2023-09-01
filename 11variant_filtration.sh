#!/bin/bash
#SBATCH --job-name=VF_grandest
#SBATCH --account=ac_acblackman
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/users/victorcg/pipeline/23pipeline/outputs/VF.err
#SBATCH --output=/global/scratch/users/victorcg/pipeline/23pipeline/outputs/VF.out
#SBATCH --mail-user=victor.cg@berkeley.edu
#SBATCH --mail-type=All

module load java

/global/home/users/victorcg/software/gatk-4.2.6.1/gatk --java-options "-Xmx32g -Xms4g" \
                                                       VariantFiltration \
    -R /global/scratch/users/victorcg/pipeline/alignment/bam_compilation/Mguttatus_256_v2.0.fa \
    -V 23grandest.vcf \
    --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
    --filter-name "my_snp_filter" \
    -O 23grandest_vf.vcf 
