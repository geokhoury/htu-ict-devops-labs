#!/bin/bash

# Initialize an array
basket=(apple banana "Fruit Basket" orange)     # named: 'basket' has: 4 objects
count=${#basket[@]}                             # number of elements

# Print the first and last elements
echo "First element is: ${basket[0]}."
echo "Last element is: ${basket[count-1]}."

# Prints the size of the array
echo "The array has ${#basket[@]} elements."    # 4

# Inserting elements 
basket[4]="carrot"                              # value assignment
echo "Added 'carrot' at [4]."

# Get elements by their index
echo "3rd element is at [2]: ${basket[2]}."
echo "4th element is at [3]: ${basket[3]}."
echo "5th element is at [4]: ${basket[4]}."

# Get the indexes in the array
indexes_array=${!arr[*]}

# Printing last element
echo ${basket[${#basket[@]}-1]}                 # carrot