#!/bin/bash

# Script Name:                  My First create Conditionals Script
# Author:                       Michael Plaskett    
# Date of latest revision:      07/31/2023
# Purpose:    Create a script that detects if a file or directory exists, then creates it if it does not exist 
# Resource Used: Challenge06.png
# Main
#!/bin/bash

# Create an array of files and directories that are available
file_or_folder=("dir1" "dir2" "dir3" "dir4" "textfile.txt" "black_worms.txt")

# Function to check if the file or folder exists in the array
is_file_available() {
    local search_file="$1"
    for item in "${file_or_folder[@]}"; do
        if [ "$item" == "$search_file" ]; then
            return 0 # true - file/folder exists
        fi
    done
    return 1 # false - file/folder was not found
}

while true; do 
    read -p "Enter a file or folder name to check if it is available, or type 'done' to finish: " file_to_check

    if [ "$file_to_check" = "done" ]; then
        break # Exit the loop
    fi

    if is_file_available "$file_to_check"; then
        echo "The file or folder '$file_to_check' already exists."
    else
        mkdir -p "$file_to_check" # Create the directory (p option creates parent directories if needed)
        echo "The file or folder '$file_to_check' was created."
    fi
done
# End