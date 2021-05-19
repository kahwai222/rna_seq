#
# This script downloads all the fastq files.
#

# Stop on any error and print all commands.
set -uex

# Fetch sequencing reads from SRA.
cat ids.txt | parallel "fastq-dump --split-files {}"

# Create reads directory if it does not already exist.
mkdir -p reads

# Move fastq files to respective directories and rename accordingly.
mv SRR1301979_1.fastq reads/HIV_denat_R1.fastq
mv SRR1301979_2.fastq reads/HIV_denat_R2.fastq
mv SRR1301974_1.fastq reads/HIV_plus_R1.fastq
mv SRR1301974_2.fastq reads/HIV_plus_R2.fastq
mv SRR1301978_1.fastq reads/HIV_minus_R1.fastq
mv SRR1301978_2.fastq reads/HIV_minus_R2.fastq
