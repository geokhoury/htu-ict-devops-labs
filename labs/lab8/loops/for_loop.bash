#!/bin/bash

## Basic Construct

# for arg in [list];
# do
#  command(s)...
# done

# Loop on ar array
BASKET=(Bananas Carrots Oranges Pears)

for item in ${BASKET[@]} ; do
    echo "My item is $item."
done

# Loop on the output of a command
for f in $( ls . ) ; do
    echo "File is: $f"
done
