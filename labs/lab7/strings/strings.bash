#!/bin/bash

# In bash strings are just an array of characters

#       1234567890123456
STRING="this is a string"

# We can find the length of a string
echo ${#STRING}            # 16

## Substring Extraction


# Extract substring of length $LEN from $STRING starting after position $POS. Note that first position is 0.
STRING="this is a string"
POS=2
LEN=6
echo ${STRING:$POS:$LEN}   # his

# If :$LEN is omitted, extract substring from $POS to end of line
STRING="this is a string"
echo ${STRING:1}           # $STRING contents without leading character
echo ${STRING:12}          # ring

# Replace first occurrence of substring with replacement
STRING="to be or not to be"
echo ${STRING[@]/be/eat}        # to eat or not to be

# Replace all occurrences of substring
STRING="to be or not to be"
echo ${STRING[@]//be/eat}        # to eat or not to eat

# Delete all occurrences of substring (replace with empty string)
STRING="to be or not to be"
echo ${STRING[@]// not/}        # to be or to be

# Replace occurrence of substring if at the beginning of $STRING
STRING="to be or not to be"
echo ${STRING[@]/#to be/eat now}    # eat now or not to be

# Replace occurrence of substring if at the end of $STRING
STRING="to be or not to be"
echo ${STRING[@]/%be/eat}        # to be or not to eat

# replace occurrence of substring with shell command output
STRING="to be or not to be"
echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)}    # to be or not to be on 2020-03-15