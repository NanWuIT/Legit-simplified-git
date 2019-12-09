# Legit-simplified-git
The Legit is a simplified git repository program that can help you manage your code version. 

This program run as github with the branches to manage the file version. 

Basiclly, after the init command, there will be a directory to save all the different versions. For each version, they are actually be saved in a sub directory, and the commitment of the user will be saved in a file. 

# Commands introduction
**1. legit-init:** 

The **lefit-init** command creates an empty Legit repository. 

legit-init would creates a directory named .legit which it will use to store the repository.

It produces an error message if this directory already exists.

**2. legit-add filenames:** 
The **legit-add** command adds the contents of one or more files to the "index".

Files are added to the repository in a two step process. The first step is adding them to the index. 

**3. legit-commit [-a] -m message:** 
The **legit-commit** command saves a copy of all files in the index to the repository.

A message describing the commit is included as part of the commit command. It also has a -a option which causes all files already in the index to have their contents from the current directory added to the index before the commit.

**4. legit-log:** 
The **legit-log** command prints one line for every commit that has been made to the repository.

Each line contains the commit number and the commit message.

**5. legit-show commit:filename:** 
The **legit-show** should print the contents of the specified file as of the specified commit.

If the commit is omitted the contents of the file in the index should be printed.

**6. legit-rm [--force] [--cached] filenames:** 
**legit-rm** removes a file from the index, or from the current directory and the index.

If the **--cached** option is specified the file is removed only from the index and not from the current directory.

**legit-rm** like **git rm** stops the user accidentally losing work.

It would give an error message instead of removing the file in the current directory if it is different to the last commit.

It would also give an error message instead of removing the file from the index if it is different to the last commit.

The **--force** option overrides both these checks.

**7. legit-status:** 

**legit-status** shows the status of files in the current directory, index, and repository.

**Example 1**
```
$ ls -d .legit
ls: cannot access '.legit': No such file or directory
$ legit-init init
usage: legit-init
$ ls -d .legit
ls: cannot access '.legit': No such file or directory
$ legit-init
Initialized empty legit repository in .legit 
$ echo line 1 > a
$ echo hello world >b
$ ./legit-add a b
$ ./legit-commit -m 'first commit'
Committed as commit 0
$ echo  line 2 >>a
$ ./legit-add a
$ ./legit-commit -m 'second commit'
Committed as commit 1
$ ./legit-log
1 second commit
0 first commit
$ echo line 3 >>a
$ ./legit-add a
$ echo line 4 >>a
$ ./legit-show 0:a
line 1
$ ./legit-show 1:a
line 1
line 2
$ ./legit-show :a
line 1
line 2
line 3
$ cat a
line 1
line 2
line 3
line 4
$ ./legit-show 0:b
hello world
$ ./legit-show 1:b
hello world
```

**Example 2**
```
$ ./legit-init
Initialized empty legit repository in .legit
touch a b c d e f g h
$ ./legit-add a b c d e f
$ ./legit-commit -m 'first commit'
Committed as commit 0
$ echo hello >a
$ echo hello >b
$ echo hello >c
$ ./legit-add a b
$ echo world >a
$ rm d
$ ./legit-rm e
$ ./legit-add g
$ ./legit-status
a - file changed, different changes staged for commit
b - file changed, changes staged for commit
c - file changed, changes not staged for commit
d - file deleted
e - deleted
f - same as repo
g - added to index
h - untracked
legit-add - untracked
legit-commit - untracked
legit-init - untracked
legit-rm - untracked
legit-status - untracked
```
