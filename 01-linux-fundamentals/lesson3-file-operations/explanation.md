# Lesson 03 – File Operations in Linux

In this lesson, we explore the most important commands to create, edit, copy, move, and remove files.

---

## 1. touch
- **Purpose**: create empty files or update modification time (mtime).
- **Examples**:
```bash
touch test.txt                      # Create a single file
touch file1.txt file2.txt           # Create two or more files at once
touch -c file.txt                   # update only if file exists
touch -t 202506301445.30 file.txt   # set exact time
  
```
**When to use:**

- Create empty files

- Update timestamps in build scripts


## 2. cat

- **Purpose**:  display or merge file contents.

- **Examples**:

```bash 
cat file.txt                     # display file contents 
cat file1 file2 > merged.txt     # combine file1 and file2 into one file called merged.txt
cat -n file.txt                  # show line numbers
cat new_log.txt >> old_log.txt   # add to the end
```
**When to use**:

- Quickly preview text files

- Merge multiple files

- Add content without overwriting

**example**:

```bash
nies71090@DESKTOP-3M3EO0V:~/linux-lessons$ cat file.txt
Hello world!
```
## 3. nano

- **Purpose**: simple terminal-based text editor.

- **Examples**:


```bash
nano notes.txt
```

- Save → Ctrl+O

- Exit → Ctrl+X

## 4. vim

- **Purpose**: powerful text editor available on almost any Linux system.

 **Modes**:

- i → insert text

- Esc → exit insert mode

- :w → save

- :q → quit

- :wq → save and quit

## 5. cp

- **Purpose**: copy files or directories.

- **Examples**
```bash
cp file.txt backup.txt
cp -r dir1 dir2           # recursive copy
cp -u file.txt backup/    # copy only if newer
cp -i file.txt backup/    # ask before overwrite
```
## 6. mv

- **Purpose**: move or rename files.

- **Examples**:
```bash
mv old.txt new.txt        # Rename old.txt to new.txt
mv file.txt /tmp/         # Move file.txt into the /tmp/ folder
mv file.txt ../           # move one level up
mv *.txt ~/Documents/     # move all .txt files
```

## 7. rm

- **Purpose**: remove files or directories.

- **Examples**:
```bash
rm file.txt          # delete 
rm -i file.txt       # interactive, asks confirmation
rm -r folder/        # recursive delete
rm -rf folder/       # force delete (dangerous!)
