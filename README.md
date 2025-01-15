# strandedness-check

Use aligned bam or star-count table to check the strandedness of the RNASeq data.

Use https://github.com/signalbash/how_are_we_stranded_here to check RNASeq fastq data

## Note:

1. CGR uses IDT xgen adapters which flipps the read1 and read2, although it uses dUTP for the second strand.

https://www.idtdna.com/pages/support/faqs/can-the-xgen-unique-dual-index-umi-adapters-be-used-for-rna-seq

2. Can use RSeQC's infer_experiment.py to check which direction reads from the first and second pairs are
aligned in relation to the transcript strand, and provides output with the likely strandedness of your data.

3. Explaination of the strandedness

https://eclipsebio.com/eblogs/stranded-libraries/

https://littlebitofdata.com/en/2017/08/strandness_in_rnaseq/
<img width="1193" alt="Screenshot 2025-01-14 at 8 41 00 PM" src="https://github.com/user-attachments/assets/6b24ba45-4a30-4d19-bab4-1f5aa230a51b" />

