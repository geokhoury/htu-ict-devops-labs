#!/bin/bash

# Basic construct

# until [ condition ]
# do
#  command(s)...
# done

# The until construct tests for a condition, and if false, executes commands. 
# It keeps looping as long as the condition is false (opposite of while construct).

COUNT=1
until [ $COUNT -gt 5 ]; do
    echo "Value of count is: $COUNT"
    COUNT=$(($COUNT + 1))
done
