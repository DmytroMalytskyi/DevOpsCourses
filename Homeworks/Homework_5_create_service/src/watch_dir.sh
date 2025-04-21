#!/bin/bash

WATCH_DIR="$HOME/watch"


mkdir -p "$WATCH_DIR"

inotifywait -m -e create --format "%f" "$WATCH_DIR" | while read filename; do
    filepath="$WATCH_DIR/$filename"

    sleep 1
    echo "New file detected: $filename"
    echo "----- File content -----"
    cat "$filepath"
    echo "------------------------"

    mv "$filepath" "$filepath.back"
    echo "Renamed '$filename' to '$filename.back'"
done
