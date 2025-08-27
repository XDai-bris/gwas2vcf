#!/bin/bash

#SBATCH --job-name=run_pipeline
#SBATCH --partition=mrcieu,cpu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --time=12:0:0
#SBATCH --mem=10G
#SBATCH --account=smed001801

# Load required modules
eval "$(/user/work/xd14188/miniforge3/bin/conda shell.bash hook)"

mamba activate /user/work/xd14188/miniforge3/envs/gwas2vcf-py37

which python3

sh scr.sh

