# GWAS Liftover Benchmark with and without dbSNP

This repository documents tests of GWAS summary statistics alignment against human reference genomes (**hg19/GRCh37** and **hg38/GRCh38**) with and without **dbSNP annotation**.  
The purpose is to measure runtime differences and outline preprocessing steps required for chromosome format consistency.

---

## Input Files

### hg19 / GRCh37
- **GWAS file**: `gwas_b37/All_ancestries_SNP_gwas_mc_merge_nogc.tbl.uniq.gz.tab.gz`  
- **Reference genome**: `ref/human_g1k_v37.fasta`  
- **dbSNP file**: `ref/dbsnp.v153.b37.vcf.gz`  
- **Alias file (required when dbSNP involved)**: `ref/alias-b37.txt`  

### hg38 / GRCh38
- **GWAS file**: `gwas_b38/29892013-GCST90029007-EFO_0004340.h.tsv.gz`  
- **Reference genome**: `ref/hg38.fa`  
- **dbSNP file**: `ref/dbsnp.v153.hg38.numeric.vcf.gz`  
- **Alias file**: *not required* (dbSNP already renamed to numeric chromosomes)

---

## Runtime Benchmark

| Genome build | dbSNP used | Runtime |
|--------------|------------|---------|
| hg19 / GRCh37 | ❌ No  | 12 min 36 sec |
| hg19 / GRCh37 | ✅ Yes | 49 min 54 sec |
| hg38 / GRCh38 | ❌ No  | 33 min 51 sec |
| hg38 / GRCh38 | ✅ Yes | (pending) |

---

## Chromosome Format Consistency

It is crucial that chromosome naming conventions (**`1` vs `chr1`**) are consistent across:
- GWAS summary statistics
- Reference FASTA (`.fa` / `.fai`)
- dbSNP VCF file

### Check chromosome names:
```bash
# From reference genome index
cut -f1 "${RefGenomeFile}.fai" | head

# From dbSNP VCF header
bcftools view -h ref/dbsnp.v153.hg38.vcf.gz | grep -o '##contig=<ID=[^,]*' | head
```

---

## Resolving Format Mismatches

If `.fai` and dbSNP files use different chromosome formats, preprocessing is required.  

Example: converting **dbSNP hg38** from `chr1` to `1`:

```bash
# Rename chromosomes using a mapping file
bcftools annotate --rename-chrs chr_to_numeric.map \
  -Oz -o ./dbsnp.v153.hg38.numeric.vcf.gz ./dbsnp.v153.hg38.vcf.gz

# Index the updated VCF
tabix -p vcf ./dbsnp.v153.hg38.numeric.vcf.gz
bcftools index -s ./ref/dbsnp.v153.hg38.numeric.vcf.gz | head
```

The `--alias {alias_file}` option can only be used to remap chromosome names in GWAS summary statistics.

---

## Notes
- Using dbSNP significantly increases runtime due to variant annotation overhead.  
- For hg38, preprocessing dbSNP to numeric chromosomes avoids the need for an alias file.  

---


