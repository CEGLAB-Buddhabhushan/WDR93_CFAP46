#!/bin/bash

# Specify the file path
file=$1

# Read the header row of the file
header=$(head -n 1 "$file")

# Split the header into an array of column names
IFS=' ' read -ra columns <<< "$header"

# Loop through each column
for ((i=0; i<${#columns[@]}; i++)); do
    # Extract the values for the current column
    values=$(awk -v col=$((i+1)) '{print $col}' "$file")

    # Check if any value is greater than 0.5
    if echo "$values" | awk '$1 > 0.5' | grep -q '[0-9]'; then
        echo "${columns[i]}"
    fi
done
