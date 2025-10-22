# Task 1: Create myscript.sh and make it executable only for the owner
echo "Task 1: Creating myscript.sh and setting u+x permissions"
touch myscript.sh
chmod u+x myscript.sh
ls -l myscript.sh

# Task 2: Check the owner and group of myscript.sh
echo -e "\nTask 2: Checking owner and group of myscript.sh"
ls -l myscript.sh

# Task 3: Create note.txt and assign it to user nies71090 and group devs
echo -e "\nTask 3: Assigning note.txt to user nies71090 and group devs"
touch note.txt
sudo chown $USER:devs note.txt
ls -l note.txt

# Task 4: Set numeric permissions for file and directory
echo -e "\nTask 4: Setting numeric permissions for file and directory"
touch file1.txt
mkdir dir1

chmod 644 file1.txt
chmod 755 dir1

ls -l file1.txt dir1

# Task 5: Create shared directory with 1777 permissions (Sticky Bit)
echo -e "\nTask 5: Creating shared directory with 1777 permissions (Sticky Bit)"
mkdir shared
chmod 1777 shared
ls -ld shared

# Task 6: Create team_folder with SGID and 2775 permissions
echo -e "\nTask 6: Creating team_folder with SGID and 2775 permissions"
mkdir team_folder
sudo chown :devs team_folder
chmod 2775 team_folder
ls -ld team_folder

# Task 7: Set umask to 077
echo -e "\nTask 7: Setting umask to 077"
umask 077
echo "Current umask:"
umask


