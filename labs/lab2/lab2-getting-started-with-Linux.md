## Lab 2 - Getting started with Linux

## Reading Resources

* [Common Linux Commands](https://www.dummies.com/computers/operating-systems/linux/common-linux-commands/)
* [25 Basic Commands for Begginers](https://www.pcsuggest.com/basic-linux-commands/)

## Getting started with Linux

By now you have noticed that starting bash is not the most useful or exciting thing you can do on a Linux system. Let us start using bash to navigate around our file system.

At the prompt, type the following (without the $):

#### Changing Directories

```bash
user@host$:~ cd /
```

With the `cd` command we are changing directories from the current working directory (`~`) to (`/`).
In Linux `/` is the root directory. The root directory is the one from which all other directories branch off from.

#### Paths

To know where you are in bash, you can use the `pwd` command:

```bash
user@host$:/ pwd
/
```

The `pwd` (print working directory) displays the current working directory. The `pwd` command writes the full pathname of the current working directory to the standard output.

A path, the general form of the name of a file or directory, specifies a unique location in a file system.

There are two types of paths in Linux:

* An **Absolute** *or* **full** path points to the same location in a file system, regardless of the current working directory. To do that, it must include the root directory.

	* `/home/user/docs/Letter.txt`
	* `/etc/ssh/sshd_config` 

* A **Relative** path starts from some given working directory, avoiding the need to provide the full absolute path.

	* `./inthisdir`
	* `../../greatgrandparent`

### Using Linux

### Introducing `ls`

Now, we'll take a quick look at the ls command. Very likely, you're already familiar with ls and know that typing it by itself will list the contents of the current working directory:

```bash
user@host$:~ cd /usr
user@host$:~ ls
X11R6      doc         i686-pc-linux-gnu  lib      man          sbin   ssl
bin        gentoo-x86  include            libexec  portage      share  tmp
distfiles  i686-linux  info               local    portage.old  src
```

By specifying the `-a` option, you can see all of the files in a directory, including hidden files: those that begin with (`.`). 

As you can see in the following example, `ls -a` reveals the `.` and `..` special directory links:

```bash
user@host$:~ ls -a
.      bin        gentoo-x86         include  libexec  portage      share  tmp
..     distfiles  i686-linux         info     local    portage.old  src
X11R6  doc        i686-pc-linux-gnu  lib      man      sbin         ssl
```

#### Long directory listings

You can also specify one or more files or directories on the `ls` command line.

If you specify a file, `ls` will show that file only. If you specify a directory, `ls` will show the contents of the directory. The `-l` option comes in very handy when you need to view permissions, ownership, modification time, and size information in your directory listing.

In the following example, we use the `-l` option to display a full listing of my `/usr` directory.

### Introducing `mkdir`

Let's take a quick look at the `mkdir` command, which can be used to create new directories. The following example creates three new directories, *tic, tac, and toe,* all under `/tmp`:

```bash
user@host$:~ cd /tmp
user@host$:~ mkdir tic tac toe
```

By default, the `mkdir` command does not create parent directories for you; the entire path up to the next-to-last element needs to exist. So, if you want to create the directories won/der/ful, you'd need to issue three separate mkdir commands:

```bash
user@host$:~ mkdir won/der/ful
mkdir: cannot create directory `won/der/ful': No such file or directory
user@host$:~ mkdir won
user@host$:~ mkdir won/der
user@host$:~ mkdir won/der/ful
```

We can use the `-p` option to mkdir to create any missing parent directories, as you can see here:

```bash
user@host$:~ mkdir -p easy/as/pie
```

### Introducing `touch`

The touch command updates the "mtime" of a file if it exists (recall the sixth column in `ls -l` output). If the file does not exist, then a new, empty file will be created. You should now have a /tmp/copyme file with a size of zero bytes.

```bash
user@host$:~ cd /tmp
user@host$:~ touch copyme
```

### Introducing `echo`

Now that the file exists, let us add some data to the file. We can do this using the echo command, which takes its arguments and prints them to standard output. First, the echo command by itself:

```bash
user@host$:~ echo "firstfile"
firstfile
```

Now, the same echo command with output redirection:

```bash
user@host$:~ echo "firstfile" > copyme
```

The greater-than (`>`) sign tells the shell to write the output of the `echo` command to a file `copyme`. This file will be created if it doesn't exist, and will be overwritten if it does exist. 

By typing `ls -l`, we can see that the copyme file is 10 bytes long, since it contains the word firstfile and the newline character:

```bash
user@host$:~ ls -l copyme
-rw-r--r--    1 root     root           10 Dec 28 14:13 copyme
```


### Introducing `cat`

```bash
user@host$:~ cat copyme
firstfile
```

### Introducing `cp`

Now, we can use a basic invocation of the `cp` command to create a `copiedme` file from the original `copyme` file:

```bash
user@host$:~ cp copyme copiedme
```

Upon investigation, we find that they are truly separate files; their inode numbers are different:

```bash
user@host$:~ ls -i copyme copiedme
648284 copiedme   650704 copyme
```

### Introducing `mv`

Using the `mv` command we can rename "copiedme" to "movedme". 

##### *Do you think the inode number will remain the same, or change?*

```bash
user@host$:~ mv copiedme movedme
user@host$:~ ls -i movedme
648284 movedme
```

### Introducting `rm`

To remove objects from the file system. Normally, this is done with the rm command. To remove files, simply specify them on the command line:

```bash
user@host$:~ cd /tmp
user@host$:~ touch file1 file2
user@host$:~ ls -l file1 file2
-rw-r--r--    1 root     root            0 Jan  1 16:41 file1
-rw-r--r--    1 root     root            0 Jan  1 16:41 file2
user@host$:~ rm file1 file2
user@host$:~ ls -l file1 file2
ls: file1: No such file or directory
ls: file2: No such file or directory
```

**Note** that under Linux, once a file is removed, it is gone forever. 

You can use the `-i` option to remove all files in interactive mode -- that is, prompt before removing any file. 

For example:

```bash
user@host$:~ rm -i file1 file2
rm: remove regular empty file `file1'? y
rm: remove regular empty file `file2'? y
```

### Introducting `rmdir`

To remove directories, you have two options. You can remove all the objects inside the directory and then use rmdir to remove the directory itself:

```bash
user@host$:~ mkdir mydir
user@host$:~ touch mydir/file1
user@host$:~ rm mydir/file1
user@host$:~ rmdir mydir
```

This is not a good way to remove files. All power users and administrators will use the much more convenient `rm -rf command`, covered next.

The best way to remove a directory is to use the recursive force options of the rm command to tell rm to remove the directory you specify, as well as all objects contained in the directory:

```bash
user@host$:~ rm -rf mydir
```

Generally, `rm -rf` is the preferred method of removing a directory tree. 

**Be very careful when using `rm -rf`, since it is powerful and can destory your system.**

## Extra

It makes sense to explore the Linux filesystem from a terminal window, not because the author is a grumpy old man and resents new kids and their pretty graphical tools — although there is some truth to that — but because a terminal, despite being text-only, has better tools to show the map of Linux’s directory tree.

In fact, that is the name of the first tool you’ll install to help you on the way: tree. If you are using Red Hat or Fedora, do:

`sudo dnf install tree`

On Ubuntu or Debian, you can do:

`sudo apt install tree`

Once installed, stay in your terminal window and run tree like this:

```bash
user@host$:/ tree /
```

The / in the instruction above refers to the root directory. When you run tree and tell it to start with /, you will see the whole directory tree, all directories and all the subdirectories in the whole system, with all their files, fly by.

If you have been using your system for some time, this may take a while, because, even if you haven’t generated many files yourself, a Linux system and its apps are always logging, cacheing, and storing temporal files. The number of entries in the file system can grow quite quickly.

Don’t feel overwhelmed, though. Instead, try this:

```bash
user@host$:/ tree -L 1 /
```

The instruction above can be translated as *“show me only the 1st Level of the directory `tree` starting at / (root)“*. The `-L` option tells tree how many levels down you want to see.

Most Linux distributions will show you the same or a very similar layout to what you can see in the image above. This means that even if you feel confused now, master this, and you will have a handle on most, if not all, Linux installations in the whole wide world.



