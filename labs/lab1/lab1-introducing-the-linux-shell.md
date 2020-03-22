## Lab 1 - Introducing the Linux Shell

## Reading Resources

### Bash

- [Bash (Unix shell)](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29)
- [Bash](https://www.gnu.org/software/bash/)
- [Bash scripting cheatsheet](https://devhints.io/bash)

## The Shell

- A program that interprets commands
- Allows a user to execute commands by typing them manually at a terminal, or automatically
  in programs called shell scripts.
- A shell is not an operating system. It is a way to interface with the operating system and run
  commands.

If you have used a Linux system, you know that when you log in, you are greeted by a prompt that looks something like this:

```bash
user@host$:~
```

The particular prompt that you see may look quite different. A typtical prompt contains the name of the logged in user (`user`), your systems hostname (`host`), the name of the current working directory (`~`).

The program that printed that prompt is called a "shell," and on most Linux-based operating systems the default shell is **bash**.

##### _Are you running bash?_

You can check which shell is running executing:

```bash
user@host$:~ echo $SHELL
/bin/bash
```

## About Bash

Bash, an acronym for "Bourne-again shell," is the default shell on most Linux-based operating systems.

- Which other shells do you know?
- Which commands do you know that are built-in the Bash shell?
- Which commands do you know that are system tools, and not a part of the Bash shell?

## Command Syntax

Commands can be run by themselves, or you can pass in additional arguments to make them do
different things.

Typical command syntax can look something like this:

`command [-argument] [-argument] [--argument] [file]`

#### Examples:

- `ls` - List files in current directory
- `ls -l` - Lists files in "long" format
- `ls -l --color` - As above, with colourized output
- `cat filename` - Show contents of a file
- `cat -n filename` - Show contents of a file, with line number.

## Getting Help

When you're stuck and need help with a Linux command, help is usually only a few keystrokes
away! Help on most Linux commands is typically built right into the commands themselves,
available through online help programs (“man pages” and “info pages”), and of course online.

### Using a Command's Built-In Help

Many commands have simple "help" screens that can be invoked with special command flags.

These flags usually look like "-h" or "--help".

Example:

- `grep --help`

### Online Manuals: "Man Pages"

The best source of information for most commands can be found in the online manual pages,
known as "man pages" for short. To read a command's man page, type "man command".

Examples:

- `man ls` - Get help on the "ls" command.
- `man man` - A manual about how to use the manual!

To search for a particular word within a man page, type "/word". To quit from a man page, just
type the "Q" key.

Sometimes, you might not remember the name of Linux command and you need to search for it.

For example, if you want to know how to change a file's permissions, you can search the man page
descriptions for the word "permission" like this: `man -k permission`

If you look at the output of this command, you will find a line that looks something like:

**chmod (1) - change file access permissions**

Now you know that "chmod" is the command you were looking for. Typing "man chmod" will
show you the chmod command's manual page!

### Info Pages

Some programs, particularly those released by the Free Software Foundation, use info pages as
their main source of online documentation. Info pages are similar to man page, but instead of
being displayed on one long scrolling screen, they are presented in shorter segments with links to
other pieces of information. Info pages are accessed with the “info” command, or on some
Linux distributions, “pinfo” (a nicer info browser).

For example:

- `info df` - Loads the “df” info page.`
