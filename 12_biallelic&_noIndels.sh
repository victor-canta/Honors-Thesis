vcftools --vcf 23grandest_vf.vcf --remove-indels --min-alleles 2 --max-alleles 2 --recode --recode-INFO-all --stdout | gzip > 23grandest_vf_biallelic.vcf.gz 
