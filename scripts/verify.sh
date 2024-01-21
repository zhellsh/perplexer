#!/bin/bash

# Specify the directory where your files are located
directory="."

# Find all .info.json files in the specified directory
info_files=$(find "$directory" -type f -name "*.info.json")

# Loop through each .info.json file
IFS=$'\n' # Set Internal Field Separator to newline to handle filenames with spaces
for info_file in $info_files; do
    # Extract the base name without extension
    base_name=$(basename "$info_file" .info.json)
    
    # Check if the corresponding .mp3 file exists
    mp3_file="$directory/$base_name.mp3"
    if [ ! -e "$mp3_file" ]; then
        echo "$base_name"
    fi
done
