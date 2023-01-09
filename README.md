# Genomic Analysis pipelines with Snakemake
### Noah Burget
### Last update: 1/9/23

## RNA-seq
# Single-end alignment
```
1. trim_galore 
    --fastqc
    -q 15
    --phred33
    --gzip
    --stringency 5
    -e 0.1
    --length 20
    --illumina
    input = single-end fastq.gz
2. STAR alignment
    --outFilterType BySJout
    --readFilesCommand zcat
    --outSAMattributes Standard
    --outFilterIntronMotifs RemoveNoncanonicalUnannotated
    --alignIntronMax 100000
    --outSAMstrandField intronMotif
    --outSAMunmapped Within
    --chimSegmentMin 25 
    --chimJunctionOverhangMin 25 
    --outStd SAM
    input = trimmed fastq.gz
3. Remove scaffolds
    samtools view -h -L <chromScaffolds>
    input = unfiltered BAM
4. Picard MarkDuplicates (remove PCR duplicates)
    REMOVE_DUPLICATES=false
    VALIDATION_STRINGENCY=SILENT
    samtools view b -F 1540 (filter out marked PCR duplocates)
    input = BAM, no scaffolds
5. featureCounts
    -t exon
    -g gene_id
    -s 1
    -O 
    -a <.gtf>
    input = BAM, no PCR dups, no scaffolds
6. Make bigWig
    Compute scaling factor:
      T = samtools view -c <BAM>
      FACTOR = 1000000 / T
    bamToBed --> bed12ToBed6 --> genomeCoverageBed
    bedGraphToBigWig
```



    
    
