for f in *.vcf;
do name=${f%.vcf}; \
mv ${name}.vcf ${name}.g.vcf; done
