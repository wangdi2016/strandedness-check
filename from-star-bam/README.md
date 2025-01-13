# check bam files

Use two house keeping genes:  GAPDH and ACTB

== GRCh38 ==

GAPDH is on the forward strand, chr12:6534517-6538371

ACTB is on the reverse strand, chr7:5527152-5563902

Both indicate the data is strand-specific forward.

## Note:

1. CGR uses IDT xgen adapters which flipps the read1 and read2, although it uses dUTP for the second strand.

https://littlebitofdata.com/en/2017/08/strandness_in_rnaseq/

https://www.idtdna.com/pages/support/faqs/can-the-xgen-unique-dual-index-umi-adapters-be-used-for-rna-seq

2. Can use RSeQC's infer_experiment.py to check which direction reads from the first and second pairs are 
aligned in relation to the transcript strand, and provides output with the likely strandedness of your data.
