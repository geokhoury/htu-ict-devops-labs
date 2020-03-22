# Lab 7 - Bash Basics

Lab files: [labs/lab7](../lab7)

## Reading Resources

* [Shell Scripting Tutorial](https://www.shellscript.sh/) -- **Imporant**
* [Shell Scripting Tips](https://www.shellscript.sh/tips/)
* [Bash Arrays](https://www.linuxjournal.com/content/bash-arrays)

## Exercises

In this lab we explore the following topics:

* [Basic Output](./output/)
* [Basic Input](./input/)
* [Basic Arithmetic](./arithmetic/) 
* [Variables](./variables/)
* [Arrays](./arrays/)
* [Strings](./strings/)

### Basic Output

We can use the `echo` command to output strings we pass as arguments.

```bash
# Print out hello!
echo "Hello, world!"
```

**You can refer to the following exercise files:**

* [`output/hello.bash`](./output/hello.bash)

### Basic Input

We can use the `read` command to ask the user to provide input via the attached terminal.

```bash
# Ask the user for login details
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
```

In the script segment above we now have the variables `uservar` and `passvar` containing the user input for the username and password respectively. The password input can be masked using the `-s` flag.

**You can refer to the following exercise files:**

* [`input/greeting.bash`](./input/greeting.bash)
* [`input/login.bash`](./input/login.bash)

### Basic Arithmetic

```bash
# Delcaring and initializing some variables
A=4
B=2

# Basic operations
echo "$A + $B = "$((A+B))
echo "$A - $B = "$((A-B))
echo "$A * $B = "$((A*B))
echo "$A / $B = "$((A/B))
```

**You can refer to the following exercise files:**

* [`arithmetic/basic-operators.bash`](./arithmetic/basic-operators.bash)
* [`arithmetic/calc.bash`](./arithmetic/calc.bash)

### Variables

Variables in Bash are created once they are assigned a value. Value assignment is done using `name=value`.

**Notes:**

* Variable names are case sensitive.
* Variable names can contain of a combination of letters, numbers and the underscore "_".
* No space is permitted on *either* side of the `=` sign when initializing variables.

```bash
PRICE_PER_APPLE=1
MyFirstLetters=ABC
greeting='Hello, world!'
```

To reference a variable `MY_VAR`, we can use `$MY_VAR` or `${MY_VAR}` to avoid ambiguity.

```bash
echo "The price of an Apple today is: $PRICE_PER_APPLE JOD."
echo "The first 10 letters in the alphabet are: ${MyFirstLetters}DEFGHIJ"
```

**You can refer to the following exercise files:**

* [`variables/variables.bash`](./variables/variables.bash)
* [`variables/dates.bash`](./variables/dates.bash)

### Arrays

An array is a set of values enclosed in `my_array=(item1 item2 item3 item4 item5)`. 
Array naming is the same as variables naming.

```bash
# Initialize an array
basket=(apple banana "Fruit Basket" orange)     # named: 'basket' has: 4 objects
count=${#basket[@]}                             # number of elements

# Print the first and last elements
echo "First element is: ${basket[0]}."
echo "Last element is: ${basket[count-1]}."
```

**You can refer to the following exercise files:**

* [`arrays/arrays.bash`](./arrays/arrays.bash)
* [`arrays/array-comparison.bash`](./arrays/array-comparison.bash)

### Strings

In bash strings are just an array of characters. We can use array operations to interact with the string.

```bash

#       1234567890123456
STRING="this is a string"

# We can find the length of a string
echo ${#STRING}             # 16, just like an array
```

In the exercise files below you will learn more about substrings, and substring replacements. As well as looping over a string array.

**You can refer to the following exercise files:**

* [`strings/strings.bash`](./strings/strings.bash)