#
# This script downloads all the fastq files.
#

# Stop on any error and print all commands.
set -uex

# Fetch sequencing reads from SRA.
cat ids.txt | parallel "fastq-dump --split-files {}"

# Create reads directory if it does not already exist.
mkdir -p raw/sra

# Move fastq files to respective directories and rename accordingly.
parallel --link "mv {1}_1.fastq raw/sra/{2}_R1.fastq" :::: ids.txt :::: names.txt
parallel --link "mv {1}_2.fastq raw/sra/{2}_R2.fastq" :::: ids.txt :::: names.txt
