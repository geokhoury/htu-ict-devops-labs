#!/bin/bash

# Read email
read -p "Enter email: " email

# Check if email matches the pattern user@domain.tld
if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]
then
    echo "'$email' is a valid email."
else
    echo "'$email' is not a valid email."
fi