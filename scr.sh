SumStatsFile=/user/home/xd14188/repo/gwas2vcf/test/gwas_b37/All_ancestries_SNP_gwas_mc_merge_nogc.tbl.uniq.gz.tab.gz
RefGenomeFile=/user/home/xd14188/repo/gwas2vcf/test/ref/human_g1k_v37.fasta
ParamFile=/user/home/xd14188/repo/gwas2vcf/test/test_param.json
VcfFileOutPath=/user/home/xd14188/repo/gwas2vcf/test/test.vcf.gz
ID="test"

python3 /user/home/xd14188/repo/gwas2vcf/igd-hpc-pipeline/resources/gwas2vcf/main.py \
    --json ${ParamFile} \
    --data ${SumStatsFile} \
    --id ${ID} \
    --ref ${RefGenomeFile} \
    --out ${VcfFileOutPath} 