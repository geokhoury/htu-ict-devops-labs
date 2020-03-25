#!/bin/bash

# Basic construct

devtools=3
case $devtools in
    1) echo "You selected Bash.";;
    2) echo "You selected Perl.";;
    3) echo "You selected Phyton.";;
    4) echo "You selected C++.";;
    5) exit
esac

# Read value for 
read -p 'Choose a fruit:' fruit

case $fruit in
    a) echo "Here are your apples.";;
    b) echo "Here are your bananas.";;
    m) echo "Here are your mango.";;
[1-3]) echo "Call managers.";;
    *) echo "We do not have that yet!";;
esac