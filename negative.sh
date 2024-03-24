#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 input_bed_file output_bed_file"
    exit 1
fi

positive_file=$1
output_file=$2


awk 'BEGIN { OFS="\t" }
     NR==1 { prev_chr=$1; prev_end=$3 }
     NR>1 && $1!=prev_chr { if (prev_end < $2) print prev_chr, prev_end+1, $2-1; prev_chr=$1; prev_end=$3 }
     NR>1 && $1==prev_chr { if (prev_end < $2) print prev_chr, prev_end+1, $2-1; prev_end=$3 }
     END { if (NR>0 && prev_end < $2) print prev_chr, prev_end+1, $2-1 }' "$positive_file" | awk '$2 <= $3' | sed 's/ /\t/g' > "$output_file"


