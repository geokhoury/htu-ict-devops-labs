#!/bin/bash
function func {
    echo
    echo "When using \"\$*\""
    for ARG in "$*"
    do
        echo $ARG
    done
    echo
    echo "When using \"\$@\""
    for ARG in "$@"
    do
        echo $ARG
    done
}
func 1 2 3 4 5 6