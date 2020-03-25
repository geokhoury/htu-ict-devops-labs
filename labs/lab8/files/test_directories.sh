#!/bin/bash

# Define file path
directory_name="./sample_input/"
# directory_name="./sample_does_not_exist/"

# Check if directory exists
if [ -d "$directory_name" ]; then
    # Echo that directory exists
    echo "$directory_name found. The directory exists."
else
    echo "$directory_name not found. The directory does not exist."
fi