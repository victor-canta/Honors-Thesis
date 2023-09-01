making a script that will get our scaffolds in order
#!/bin/bash
#SBATCH --job-name=bcf_concat
#SBATCH --account=ac_acblackman
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/users/victorcg/pipeline/23pipeline/outputs/concat.err
#SBATCH --output=/global/scratch/users/victorcg/pipeline/23pipeline/outputs/concat.out
#SBATCH --mail-user=victor.cg@berkeley.edu
#SBATCH --mail-type=All

module load bcftools
cd /global/scratch/users/victorcg/pipeline/23pipeline/missing_data_filter/spanning_indel_filter
bcftools concat db1.1-3_missingRemoved_SindelsRemoved.vcf db1.4-5_missingRemoved_SindelsRemoved.vcf db1.6-7_missingRemoved_SindelsRemoved.vcf db1.8_missingRemoved_SindelsRemoved.vcf db1.9-10_missingRemoved_SindelsRemoved.vcf db1.11_missingRemoved_SindelsRemoved.vcf db1.12_missingRemoved_SindelsRemoved.vcf db1.13_missingRemoved_SindelsRemoved.vcf db1.14_missingRemoved_SindelsRemoved.vcf db4_missingRemoved_SindelsRemoved.vcf db5_missingRemoved_SindelsRemoved.vcf db6_missingRemoved_SindelsRemoved.vcf db7_missingRemoved_SindelsRemoved.vcf -o 23grandest.vcf
