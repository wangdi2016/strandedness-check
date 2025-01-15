# Installation 

## 1. create conda env

conda create -n checkstrand python=3

## 2. activate conda env

conda activate checkstrand

## 3. download kallisto 0.44.0 version

wget https://github.com/pachterlab/kallisto/releases/download/v0.44.0/kallisto_linux-v0.44.0.tar.gz

## 4. untar kallisto 0.44.0

tar xvf kallisto_linux-v0.44.0.tar.gz

## 5. copy kallisto to your check-strand env bin folder

cp kallisto_linux-v0.44.0/kallisto /data/wangdi/bin/anaconda3/envs/checkstrand/bin

## 6. install how_are_we_stranded_here

pip install how_are_we_stranded_here 

## 7. copy updated version of check_strandedness.py to replace the original "check_strandedness.py"

cp check_strandedness.py /data/wangdi/bin/anaconda3/envs/checkstrand/lib/python3.13/site-packages/how_are_we_stranded_here/check_strandedness.py

## 8. run check strand

nohup ./run.sh > run.log

