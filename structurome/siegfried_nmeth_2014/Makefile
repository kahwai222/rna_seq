usage:
	@echo "Usage: make ref, sra, fastq, shape"

ref:
	sh scripts/get_ref.sh

sra:
	sh scripts/get_sra.sh

fastq:
	sh scripts/process_fastq.sh

shape:
	shapemapper --name "HIV" --target data/HIV.fa --overwrite --nproc 8 --modified --folder data/HIV_plus --untreated --folder data/HIV_minus --denatured --folder data/HIV_denat
