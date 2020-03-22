#!/bin/bash

# Ask the user for their name
echo Hello, who am I talking to?   # Write to  (fd/stdout)(1)
read name                          # Read from (fd/stdin)(0)
echo It\'s nice to meet you $name. # Write to  (fd/stdout)(1)
