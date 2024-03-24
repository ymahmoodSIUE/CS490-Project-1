#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file=$1
output_file=$2


awk '/^>/ { if (seq) { print length(seq), seq; } seq=""; print; next } { seq = seq $0 } END { if (seq) print length(seq), seq; }' "$input_file" > "$output_file"


