#!/bin/bash

list=(1 2 3 4 5)

# # -- number of elements
# * -- all elements concatinated as a string
# @ -- all elements*
# ! -- list of indeces

printf "%s\t%s\n" "Index" "Element"

for i in "${!list[@]}"; do 
    printf "%s\t%s\n" "$i" "${list[$i]}"
done