#!/bin/bash
# This script discusses basic bash operators

# Clear the screen before getting started 
clear

# Delcaring and initializing some variables
A=3
B=4
C=5

# With the bash operators we can

# Add
added=$((A+B))

# Subtract
subtracted=$((A-B))

# Multiply
multiplied=$((A*B*C))

# Divide
divided=$((B/A))

# Modulo
remainder=$((C%4))

# Exponents
expo=$((2**5))

echo "The values are A: $A, B: $B, C: $C."
echo
echo -e "The results are {added: $added}, {subtracted: $subtracted}. \n"
echo -e "The results are {multiplied: $multiplied}, {divided: $divided}. \n"
echo -e "The results are {remainder: $remainder}, {expo: $expo}. \n"

# We can also evaluate more complex expressions.

expression1=$(((A+B) * C)) # 35
echo "The value of expression1 is $expression1."

expression2=$((100 * $A + 5)) # 305
echo "The value of expression2 is $expression2."
