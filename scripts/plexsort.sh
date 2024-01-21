#!/bin/bash

source_folder="."
destination_folder="$1"

# Check if the source folder exists
if [ ! -d "$source_folder" ]; then
    echo "Source folder not found: $source_folder"
    exit 1
fi

# Create destination folder if not exists
[ -d "$destination_folder" ] || mkdir -p "$destination_folder"

# Loop through MP3 files and organize them
for mp3_file in "$source_folder"/*.mp3; do
    if [ -f "$mp3_file" ]; then
        artist=$(exiftool -s -s -s -artist "$mp3_file")
        album=$(exiftool -s -s -s -album "$mp3_file")
        title=$(exiftool -s -s -s -title "$mp3_file")
        track=$(exiftool -s -s -s -track "$mp3_file")

        # Default values if tags are not present
        artist=${artist:-"Unknown Artist"}
        album=${album:-"Unknown Album"}
        title=${title:-"Unknown Track"}

        # Ensure track is a valid numeric value
        if ! [[ "$track" =~ ^[0-9]+$ ]]; then
            track="00"
        fi

        # Create Artist folder if not exists
        artist_folder="$destination_folder/$artist"
        [ -d "$artist_folder" ] || mkdir -p "$artist_folder"

        # Create Album folder inside Artist folder
        album_folder="$artist_folder/$album"
        [ -d "$album_folder" ] || mkdir -p "$album_folder"

        # Copy MP3 file to Album folder with a new name
        new_filename="$(printf "$title.mp3")"
        cp "$mp3_file" "$album_folder/$new_filename"
    fi
done

echo "Folders created successfully."

