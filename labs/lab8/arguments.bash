
#!/bin/bash
# This script discusses using command line arguments

echo "This is script with PID: $$".

echo "There are $# arguments passed as arguments." # number of passed arguments
echo "The arguments provided are [$*]."

# The variable $@ holds a space delimited string of all arguments passed to the script
# echo "$@"


# The variable $0 holds the command name
echo "The command is: $0."
echo

# The variable $1 holds the first argument
echo "The first argument is: $1."

# The variables $5, $6 holds the 5th and 6th arguments
echo "The 5th argument is: $5."
echo "The 6th argument is: $6."

# The variables ${10}, ${11} holds the 10th and 11th arguments
echo "The 10th argument is: ${10}."
echo "The 11th argument is: ${11}."