#!/bin/bash

# Define file path
filename="sample.txt"

# Matches any 'a'
cat $filename | grep a

# Matches any string that starts with 'a'
cat $filename | grep ^a

# Matches any 't'
cat $filename | grep t

# Matches any string that ends with 't'
cat $filename | grep t$

# Matches any 'p'
cat $filename | grep p


# {n}    Matches the preceding character appearing 'n' times exactly
# {n,m}	 Matches the preceding character appearing 'n' times but not more than 'm' times
# {n, }	 Matches the preceding character only when it appears 'n' times or more

# Matches the preceding character appearing '2' times exactly
cat $filename | grep -E p\{2}


# \+     Matches one or more occurrence of the previous character
# \?     Matches zero or one occurrence of the previous character

# Matches any 't'
cat $filename | grep "t"

# Matches any string where 'a' precedes character 't'
cat $filename | grep "a\+t"