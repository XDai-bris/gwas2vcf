wkdir="/user/home/xd14188/repo/gwas2vcf"

SumStatsFile="${wkdir}/test/gwas_b37/All_ancestries_SNP_gwas_mc_merge_nogc.tbl.uniq.gz.tab.gz"
RefGenomeFile="${wkdir}/test/ref/human_g1k_v37.fasta"
ParamFile="${wkdir}/test/test_withDBsnp/test_param.json"
VcfFileOutPath="${wkdir}/test/test_withDBsnp/test.vcf.gz"
DbsnpFile="${wkdir}/test/ref/dbsnp.v153.b37.vcf.gz"
AlisaFile="${wkdir}/test/ref/alias-b37.txt"
ID="test_withDBsnp"

python3 "${wkdir}/igd-hpc-pipeline/resources/gwas2vcf/main.py" \
  --json "${ParamFile}" \
  --data "${SumStatsFile}" \
  --id "${ID}" \
  --ref "${RefGenomeFile}" \
  --dbsnp "${DbsnpFile}" \
  --alias "${AlisaFile}" \
  --out "${VcfFileOutPath}"

 

