#!/bin/bash


if [ $# -ne 1 ]; then
    echo "❗ Usage: $0 <filename>"
    exit 1
fi

filename="$1"


if [ ! -f "$filename" ]; then
    echo "❌ Error: File '$filename' does not exist."
    exit 2
fi


line_count=$(wc -l < "$filename")


echo " Number of lines in '$filename': $line_count"
