# Lab 5 - Environment Variables

## Reading Resources

### Linux Environment Variables

* [Introduction to the Linux Environment](https://phoenixts.com/blog/environment-variables-in-linux/)
* [Linux Environment Variables](https://www.guru99.com/linux-environment-variables.html)


## Environment Variables

### What is the Linux environment?

One way that the shell keeps track of all of these settings and details is through an area it maintains called the environment. The *environment* is an area that the shell builds every time that it starts a session that contains variables that define system properties.

In this lab, we will discuss how to interact with the environment and read or set environmental and shell variables interactively and through configuration files.

### What is a Variable?

In computer science, a variable is a location for storing a value which can be a filename, text, number or any other data. It is usually referred to with its Symbolic name which is given to it while creation. The value thus stored can be displayed, deleted, edited and re-saved.


### What are Environment Variables?

Environment variables are dynamic values which affect the processes or programs on a computer. They exist in every operating system, but types may vary. Environment variables can be created, edited, saved, and deleted and give information about the system behavior.

### Types of Environment Variables

* **Environmental variables** are variables that are defined for the current shell and are inherited by any child shells or processes. Environmental variables are used to pass information into processes that are spawned from the shell.

* **Shell variables** are variables that are contained exclusively within the shell in which they were set or defined. They are often used to keep track of ephemeral data, like the current working directory.

### Common Environmental and Shell Variables

| Variable |                                                                                   Description                                                                                   |
| -------- | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| SHELL    |                                                  This describes the shell that will be interpreting any commands you type in.                                                   |
| TERM     |                                                     This specifies the type of terminal to emulate when running the shell.                                                      |
| USER     |                                                                           The current logged in user.                                                                           |
| PWD      |                                                                         The current working directory.                                                                          |
| OLDPWD   |                          The previous working directory. This is kept by the shell in order to switch back to your previous directory by running cd -.                          |
| MAIL     |                                                                     The path to the current user’s mailbox.                                                                     |
| PATH     | A list of directories that the system will check when looking for commands. When a user types in a command, the system will check directories in this order for the executable. |
| HOME     |                                                                       The current user’s home directory.                                                                        |
| _        |                                                                  The most recent previously executed command.                                                                   |
| HOSTNAME |                                                                   The hostname of the computer at this time.                                                                    |


## Using Environment Variables

### Printing Shell and Environmental Variables

Each shell session keeps track of its own shell and environmental variables. We can access these in a few different ways.

We can see a list of all of our environmental variables by using the env or printenv commands. In their default state, they should function exactly the same:

```bash
$ printenv
```

```bash
SHELL=/bin/bash
TERM=xterm
USER=demouser
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca:...
MAIL=/var/mail/demouser
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
PWD=/home/demouser
LANG=en_US.UTF-8
SHLVL=1
HOME=/home/demouser
LOGNAME=demouser
LESSOPEN=| /usr/bin/lesspipe %s
LESSCLOSE=/usr/bin/lesspipe %s %s
_=/usr/bin/printenv
```

### Setting Shell and Environmental Variables

To better understand the difference between shell and environmental variables, and to introduce the syntax for setting these variables, we will do a small demonstration.

#### Creating Shell Variables

We will begin by defining a shell variable within our current session. This is easy to accomplish; we only need to specify a name and a value. We’ll adhere to the convention of keeping all caps for the variable name, and set it to a simple string.

```bash
TEST_VAR='Hello World!'
```

Here, we’ve used quotations since the value of our variable contains a space. Furthermore, we’ve used single quotes because the exclamation point is a special character in the bash shell that normally expands to the bash history if it is not escaped or put into single quotes.

We now have a shell variable. This variable is available in our current session, but will not be passed down to child processes.

We can see this by grepping for our new variable within the set output:

```bash
set | grep TEST_VAR
TEST_VAR='Hello World!'
```

We can verify that this is not an environmental variable by trying the same thing with printenv:

```bash
printenv | grep TEST_VAR
No output should be returned.
```

Let’s take this as an opportunity to demonstrate a way of accessing the value of any shell or environmental variable.

```bash
echo $TEST_VAR
Hello World!
```
As you can see, reference the value of a variable by preceding it with a `$` sign. The shell takes this to mean that it should substitute the value of the variable when it comes across this.

So now we have a shell variable. It shouldn’t be passed on to any child processes. We can spawn a new bash shell from within our current one to demonstrate:

```bash
echo $TEST_VAR
```

If we type bash to spawn a child shell, and then try to access the contents of the variable, nothing will be returned. This is what we expected.

Get back to our original shell by typing exit:

```bash
exit
```
#### Creating Environmental Variables

Now, let’s turn our shell variable into an environmental variable. We can do this by exporting the variable. The command to do so is appropriately named:

```bash
export TEST_VAR
```

This will change our variable into an environmental variable. We can check this by checking our environmental listing again:

```bash
printenv | grep TEST_VAR
TEST_VAR=Hello World!
```

This time, our variable shows up. Let’s try our experiment with our child shell again:

```bash
echo $TEST_VAR
Hello World!
```

Our child shell has received the variable set by its parent. Before we exit this child shell, let’s try to export another variable. We can set environmental variables in a single step like this:

```bash
export NEW_VAR="Testing export"
```

Test that it’s exported as an environmental variable:

```bash
printenv | grep NEW_VAR
NEW_VAR=Testing export
```

Now, let’s exit back into our original shell:

```bash
exit
```

Let’s see if our new variable is available:

```bash
echo $NEW_VAR
```
Nothing is returned.

This is because environmental variables are only passed to child processes. There isn’t a built-in way of setting environmental variables of the parent shell. This is good in most cases and prevents programs from affecting the operating environment from which they were called.

The `NEW_VAR` variable was set as an environmental variable in our child shell. This variable would be available to itself and any of its child shells and processes. When we exited back into our main shell, that environment was destroyed.

### Unsetting Environmental Variables

We still have our `TEST_VAR` variable defined as an environmental variable. We can change it back into a shell variable by typing:

```bash
export -n TEST_VAR
```

It is no longer an environmental variable:

```bash
printenv | grep TEST_VAR
```

However, it is still a shell variable:

```bash
set | grep TEST_VAR
TEST_VAR='Hello World!'
```

If we want to completely unset a variable, either shell or environmental, we can do so with the unset command:

```bash
unset TEST_VAR
```

We can verify that it is no longer set:

```bash
echo $TEST_VAR
```

Nothing is returned because the variable has been **unset**.
