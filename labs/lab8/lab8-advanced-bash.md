# Lab 8 - Advanced Bash

Lab files: [labs/lab8](../lab8)

## Reading Resources

* [Shell Scripting Tutorial](https://www.shellscript.sh/) -- **Imporant**
* [Shell Scripting Tips](https://www.shellscript.sh/tips/)

## Exercises

In this lab we explore the following topics:

* [Arguments and Argument Lists](./arguments/)
* [Loops](./loops/)
* [Decisions](./decisions/)
* [Functions](./functions/)
* [Signals and Traps](./traps/)
* [Testing Files](./files/)
* [Regex](./regex/)

### Arguments and Argument Lists

```bash
#!/bin/bash
# This script discusses using command line arguments

echo "This is script with PID: $$".

echo "There are $# arguments passed as arguments." # number of passed arguments
echo "The arguments provided are [$*]."

# The variable $@ holds a space delimited string of all arguments passed to the script
echo "$@"
```

**You can refer to the following exercise files:**

* [`arguments.bash`](./arguments.bash)
* [`arguments-list.bash`](./arguments-list.bash)

### Loops

```bash
# Declare and initialize an array
BASKET=(Bananas Carrots Oranges Pears)

# Loop over array using for
for item in ${BASKET[@]} ; do
    echo "My item is $item."
done
```

**You can refer to the following exercise files:**

* [`loops.bash`](./loops.bash)
* [`loops-index.bash`](./loops-index.bash)

### Decisions

In bash the following is the basic construct for an `if` statement.

```bash
if [ expression ]; then
 code if 'expression' is true
fi
```

Here is an example.

```bash
# Declare and initialize variable for expression
COURSE="Linux"

# if-else block to check the value of $COURSE
if [ "$COURSE" = "DevOps" ]; then
    echo "This is the DevOps course."
else
    echo "This is the $COURSE course."
fi
```

**You can refer to the following exercise files:**

* [`decisions-case.bash`](./decisions/decisions-case.bash)
* [`decisions-ifelse.bash`](./decisions/decisions-ifelse.bash)

### Functions

### Signals and Traps

### Testing Files

### Regex

#### Tutorials to check out

* [http://www.rexegg.com/](http://www.rexegg.com/)
* [Regex Tutorial (Sed, AWK)](https://likegeeks.com/regex-tutorial-linux/)
* [Regex using Sed](https://www.tutorialspoint.com/unix/unix-regular-expressions.htm)