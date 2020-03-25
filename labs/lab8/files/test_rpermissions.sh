#!/bin/bash

# Define file path
filename="./sample_input/my_input_file.md"
# filename="./sample_input/dne.md"

# Check if file does not exist
if [ ! -f "$filename" ]; then
    # If not, create it
    touch "$filename"
    "File '$filename' not found. Creating."
fi

# Check if the executing user has read permission
if [ -r "$filename" ]; then
    echo "Your user '$USER' is allowed to read $filename."
else
    echo "Your user '$USER' is not allowed to read $filename."
fi

# Remove created file
# rm $filename