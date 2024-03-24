#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

input_file=$1
output_file=$2


awk '{
    gsub(/[^ATGCatgc]/, "");       
    if (length($0) >= 196) {    
        print substr($0, 1, 196);  
    }
}' "$input_file" > "$output_file"



