#!/bin/bash

# Echo for input
echo -n "Enter a number:"

# Read value
read value

if [[ $value =~ ^[0-9]+$ ]]; then
    # Echo it is a numeric value
    echo "'$value' is numeric."
else
    echo "'$value' is not numeric."
fi

## Notes

# [0-9] in the example above will match any single digit.
# [A-Z] would match any capital letter.
# [A-Za-z0-9] would match any letter and numbers.

# .  = replaces any character
# ^  = the beginning of a string
# $  = the end of a string
# *  = matches up zero or more times the preceding character
# \  = represent special characters
# () = groups regular expressions
# ?  = matches up exactly one character
# +  = more of the same.

# [A-Z]+ would match any sequence of capital letters.
# ^[A-Z]+$ would match a string that contains only capital letters.