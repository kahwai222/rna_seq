#
# This script downloads the fastq files to the reads folder.
#

# Stop on any error and print all commands.
set -uex

# Fetch sequencing reads from SRA.
cat ids.txt | parallel "fastq-dump --split-files {}"

# Create reads directory if it does not already exist.
mkdir -p reads

# Move fastq files to reads directory and rename accordingly.
mv SRR1301979_1.fastq reads/Denatured_R1.fastq
mv SRR1301979_2.fastq reads/Denatured_R2.fastq
mv SRR1301974_1.fastq reads/1M7_R1.fastq
mv SRR1301974_2.fastq reads/1M7_R2.fastq
mv SRR1301978_1.fastq reads/Untreated_R1.fastq
mv SRR1301978_2.fastq reads/Untreated_R2.fastq
