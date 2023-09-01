#!/bin/bash
#SBATCH --job-name=23_GVCF
#SBATCH --account=co_rosalind
#SBATCH --partition=savio2_htc
#SBATCH --qos=rosalind_htc2_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/23outputs/4gatk.GVCF.%A_%a.err
#SBATCH --output=/global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/23outputs/4gatk.GVCF.%A_%a.out
#SBATCH --mail-user=victor.cg@berkeley.edu
#SBATCH --mail-type=All
#SBATCH --array=1-330
#SBATCH --cpus-per-task=4

cd /global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam

module load java


SAMPLE=`ls *_RG.bam | head -n $SLURM_ARRAY_TASK_ID | tail -n 1` ;
PREFIX=`basename $SAMPLE _RG.bam` ;

/global/home/users/victorcg/software/gatk-4.2.6.1/gatk --java-options "-Xmx64G" HaplotypeCaller\
                                                       -R /global/scratch/users/victorcg/pipeline/alignment/bam_compilation/Mguttatus_256_v2.0.fa\
                                                       -I /global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/${PREFIX}_RG.bam\
                                                       -O /global/scratch/users/victorcg/pipeline/alignment/bam_compilation/completed_files/bam/23GVCF/${PREFIX}.vcf -ERC GVCF\
                                                       --min-base-quality-score 25 \
                                                       --max-alternate-alleles 1 \
                                                       -ploidy 2 \
                                                       --heterozygosity 0.02\
