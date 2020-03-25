#!/bin/bash

# Declare and initialize and array of numbers
list=(1 2 3 4 5)

# For loops you can use the following
#   # -- number of elements
#   * -- all elements concatinated as a string
#   @ -- all elements*
#   ! -- list of indeces

# Print header with formatted string
printf "%s\t%s\n" "Index" "Element"

# Loop over array of indeces and items to print all values
for i in "${!list[@]}"; do 
    printf "%s\t%s\n" "$i" "${list[$i]}"
done