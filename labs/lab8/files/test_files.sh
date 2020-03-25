#!/bin/bash

# Define file path
# filename="./sample_input/input_file.md"
filename="./sample_input/input_file_does_not_exist.md"

# Check if file exists
if [ -e "$filename" ]; then
    # Echo that file exists
    echo "$filename found. The file exists."
else
    echo "$filename not found. The file does not exist."
fi