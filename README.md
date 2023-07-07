# Genomic Analysis pipelines with Snakemake
## Input
Fastq files should be placed within the `00.fastq` directory (make one if it does not exist), in the same directory as the `Snakefile`. \
All fastq files should be gzipped - i.e. have the extension `.fastq.gz`. This can be done by running `gzip <fastq>`.

## Sample sheet
One all fastq files have been transferred to the `00.fastq` , the `utils/make_samplesheet.sh` utility script will generate the sample sheet. \
If running a paired-end pipeline (*including ChIP-seq and ATAC-seq*), pass `-p` to the script. \
```
mv /path/to/fastq/*.fastq.gz 00.fastq
./make_samplesheet.sh <-p>
```

## Config parameters
### All config parameters are located in `config.yml` - each pipeline has its own copy, and may have different parameters, so make sure you are using the correct file! 
   * `samples`: Path to samplesheet
   * `fastq_dir`: Path to directory containing all .fastq files to be aligned.
   *  `ChromNoPatch`: Path to file containing chromosome sizes in a bed-style format (e.g. chr1 1 249250621), with every dequence/chromosome you want to map to
   * `gtf`: Path to .gtf file for annotation being used
   * `chromSizes`: Path to chromosome sizes file
   * `starIndex`: Path to STAR index directory *(RNA-seq only!)*
   * `bwaIndex`: Path to BWA index directory *(ATAC/ChIP-seq only!)*
   * `picard_path`: Path to directory of picard jar file

## Dependencies
'x' indicates that the pipeline depends on this software
| Software | RNA-seq Alignment| ChIP-seq Alignment | ATAC-seq Alignment | Peak calling (ChIP/ATAC)
|----------|--------- |----------|---------|----------|
|    STAR  |    x    |          |          |           |
|    BWA   |         |      x   |     x    |
| Samtools |    x    |  x       |      x   |
|  Picard  |  x      | x        |      x   |
|  Subread |   x     |  x       |   x      |
| Pandas   |   x     |  x       |   x      |
| MACS2    |         |          |          |x
| Bedtools | x       |  x       |   x      |  x
| HOMER    |         |          |          | x  

