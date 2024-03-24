#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

input_file=$1
output_file=$2


awk '{
    gsub(/[^ATGCatgc]/, "");        # Remove non-ATGC characters
    if (length($0) >= 196) {    # If length is 196 or more
        print substr($0, 1, 196);  # Print only first 196 characters
    }
}' "$input_file" > "$output_file"

echo "Processed sequences saved to $output_file"

