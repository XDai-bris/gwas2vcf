wkdir="/user/home/xd14188/repo/gwas2vcf"

SumStatsFile="${wkdir}/test/gwas_b38/29892013-GCST90029007-EFO_0004340.h.tsv.gz"
RefGenomeFile="${wkdir}/test/ref/hg38.fa"
ParamFile="${wkdir}/test/test_v38_noDBsnp/test_param.json"
VcfFileOutPath="${wkdir}/test/test_v38_noDBsnp/test.vcf.gz"
ID="test_v38_noDBsnp"

python3 "${wkdir}/igd-hpc-pipeline/resources/gwas2vcf/main.py" \
  --json "${ParamFile}" \
  --data "${SumStatsFile}" \
  --id "${ID}" \
  --ref "${RefGenomeFile}" \
  --out "${VcfFileOutPath}" 
  # --log DEBUG 2>&1 | tee run.log