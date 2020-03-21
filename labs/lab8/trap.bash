#!/bin/bash

# Notice you cannot make Ctrl-C work in this shell

# trap statement SIGNAL_ID

function quit {
    read -p "Are you sure you want to quit? (Y/n)" answer
    if [ $answer = "n" ]; then
        echo "Okay, welcome back!"
        # showMenu
    else
        exit
    fi
}

# Trap signals SIGINIT and SIGTERM
trap quit SIGINT SIGTERM

# Echo the program statement
echo "Try exiting with CTRL+C."

# Infinite loop to keep the terminal attached
while true        
do
    sleep 60       
done