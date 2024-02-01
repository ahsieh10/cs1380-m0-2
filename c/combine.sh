#!/bin/bash
#
# Combine terms to create  n-grams (for n=1,2,3) and then count and sort them

vocab=()

while read -r word; do
    vocab+=("$word")
done

length=${#vocab[@]}

for ((j=0; j<length; j++));
do
    echo "${vocab[j]}"
done

for ((j=0; j<length-1; j++));
do
    #printf "${vocab[j]}\t""${vocab[j+1]}\n"
    first=${vocab[j]}
    second=${vocab[j+1]}
    printf '%s\t%s\n' "$first" "$second"
done

for ((j=0; j<length-2; j++));
do
    first=${vocab[j]}
    second=${vocab[j+1]}
    third=${vocab[j+2]}
    printf '%s\t%s\t%s\n' "$first" "$second" "$third"
done