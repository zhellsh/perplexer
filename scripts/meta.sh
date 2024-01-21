#!/bin/bash

# Check if jq and ffmpeg are installed
command -v jq >/dev/null 2>&1 || { echo >&2 "jq is required but not installed. Aborting."; exit 1; }
command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "ffmpeg is required but not installed. Aborting."; exit 1; }

shopt -s nullglob  # To handle cases where no matching files are found

for i in *.info.json; do
    name=$(basename -s .info.json "$i")

    # Extract metadata using jq
    title=$(jq -r '.title' "$i")
    artist=$(jq -r '.artist' "$i")
    album=$(jq -r '.album' "$i")
    genre=$(jq -r '.genre' "$i")
    track=$(jq -r '.track' "$i")

    # Extract creation time from the MP3 file
    date_created=$(date -r "$name.mp3" -u +"%Y-%m-%dT%H:%M:%SZ")

    # Update metadata using ffmpeg
    ffmpeg -i "$name.mp3" -c copy -metadata title="$title" -metadata artist="$artist" -metadata album="$album" -metadata genre="$genre" -metadata track="$track" -metadata creation_time="$date_created" "$name.meta.mp3"

    # Optionally, remove the backup file if everything is successful
    rm "$name.mp3"

    # Remove temporary files
    rm "$i"

    # Rename the updated MP3 file
    mv "$name.meta.mp3" "$name.mp3"
done

echo "Metadata insertion complete."
