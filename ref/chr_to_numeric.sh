bcftools annotate --rename-chrs chr_to_numeric.map \
  -Oz -o ./dbsnp.v153.hg38.numeric.vcf.gz  ./dbsnp.v153.hg38.vcf.gz

tabix -p vcf ./dbsnp.v153.hg38.numeric.vcf.gz

bcftools index -s ../ref/dbsnp.v153.hg38.numeric.vcf.gz | head

