# check strand info from fastq

https://github.com/signalbash/how_are_we_stranded_here

Note: 

To run how_are_we_stranded_here, you need to use kallisto == 0.44.0 version.
Generating pseudo BAM file is default for this version. For the latest version,
generating pseudo BAM file is turned off. So you need to turn it on when you compile
the kallisto if you want to use newer version than 0.44.0.

Also, check_strandedness.py in how_are_we_stranded_here has bugs and could not process
the strandedness_check.txt file.
```


This is PairEnd Data
Fraction of reads failed to determine: 0.1498
Fraction of reads explained by "1++,1--,2+-,2-+": 0.0104
Fraction of reads explained by "1+-,1-+,2++,2--": 0.8397
```

For those reasons, I made a clean version here.

