wkdir="/user/home/xd14188/repo/gwas2vcf"

SumStatsFile="${wkdir}/test/gwas_b38/29892013-GCST90029007-EFO_0004340.h.tsv.gz"
RefGenomeFile="${wkdir}/test/ref/hg38.fa"
ParamFile="${wkdir}/test/test_v38_withDBsnp/test_param.json"
VcfFileOutPath="${wkdir}/test/test_v38_withDBsnp/test.vcf.gz"
DbsnpFile="${wkdir}/test/ref/dbsnp.v153.hg38.numeric.vcf.gz"
ID="test_v38_withDBsnp"


/user/work/xd14188/miniforge3/envs/gwas2vcf-py37/bin/python3 "${wkdir}/igd-hpc-pipeline/resources/gwas2vcf/main.py" \
  --json "${ParamFile}" \
  --data "${SumStatsFile}" \
  --id "${ID}" \
  --ref "${RefGenomeFile}" \
  --dbsnp "${DbsnpFile}" \
  --out "${VcfFileOutPath}" 
  # --log DEBUG 2>&1 | tee run.log
