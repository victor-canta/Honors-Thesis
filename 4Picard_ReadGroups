for f in *.bam; \
do input=${f%_.bam}; \
java -jar /global/home/users/victorcg/software/picard.jar AddOrReplaceReadGroups \
    I=${input}.bam \
    O=${input}_RG.bam \
    SORT_ORDER=coordinate \
    RGID=foo \
    RGLB=bar \
    RGPL=illumina \
    RGPU= unit1 \
    RGSM=${input}_bam \
    CREATE_INDEX=True; \
    done
