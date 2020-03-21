#!/bin/bash

## Initialization for an array 

# named: my_array
# has: 4 objects

my_array=(apple banana "Fruit Basket" orange)
count=${#my_array[@]}

echo "First element is: ${my_array[0]}."
# echo ${my_array[3]}
echo "Last element is: ${my_array[count-1]}."
# echo "Last element is: ${my_array[-1]}."

##
## Prints the size of the array or "number of objects"

echo -e "There is ${#my_array[@]} elements in total. \n" # 4

## Inserting 

my_array[4]="carrot"                    # value assignment without a $ and curly brackets
echo "Added 'carrot' at [4]."

echo "3rd element is at [2]: ${my_array[2]}."
echo "4th element is at [3]: ${my_array[3]}."
echo "5th element is at [4]: ${my_array[4]}."

echo -e "There is ${#my_array[@]} elements in total. \n" # 5

# Printing last element

#${my_array[ VALUE ]}
#                ${ VALUE OF SIZE }-1
#                            #my_array[@]

echo ${my_array[${#my_array[@]}-1]}     # carrot