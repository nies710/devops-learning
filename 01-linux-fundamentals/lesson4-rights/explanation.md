# Lesson 04 - Linux Permissions

In this lesson, I learned how to control **who can read, write, or execute files**. This is critical for security and teamwork on Linux systems.

## 1. chmod - Change Permissions**

**What is chmod and why do we need it?**

The `chmod` command (short for **change mode**) is used to **control file and directory permissions** in Linux. Every file or directory on a Linux system has rules that define _who can read, modify, or execute it_. These rules are critical for security and collaboration:

- On a personal computer, you may want to prevent accidental deletion of important files.
- On a server, you must ensure that only the right users or applications can access sensitive data.
- In a team project, permissions help separate roles - for example, developers may edit code, but only administrators can deploy it.

By default, Linux assigns basic permissions when files are created, but often you will need to **adjust them manually**. This is where chmod comes in.

When you apply chmod, you are telling the system:

- _Who_ (owner, group, others) is affected.
- _What kind of access_ (read, write, execute) is allowed or denied.

**For example:**

- Making a script executable (chmod u+x script.sh) lets the owner run it as a program.
- Restricting access to private files (chmod 600 secret.txt) ensures only you can read/write them.
- Standardizing permissions across a project (chmod -R 755 folder/) avoids unexpected "Permission denied" errors.

**In short:** 
`chmod` is the main tool to control access to files and directories in Linux. Without it, you cannot properly secure your system or manage multi-user environments.

**\- User Groups and Permission Types**

Every file has **3 groups of users**:

- **u** → user (owner)
- **g** → group
- **o** → others

And **3 permission types**:

- **r** → read
- **w** → write
- **x** → execute

**Example:**

```bash
ls -l script.sh

-rwxr-xr--
```

Breakdown:

- Owner (u): **rwx** → can read, write, execute
- Group (g): **r-x** → can read, execute
- Others (o): **r--** → can only read
- **Purpose**: allow or deny read, write, execute access.

**Examples:**

```bash
ls -l script.sh

-rw-r--r-- 1 denis users 1024 Oct 4 12:00 script.sh
 ```

```.bash
chmod u+x script.sh # owner can now run it

chmod go-r script.sh # remove read for group + others

chmod 755 script.sh # common setting: rwx for owner, r-x for others

chmod -R 755 /var/www/html # Recursive permission change
```

**Symbolic mode**

chmod u+x file.sh # add execute for owner

chmod go-w notes.txt # remove write for group + others

chmod a=r file.txt # set read-only for everyone

- **u** = user
- **g** = group
- **o** = others
- **a** = all
- **+** = add, **\-** = remove, **\=** = set exactly

**Numeric (octal) mode**

- **r = 4, w = 2, x = 1**

Add them up:
- rwx = 7
- rw- = 6
- r-x = 5
 
 **Examples:**

```bash
chmod 755 script.sh # owner: rwx, group/others: r-x

chmod 644 file.txt # owner: rw-, others: r--
```

## 2\. chown - Change Owner

**What is chown and why do we need it?**

The chown command (short for **change owner**) is used to **change the ownership of files and directories** in Linux. Every file has two ownership attributes:

- **User (owner)** - usually the person who created the file.
- **Group** - a collection of users who may share access.

Why does this matter?

- In a **multi-user system**, not everyone should have the same level of access. For example, logs may belong to root so regular users cannot delete them.
- In a **team project**, ownership can be given to a specific group (e.g., devs) so that all developers can work on shared code.
- On a **server**, services often run under dedicated accounts (e.g., nginx, mysql). Their configuration and data files must belong to the correct user and group.

When you apply chown, you can:

- Transfer a file from one user to another.
- Assign a directory to a group so multiple users can collaborate.
- Fix ownership after moving files between accounts or from backups.

**Examples:**

- sudo chown root file.txt → only root is the owner.
- sudo chown denis:devs project/ → user denis and group devs own the project.
- sudo chown -R denis:devs app/ → recursively apply ownership to everything inside app.

Shortly: 
**chown is essential for managing collaboration and enforcing security in Linux. It ensures that files and directories are controlled by the right users and groups.**

**Examples:**

```bashsudo chown root file.txt # make root the owner

sudo chown denis:devs project/ # set owner and group

sudo chown -R denis:devs app/ # recursive, all inside app/

sudo chown :devs project/     # set only the group
```



## 3\. umask - Default Permissions

**What is umask and why do we need it?**

The umask (short for **user file-creation mode mask**) controls the **default permissions** that are assigned to new files and directories in Linux.

By default, Linux starts with very open permissions:

- Files → 666 (read + write for everyone)
- Directories → 777 (read + write + execute for everyone)

But this would be unsafe. For example:

- You don't want every user on a server to read your personal documents.
- You don't want system files to be editable by anyone other than the owner.

This is where umask comes in. 
It **subtracts permissions** from the base values (666 or 777) to produce the final defaults.

**For example:**

- umask 022 → new files = 644 (rw-r--r--), new dirs = 755 (rwxr-xr-x). This is the most common setting: owner has full control, others can only read.
- umask 077 → new files = 600 (rw-------), new dirs = 700 (rwx------). This is for maximum privacy: only the owner can access.
- umask 002 → new files = 664 (rw-rw-r--), new dirs = 775 (rwxrwxr-x). This is often used in collaborative environments, so group members can edit shared files.

Why is this important?

- It prevents accidental creation of files with unsafe permissions.
- It ensures consistent defaults across projects and users.
- On servers, it is a security measure: services and scripts should not create "world-readable" files unless explicitly intended.

**Examples:**
```bsh
umask # show current value (e.g., 0022)

umask 077 # new files: 600, new dirs: 700
```
**How it works:**

- Base for files = 666 (rw-rw-rw-)
- Base for dirs = 777 (rwxrwxrwx)
- Subtract umask → final permissions.

**Example:**

| **umask** | **Files** | **Directories** |
| --- | --- | --- |
| 022 | 644 (rw-r--r--) | 755 (rwxr-xr-x) |
| 077 | 600 (rw-------) | 700 (rwx------) |
| 002 | 664 (rw-rw-r--) | 775 (rwxrwxr-x) |

## 4\. sudo - Run as Superuser**

The command **sudo** stands for **"superuser do"**. 
It allows a regular user to execute commands with the privileges of another user - by default, the **root (superuser)**.

**Why do we need it?**

- Some actions in Linux require **administrative rights**, for example:
  - Installing or removing software (apt install, yum install)
  - Editing system configuration files (/etc/hosts, /etc/ssh/sshd_config)
  - Starting or stopping services (systemctl restart nginx)
  - Changing ownership or permissions of system files (chown, chmod in protected directories)
- Instead of logging in as root all the time (which is dangerous), sudo gives you a **safe way** to run only the necessary commands with elevated privileges.

This improves **security** and **accountability**:

- Users stay logged in with their normal accounts (reduced risk of mistakes).
- Every command run with sudo is logged in /var/log/auth.log → so administrators can track what happened.
- Access can be fine-tuned: not all users get full root rights, some can run only specific commands.

**Example:**

```bash 
sudo apt update

sudo apt install nginx

sudo systemctl restart nginx
```

Without sudo, these commands would fail for a regular user.



**In short:**

`sudo` gives controlled, logged, and temporary root privileges to regular users, making system administration safer.

**Examples:**

```bash 
sudo apt update

sudo nano /etc/hosts

sudo chown root:root /etc/passwd
```

