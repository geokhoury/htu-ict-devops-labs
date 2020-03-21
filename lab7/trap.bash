#!/bin/bash

# Notice you cannot make Ctrl-C work in this shell

trap "echo Hello!" SIGINT SIGTERM
echo "Keep trying with Ctrl+C."

while true        
do
    sleep 60       
done