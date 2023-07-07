# Genomic Analysis pipelines with Snakemake
### Noah Burget
### Last update: 4/26/23

## Input
Fastq files should be placed within the `00.fastq` directory, in the same directory as the `Snakefile`. \
All fastq files should be gzipped - i.e. have the extension `.fastq.gz` or `.fq.gz`, etc. This can be done by running `gzip <fastq>`.

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

