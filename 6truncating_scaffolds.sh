 cat 1_1_S9_ID.vcf| grep -v "^#" | cut -f1 | uniq > scaf-order.txt

 #separated the first 14 scaffolds since they're the largest, the rest are unmapped regions so they are smaller
#first 14 scaffolds need more separation since genotyping step timed out 
sed -n '1,3p' scaf-num.list> 1.1-3scaf-num.list
sed -n '4,5p' scaf-num.list> 1.4-5scaf-num.list
sed -n '6,7p' scaf-num.list> 1.6-7scaf-num.list
echo scaffold_8 > 1.8scaf-num.list (done)
sed -n '9,10p' scaf-num.list> 1.9-10scaf-num.list
echo scaffold_11 > 1.11scaf-num.list
echo scaffold_12 > 1.12scaf-num.list
echo scaffold_13 > 1.13scaf-num.list
echo scaffold_14 > 1.14scaf-num.list
