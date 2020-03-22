#!/bin/bash

function add {
    echo "$(($1 + $2))"
}

opcode=0

echo "Welcome to our advanced calculator!"
echo "=]"

echo 

read -p "Enter first number:" firstNumber
read -p "Enter second number:" secondNumber

echo "A)dd"
echo "S)ubtract"
echo "D)ivide"
echo "M)ultiply"

echo
read -p "Choose your operation:" opcode

case $opcode in
    A) add firstNumber secondNumber;;
    # S)ubtract;;
    # D)ivide;;
    # M)ultiply;;
    *) echo "Bye bye!" && exit;;
esac