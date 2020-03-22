#!/bin/bash

echo "Script Name: $0"
function myFunction {
    for var in $*
    do
        let i=i+1
        echo "The \$${i} argument is: ${var}"
    done
    echo "Total count of arguments: $#"
}
myFunction We are a list of arguments

