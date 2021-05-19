#
# This script downloads the reference HIV-1 (strain NL4-3) genome to the refs folder.
#

# Stop on any error and print all commands.
set -uex

# Create refs directory if it does not already exist.
mkdir -p data

# Fetch fasta file of HIV-1 genome.
efetch -db nucleotide -id M19921.2 -format fasta -seq_start 455 -seq_stop 9627 > data/HIV.fa
