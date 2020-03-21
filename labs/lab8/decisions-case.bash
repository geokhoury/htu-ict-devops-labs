#!/bin/bash

# simple case bash structure

# devtools=3
# case $devtools in
#     1) echo "You selected Bash.";;
#     2) echo "You selected Perl.";;
#     3) echo "You selected Phyton.";;
#     4) echo "You selected C++.";;
#     5) exit
# esac

# Read value for 
read -p 'Choose a fruit:' fruit

case $fruit in
    [1-3]) echo "Calling managers!";;
    a) echo "Here are your apples.";;
    b) echo "Here are your bananas.";;
    m) echo "Here are your mango.";;
    *) echo "We do not have that yet!";;
esac