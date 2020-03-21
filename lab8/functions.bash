#!/bin/bash

function function_B {
  echo "Function B."
}

function function_A {
  echo "$1"
}

function adder {
  echo "$(($1 + $2))"
}

# FUNCTION CALLS

# Pass parameter to function A
function_A "Function A."     # Function A, call with 1 parameter.
function_B                   # Function B, call without a parameter.

# Pass two parameters to function adder
adder 12 56                  # 68, function with two parameters.