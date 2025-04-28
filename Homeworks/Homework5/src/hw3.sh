#!/bin/bash
echo "Input filename:"
read filename
if [ -f  "$filename"  ]; then
    echo  "The file exists"
else
    echo "The file does not exist"
fi
