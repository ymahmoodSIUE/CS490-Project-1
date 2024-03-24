#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file=$1
output_file=$2


chr_count=$(grep -o "chr" "$input_file" | wc -l)

echo "Total occurrences of 'chr': $chr_count"
