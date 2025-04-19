#!/bin/bash


if [ $# -ne 1 ]; then
    echo " Usage: $0 <filename>"
    exit 1
fi

filename="$1"


if [ -f "$filename" ] && [ -r "$filename" ]; then
    echo "Contents of '$filename':"
    cat "$filename"
else
    echo  "File '$filename' does not exist or is not readable."
    exit 2
fi
