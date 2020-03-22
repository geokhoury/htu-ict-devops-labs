# Lab 3 - User and Group Management

## Overview

## Reading Resources

### Linux User Management

* [Managing Users and Groups](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/basic-system-configuration/Managing_Users_and_Groups/#)
* [An Introduction to Linux Permissions](https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-permissions)
* [Understanding Linux File Permissions](https://www.linux.com/tutorials/understanding-linux-file-permissions/)


## User Accounts

In this section, we will learn how to create, modify and delete user accounts.

### Viewing and Changing the Default Values for `useradd`

The *default* options for user creation can be viewed and modified using the `-D` flag.

To **view** the default options use -

```bash
$ useradd -D
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/bash
SKEL=/etc/skel
CREATE_MAIL_SPOOL=yes
```

To **modify** the default options we can use specific flags to change the values. For example to change the default `SHELL`, we can use the `-s [PATH FOR SHELL]`.

```bash
$ useradd -D -s /bin/ksh
$ useradd -D
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/ksh
SKEL=/etc/skel
CREATE_MAIL_SPOOL=yes
```

### User Creation Using `useradd`


After modifying the default options, every user is created with the settings listed above. 

To **create** a user with the username `user01` you can use the following command -

```bash
$ useradd user01
```

To **create** a user with custom options you can use the flags to override the default values (see `man useradd` for help).

```bash
$ useradd -u 1099 -c "Second user" -s /bin/bash user02
```

To **verify** a user has been created, we can use the `id [username]` command -

```bash
$ id user02
uid=1099(user02) gid = 1099(user02) groups=1099(user02)
```

The command above will create a new user with the username `user02`. It also sets the following values:

* Sets the `UID` to `1099`.
* Sets the comment or short description for the user to `Second user`.
* Sets the login shell to `/bin/bash`.

### User Deletion Using `userdel`

To **delete** a user with the username `user01` you can use the following command -

```bash
$ userdel user01
```

**Note:** this does not remove the home directory for the deleted user.

If you wish to remove the home directory for the user, you can use the following command.

```bash
$ rm -rf /home/user01
```

### Enabling Password Aging Using `chage`

For security reasons, it is advisable to require users to change their passwords periodically. This can be done by using the chage command.

To configure password expiration for a user from a shell prompt, run the following command as root:

```bash
$ chage -
```

You can configure a password to expire the first time a user logs in. This forces users to change passwords immediately.

1. Set up an initial password. There are two common approaches to this step: you can either assign a default password, or you can use a null password.

To assign a default password, type the following at a shell prompt as root:

```bash
$ passwd user01
```

To assign a null password instead, use the following command:

```bash
$ passwd -d user01
```

2. Force immediate password expiration by running the following command as root:

```bash
$ chage -d 0 user01
```

## User Groups

Use the `wheel` group to grant users `sudo` permission. To add user `newadmin` to the group `wheel` use the following command - 

```bash
$ gpasswd -a newadmin wheel
```

or 

```bash
$ usermod -aG wheel newadmin
```

## Extra

Sometimes we need to create *service users*. Those are users that are not allowed to login to the system over remote logins, or the console. Those users can still run system services, execute CRON jobs, or run applications. This is a very common practice to prevenet unnecessary accounts from logging into the system.

To create a user that is not allowed to log in to the system, we can set their shell to the `nologin` shell.

Take a look at the `/etc/shells` file and find the shell you should set.

```bash
$ cat /etc/shells
```

Next, create a user (`nologin-user`)which is not allowed to login to the system by setting their default shell to the correct shell.