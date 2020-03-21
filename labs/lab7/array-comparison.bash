#!/bin/bash

# basic construct
# array=(value1 value2 ... valueN)
array=(blue green yellow red)

#To refer to a particular value (e.g. : to refer 3rd value)
echo ${array[2]}

#To refer to all the array values
echo ${array[@]}

#To evaluate the number of elements in an array
echo ${#array[@]}

