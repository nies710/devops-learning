#!/bin/bash
# Lesson 03 – File Operations in Linux
# Demo script: practicing file commands with real examples

# --- Part 1: touch ---
echo " Creating a single test file..."
touch test.txt
ls -l test.txt

echo
echo " Creating two files at once..."
touch file1.txt file2.txt
ls -l file1.txt file2.txt

echo
echo " Updating timestamp only if file exists (-c)"
touch -c file1.txt
ls -l file1.txt

echo
echo " Setting a custom timestamp for file.txt"
touch file.txt
touch -t 202506301445.30 file.txt
ls -l file.txt

echo "==== touch demo finished ===="

# --- Part 2: cat ---
echo
echo " Showing the content of a file"
echo "Hello world!" > hello.txt
cat hello.txt

echo
echo " Merging two files into one"
echo "First file content" > first.txt
echo "Second file content" > second.txt
cat first.txt second.txt > merged.txt
cat merged.txt

echo
echo " Displaying file with line numbers"
echo -e "line1\nline2\nline3" > numbered.txt
cat -n numbered.txt

echo
echo " Appending one file into another"
echo "Original text" > old_log.txt
echo "New entry" > new_log.txt
cat new_log.txt >> old_log.txt
cat old_log.txt

echo "==== cat demo finished ===="

# --- Part 3: cp ---
echo
echo " Preparing some files for copy practice..."
echo "Hello world" > file.txt
mkdir -p dir1
echo "Inside dir1/file1" > dir1/file1.txt
mkdir -p backup

echo
echo " Copying file.txt to backup.txt"
cp file.txt backup.txt
ls -l file.txt backup.txt

echo
echo " Copying a whole folder recursively"
cp -r dir1 dir2
ls -R dir2

echo
echo " Copying only if newer (-u)"
sleep 1
echo "Updated line" >> file.txt
cp -u file.txt backup/
ls -l backup/

echo
echo " Interactive copy (manual demo)"
echo "Try this yourself: cp -i file.txt backup.txt"
echo "It will ask: overwrite 'backup.txt'? (y/n)"

echo "==== cp demo finished ===="

# --- Part 4: mv ---
echo
echo " Setting up files for move/rename practice..."
echo "This is old.txt" > old.txt
echo "This is file.txt" > file.txt
mkdir -p demo_folder Documents

echo
echo " Renaming old.txt to new.txt"
mv old.txt new.txt
ls -l new.txt

echo
echo " Moving file.txt into demo_folder/"
mv file.txt demo_folder/
ls -l demo_folder/

echo
echo " Moving new.txt one level up (..)"
mv new.txt ../
ls -l ../ | grep new.txt

echo
echo " Creating sample files and moving all *.txt into Documents/"
touch one.txt two.txt three.txt
mv *.txt Documents/
ls -l Documents/

echo "==== mv demo finished ===="
