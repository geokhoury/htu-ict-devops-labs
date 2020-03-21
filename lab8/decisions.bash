#!/bin/bash
# This script discusses basic bash operators

## if [ expression ]; then
##  code if 'expression' is true
## fi

# COURSE="DevOps"
# if [ "$COURSE" = "DevOps" ]; then
#     echo "This is the DevOps course."
# fi

# It can be expanded with 'else'

# COURSE="Linux"
# if [ "$COURSE" = "DevOps" ]; then
#     echo "This is the DevOps course."
# else
#     echo "This is the $COURSE course."
# fi

# It can be expanded with 'elif' (else-if)

# COURSE="Intro to Linux"
# if [ "$COURSE" = "DevOps" ]; then
#     echo "This is the DevOps course."
# elif [ "$COURSE" = "Linux" ]; then
#     echo "This is the Linux course."
# elif [ "$COURSE" = "Intro to Linux" ]; then
#     echo "This is the Intro to Linux course."
# else
#     echo "This is the $COURSE course."
# fi

# The expression used by the conditional construct is evaluated to either true or false. 
# The expression can be a single string or variable. 
# A empty string or a string consisting of spaces or an undefined variable name, are evaluated as false. 
# The expression can be a logical combination of comparisons: 
## * negation is denoted by !, 
## * logical AND (conjunction) is denoted by &&, 
## * logical OR (disjunction) is denoted by ||
## * conditional expressions should be surrounded by double brackets [[ ]].

# Types of numeric comparisons
# comparison    Evaluated to true when
# $a -lt $b    $a < $b
# $a -gt $b    $a > $b
# $a -le $b    $a <= $b
# $a -ge $b    $a >= $b
# $a -eq $b    $a is equal to $b
# $a -ne $b    $a is not equal to $b

# Types of string comparisons
# comparison    Evaluated to true when
# "$a" = "$b"     $a is the same as $b
# "$a" == "$b"    $a is the same as $b
# "$a" != "$b"    $a is different from $b
# -z "$a"         $a is empty

# note1: whitespace around = is required
# note2: use "" around string variables to avoid shell expansion of special characters as *

# COURSE="DevOps"
# NUMBER=42

# if [[ "$COURSE" = "DevOps" &&  $NUMBER -lt 50 ]]; then
#     echo "Condition is true. Course is $COURSE and number is $NUMBER."
# fi

# COURSE="DevOps"
# NUMBER=82
# if [ ! "$COURSE" = "DevOps"  ] || [ ! $NUMBER -lt 50 ]; then
#     echo "Condition is true. Course is $COURSE or number is $NUMBER."
# fi

# COURSE="DevOps"
# NUMBER=82
# if [ ! "$COURSE" = "DevOps"  ] || [ ! $NUMBER -lt 50 ]; then
#     echo "Condition is true. Course is $COURSE or number is $NUMBER."
# fi

# COURSE="DevOps"
# NUMBER=82
# if [[ ! $NUMBER -lt 50 ]]; then
#     echo "Condition is true. Course is $COURSE or number is $NUMBER."
# fi

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

## [ $# ]

## myArray=($@)
## shift

# $0: Command
# $1 - $9 : Arguments 