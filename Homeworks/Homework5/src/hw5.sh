#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_file> <destination_path>"
    exit 1
fi

source_file="$1"
destination_path="$2"

if [ ! -f "$source_file" ]; then
    echo "Error: Source file '$source_file' does not exist."
    exit 2
fi

if [ ! -f "$destination_path" ]; then
    echo "Error: Source file '$destination_path' does not exist."
    exit 3
fi
cp "$source_file" "$destination_path"

if [ $? -eq 0 ]; then
    echo "File successfully copied to '$destination_path'"
else
    echo "Error: Failed to copy file."
    exit 4
fi
