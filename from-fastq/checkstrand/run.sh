#!/usr/bin/bash

GTF="/fdb/GENCODE/Gencode_human/release_35/gencode.v35.annotation.gtf"
fasta="/fdb/GENCODE/Gencode_human/release_35/gencode.v35.transcripts.fa"

check_strandedness --gtf $GTF --transcripts $fasta \
                   --nreads 1000000 \
                   --reads_1 /data/HKBC/RNASeq/2018/raw/HKB0752_3001_1.fastq.gz \
                   --reads_2 /data/HKBC/RNASeq/2018/raw/HKB0752_3001_2.fastq.gz

