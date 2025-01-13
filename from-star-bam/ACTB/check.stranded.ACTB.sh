
# For strand-specific data, the first (sense read 1) and fourth
# (antisense read 2) commands will yield few alignments, while
# the second (antisense read 1) and third (sense read 2) will yield
# many alignments.
BAM="./bams/SC944861-GCCTATCA-AATGGTCG_Aligned.sortedByCoord.out.bam"

### count sense read 1 alignments, antisense read 1 alignments,
### sense read 2 alignments, and antisense read 2 alignments to
### GAPDH
#region="chr12:6534517-6538371"

## ACTB
#ACTB (chr7:5527152-5563902 in hg38) is also a good
#choice, but it is on the Crick (-) strand
region="chr7:5527152-5563902"

## sense read 1
## The command counts read 1 alignments that are on the forward strand within the specified genomic region (chr12:6534517-6538371).
## samtools view: The command to view or filter alignments in a BAM/SAM file.
## -c: Outputs only the count of alignments instead of the alignments themselves.
## -f 64: Includes only alignments with the read 1 flag set (first read in a pair).
## -F 16: Excludes alignments with the reverse strand flag set.
echo "== sense read 1" > check.stranded.log
samtools view -c -f 64 -F 16 ${BAM} ${region} >> check.stranded.log

## antisense read 1
## This command counts the number of read 1 alignments that are on the reverse strand within the region chr12:6534517-6538371.
## samtools view: View or filter alignments in a BAM/SAM file.
## -c: Outputs only the count of alignments.
## -f 80: Includes alignments with the following flags:
## 64: Read 1 in a pair (first read).
## 16: Read aligned to the reverse strand.
## The -f option adds up the specified flags, meaning both conditions (64 and 16) must be met for an alignment to be included.
echo "== antisense read 1" >> check.stranded.log
samtools view -c -f 80 ${BAM} ${region} >> check.stranded.log

## sense read 2
## This command counts the number of read 2 alignments (second read in a pair) that are on the forward strand within the region chr12:6534517-6538371.
## samtools view: Command to filter and view alignments in a BAM/SAM file.
## -c: Outputs only the count of alignments that meet the specified criteria.
## -f 128: Includes alignments with the following flag:
## 128: Read 2 in a pair (second read).
## -F 16: Excludes alignments with the following flag:
## 16: Read aligned to the reverse strand.
echo "== sense read 2" >> check.stranded.log
samtools view -c -f 128 -F 16 ${BAM} ${region} >> check.stranded.log

## antisense read 2
## This command counts the number of read 2 alignments (second read in a pair) that are aligned to the reverse strand within the region chr12:6534517-6538371.
## samtools view: Command to view or filter alignments in a BAM/SAM file.
## -c: Outputs only the count of alignments.
## -f 144: Includes alignments with the following flags:
## 128: Read 2 in a pair (second read).
## 16: Read aligned to the reverse strand.
## The -f option means both flags must be present in the alignments.
echo "== antisense read 2" >> check.stranded.log
samtools view -c -f 144 ${BAM} ${region} >> check.stranded.log
