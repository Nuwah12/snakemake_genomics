# Genomic Analysis pipelines with Snakemake
### Noah Burget
### Last update: 4/26/23

## RNA-seq
### Dependencies:
* Snakemake, Java, Python
* STAR (https://github.com/alexdobin/STAR)
* Trim Galore (https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
* Samtools (http://www.htslib.org/download/)
* Picard (https://broadinstitute.github.io/picard/)
* Subread (https://subread.sourceforge.net/)

#### How to use:
0. Determine whether your library is single-end or paired-end. Use the appropriate Snakemake file.

1. Edit parameters in config.yaml: 
    * `samples`: Path to samplesheet
    * `fastq_dir`: Path to directory containing all .fastq files to be aligned.
    * `ChromNoPatch`: Path to file containing chromosome sizes in a bed-style format (e.g. chr1 1 249250621), with every dequence/chromosome you want to map to
    * `gtf`: Path to .gtf file for annotation being used
    * `chromSizes`: Path to chromosome sizes file
    * `starIndex`: Path to STAR index directory
    * `picard_path`: Path to directory of picard jar file
  
2. Setup sample sheet (samplesheet.csv)
    * In samplesheet.csv, list all file names
    * **!!!NOTE!!!** for SINGLE-END RNA-seq, exclude the extension .fast1(.gz), for PAIRED-END, exclude the extension _R1/_R2.fastq(.gz) 

3. Run with command `snakemake -c<number of threads>`



