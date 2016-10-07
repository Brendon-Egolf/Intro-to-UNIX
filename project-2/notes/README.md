Project 2 Notes
===============

Hard Drive Storage
------------------

Used to be magnetic disk, is now SSD.

### NTFS

Primary concern is Transactions Per Minute

File-systems are now becoming relational databases themselves

- provides a hierarchical way to find all of your file-system
  - similar to a filing cabinet
  - maximum primary partitions tends to be four
  - you can get more with extended partitions, but you __should never use it__ because it
    is very fragile
  - multiple partitions are useful because you can keep your system data on one partition
    and your user data on another partition
  - you should partition your SAN too, because VMWare is Awesome

#### FHS: File System Hierarchy Structure

- __/__ the root directory
- __/boot__ files essential to boot up the linux system, specifically the kernel you can
  have multiple versions of a kernel so that you can recompile your kernel without all
  the extra hardware and get your boot time a lot faster you can also have separate
  hardware configurations
- __/dev__ all physical devices are treated as files and they are located in this
  directory
- __/etc__ all system configuration files
- __/home__ each user's home directory  where each user's files go
- __/mnt__ (also called __/mount__) another file to mount your file in linux
- __/root__ the home directory for the admin user
- __/var__ contains all log files, mailspool, and print queues (don't use linux for
  a print queue because it doesn't have the correct drivers)

#### File Attributes

- archive bit
- file permissions
  - execute
  - no-access
  - read
  - write
...

Pathing
-------

- absolute paths always start with a forward slash
- relative path names start with the next directory you want to go to from your current
  working directory



### examples
Current working directory is /etc/
- absolute starts at the root of the directory
  ```$ ls -al /etc/php
  ```
- relative starts at the current directory
  ```$ ls -al php
  ```

Command Structure
-----------------

``` What    How    Where
Command option argument
```

Use .. to relatively go back one directory

Use . to reference the current directory

### Commands

- cd to change directories
- mkdir to add directories
- rm -rf to remove directories
  - use rm -rf / to be the coolest kid on the block :)
- touch to create a file
- rm to remove a file
- ls lists the files and folders in a directory
- chmod changes the mode of the file, don't use the letters apparently
- chown sets the new owner of a file
- chgrp changes the group of the file
- clear which you should alias to c clears the screen
- cp copy a file
- mv move a file
- grep takes a regular expression and only prints out the files that you want (look at
  man grep to get the cool stuff)
- find finds things use `find . -name 'name' -print`
- passwd will change your password

### Meta Characters

- `|` piping takes the output of one command and pipes it into another
- `>` redirects output to a file overwriting the file or create it
- `>>` redirects output to a file appending to the file or create it
- `*` represents any number of characters
- `?` represents one character














