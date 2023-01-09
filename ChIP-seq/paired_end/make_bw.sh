#!/bin/bash
#Activate py3 conda environment
source /mnt/data0/apps/anaconda/anaconda2/bin/activate py3
module load ucsc369

#Arguments
bam=$1
chromsize=$2
bg_out=$3
bw_out=$4

echo "Counting reads . . ."
T=$(samtools view -c ${bam})
echo "$T reads."
echo "Calculating scale factor . . ."
FACTOR=`echo "scale=10; 1000000 / ${T}" | bc -l`
echo "Scaling factor = $FACTOR"
echo "Making bedGraph . . ."
bamToBed -i ${bam} -bed12 | bed12ToBed6 -i stdin | genomeCoverageBed -bg -i - -g ${chromsize} -scale ${FACTOR} | sort -k1,1 -k2,2n > ${bg_out}
echo "Making bigWig . . ."
bedGraphToBigWig ${bg_out} ${chromsize} ${bw_out}
echo "$(date): Done!"

