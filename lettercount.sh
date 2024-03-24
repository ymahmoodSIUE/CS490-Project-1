#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file=$1
output_file=$2


total_ATGCatgc=0


while IFS= read -r -n1 char; do
    case $char in
        [ATGCatgc]) ((total_ATGCatgc++));;
    esac
done < "$input_file"

echo "Total ATGCatgc letters: $total_ATGCatgc"
