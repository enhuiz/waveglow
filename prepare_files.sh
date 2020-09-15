#!/bin/bash

dir=$1

if [ -z $dir ]; then
    echo please give a directory.
    exit
fi

if [ ! -d $dir ]; then
    echo "$dir" seems not a directory, please check it again.
    exit
fi

find $dir -name "*.wav" -not -name "._*" \
    | shuf --random-source=<(printf "0%.0s" {1..30000}) > files.txt

cat files.txt | head -n 100 > test_files.txt
cat files.txt| tail -n +101 > train_files.txt

rm files.txt
