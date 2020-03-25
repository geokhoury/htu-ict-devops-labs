#!/bin/bash

function fun0 {
    return 25
}

function fun1(){
    echo 42
}

function fun2(){
    local res=$(fun1)
    echo $res
}

# Capture return value from fun0
# return_value=$(fun0)

# No returned value from function
# echo "Value of return (using function): $return_value"

# Status code set to 25
# echo "Value of return (using \$?): $?"

# fun1
# fun2