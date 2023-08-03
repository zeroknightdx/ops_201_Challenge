#!/bin/bash

# Script Name:                  backup
# Author:                       Michael Plaskett    
# Date of latest revision:     08/02/2023
# Purpose:                     Creating Back up file in E: Drive
# Resource Used:

#!/bin/bash

# Function to back up the file
backup_file() {
    source_file="$1"
    destination_folder="$2"

    if [ -f "$source_file" ]; then
        cp "$source_file" "$destination_folder"
        echo "File '$source_file' backed up successfully to '$destination_folder'"
    else
        echo "Error: Source file '$source_file' not found."
    fi
}

# Specify the source files and destination folder
source_file1="C:/Users/Jorge/Desktop/My Project Files/projectfiles-Copy (2).txt"
source_file2="C:/Users/Jorge/Desktop/My Project Files/projectfiles-Copy.txt"
source_file3="C:/Users/Jorge/Desktop/My Project Files/projectfiles-Copy (3).txt"
source_file4="C:/Users/Jorge/Desktop/My Project Files/projectfiles.txt"
destination_folder="E:/Backup/"

# Perform the backup for each source file
backup_file "$source_file1" "$destination_folder"
backup_file "$source_file2" "$destination_folder"
backup_file "$source_file3" "$destination_folder"
backup_file "$source_file4" "$destination_folder"
