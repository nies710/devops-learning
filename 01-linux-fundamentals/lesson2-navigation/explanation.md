### 1. pwd (Print Working Directory)

**Purpose:** Shows the full path of the current directory. Useful for locating yourself in the file system.

**When to Use:**
- Before running commands that depend on your current location. 
- To copy the absolute path into scripts or other commands. 
- To quickly check your position in deep directory structures. 

**Example:**

```bash
pwd

# Output: /home/user/projects
```

### 2. ls (list directory contents)

**Purpose:** Lists files and directories in the current or a specified path. 

**When to use:** To check folder contents, file permissions, or find a needed file. 

**Examples:**

```bash
ls

# Output: file1.txt  file2.log  projects/  script.sh
```
- ls -l (detailed list)

**Example:**
```bash
ls -l

# Output: 
#-rwxr-xr-x 1 nies71090 nies71090  112 Sep 14 21:20 111.sh
#-rw-r--r-- 1 nies71090 nies71090    1 Sep 24 20:06 Makefile
#-rw-r--r-- 1 nies71090 nies71090   11 Sep 13 20:36 access.log
#-rw-r--r-- 1 nies71090 nies71090    0 Sep 23 20:15 app.bin
#-rwxr-xr-x 1 nies71090 nies71090  113 Sep 13 13:35 args.sh
```
- ls -a (hidden files included)

**Example:**
```bash
ls -a
# Output:.wget-hsts  .aws  .azure .bash_history             
```


### 3. cd (change directory)

**Purpose:** Switch between directories.

**When to Use:** To navigate to a project folder, logs, or configuration files.

**Examples:**

```bash
cd /etc
# Moves into the /etc directory
```
- `cd ..` ( Moves to the home directory)
- `cd ~` (Moves one level up (to a parent directory))
- `cd -` (Go back to the previous directory)
- 
### 4. tree 
**Purpose:** Displays the directory structure as a tree.

**When to Use:** To check project organization or prepare documentation. 

**Examples:**
```bash
tree

# outrut: 
├── projects
│   ├── linux-basics
│   │   └── day2
│   │       ├── day2_linux_navigation.md
│   │       ├── day2_linux_navigation.md.save
│   │       └── day2_linux_navigation.md.save.1
```
- `tree -L 2` (Limit the depth to 2 levels)

**Examples:**
```bash
tree -L 2
#output: 
.
├── linux-basics
│   └── day2
└── test-project

4 directories, 0 files

## 📌 Summary

Today I practiced the basic Linux navigation commands:

- **pwd** — to check the current working directory. 
- **ls** — to list files and explore directory contents (with options `-l`, `-a`). 
- **cd** — to move between directories efficiently (`..`, `~`, `-`). 
- **tree** — to visualize the project structure as a tree. 

These commands are essential for everyday Linux work and serve as the foundation for more advanced administration and DevOps tasks.
