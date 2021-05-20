#
# This script processes raw fasta/fastq files to input format acceptable for shapemapper.
#

# Stop on any error and print all commands.
set -uex

# Create data and fastq directories if they do not already exist.
parallel "mkdir -p data/{}" ::: HIV_denat HIV_plus HIV_minus

# Shorten title of reference sequence and move it to data directory.
cat raw/refs/HIV.fa | sed 's/^>\(.*\)/>HIV/' > data/HIV.fa

# 3rd line for each fastq read must be a single '+' --> requirements of shapemapper.
# Process fastq files and redirect output to respective directories.
parallel "cat raw/sra/{1}_R{2}.fastq | sed 's/^+SRR\(.*\)/+/' > data/{1}/{1}_R{2}.fastq" :::: names.txt ::: 1 2
