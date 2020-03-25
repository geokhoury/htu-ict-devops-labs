#!/bin/bash

# Basic Construct

# while [ condition ]
# do
#  command(s)...
# done

# The while construct tests for a condition, and if true, executes commands. 
# It keeps looping as long as the condition is true.

COUNT=4
while [ $COUNT -gt 0 ]; do
    echo "Value of count is: $COUNT"
    COUNT=$(($COUNT - 1))
done
