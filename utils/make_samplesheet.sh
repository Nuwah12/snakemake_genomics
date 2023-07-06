#!/bin/bash
if [[ ! -f "samplesheet.csv" ]]; then
	touch samplesheet.csv
fi
echo "samples" >> samplesheet.csv
for i in $(ls "./00.fastq/"); do
	i="${i##*/}"
	i="${i%%.*}"
	echo $i >> samplesheet.csv
done
