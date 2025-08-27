#!/bin/bash
# SLURM launcher for multithreaded population merges (5 pops × 8 CPUs each)

#SBATCH --job-name=download_dbsnp
#SBATCH --partition=veryshort        # use 'cpu' if your merge might exceed 6h
#SBATCH --ntasks=1                   # one task per population
#SBATCH --cpus-per-task=2           # plink2 --threads 8
#SBATCH --mem-per-cpu=4G             # 8 CPUs → 32G per task
#SBATCH --time=06:00:00
#SBATCH --account=smed001801

wget http://fileserve.mrcieu.ac.uk/dbsnp/dbsnp.v153.b37.vcf.gz
wget http://fileserve.mrcieu.ac.uk/dbsnp/dbsnp.v153.b37.vcf.gz.tbi
wget http://fileserve.mrcieu.ac.uk/dbsnp/dbsnp.v153.hg38.vcf.gz
wget http://fileserve.mrcieu.ac.uk/dbsnp/dbsnp.v153.hg38.vcf.gz.tbi

