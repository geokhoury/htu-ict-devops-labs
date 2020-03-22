# Lab 8 - Advanced Bash

Lab files: [labs/lab8](../lab8)

## Reading Resources

* [Shell Scripting Tutorial](https://www.shellscript.sh/) -- **Imporant**
* [Shell Scripting Tips](https://www.shellscript.sh/tips/)

## Exercises

In this lab we explore the following topics:

* [Arguments and Argument Lists]()
* [Loops]()
* [Decisions]()
* [Functions]()
* [Signals and Traps]()

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
## basic construct
for arg in [list];
do
 command(s)...
done

# For each pass through the loop, arg takes on the value of each successive value in the list. 
# Then the command(s) are executed.

# loop on array member
BASKET=(Bananas Carrots Oranges Pears)

for item in ${BASKET[@]} ; do
    echo "My item is $item."
done
```

**You can refer to the following exercise files:**

* [`loops.bash`](./loops.bash)
* [`loops-index.bash`](./loops-index.bash)

### Decisions

```bash
## basic construct

COURSE="Linux"
if [ "$COURSE" = "DevOps" ]; then
    echo "This is the DevOps course."
else
    echo "This is the $COURSE course."
fi
```

**You can refer to the following exercise files:**

* [`decisions-case.bash`](./decisions-case.bash)
* [`decisions-ifelse.bash`](./decisions-ifelse.bash)

### Functions

### Signals and Traps