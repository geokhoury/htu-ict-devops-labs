#!/bin/bash

# Check the number of arguments
if [ $# != 1 ]; then
    # Echo usage
    echo "Usage: $0 address"
    exit 1
else
    ip=$1
fi

# Check if patter matches IPv4
if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "'$ip' is an IPv4 address."

# Check if patter matches IPv4
elif [[ $ip =~ ^[A-Fa-f0-9:]+$ ]]; then
    echo "'$ip' could be an IPv6 address."

# Handle other cases
else
    echo "'$ip' is not an IP address."
fi