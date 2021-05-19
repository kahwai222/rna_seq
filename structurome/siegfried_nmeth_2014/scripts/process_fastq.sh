#
# This script processes raw fastq files to input format acceptable for shapemapper.
#

# Stop on any error and print all commands.
set -uex

# Create fastq directories if they do not already exist.
mkdir -p data/HIV_denat
mkdir -p data/HIV_plus
mkdir -p data/HIV_minus

# 3rd line for each fastq read must be a single '+' --> requirements of shapemapper.
# Process each fastq file and redirect output to data directory.
cat names.txt | parallel "cat reads/{}.fastq | sed 's/^+SRR\(.*\)/+/' > data/{}.fastq"

# Move each fastq file to respective subdirectories.
mv data/HIV_denat_R*.fastq data/HIV_denat
mv data/HIV_plus_R*.fastq data/HIV_plus
mv data/HIV_minus_R*.fastq data/HIV_minus
