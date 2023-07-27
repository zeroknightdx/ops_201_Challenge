#!/bin/bash

# Script Name:                  My First Bash Script
# Author:                       Michael Plaskett    
# Date of latest revision:      07/27/2023
# Purpose:                     
# Resource Used: 
# Main

# Names of the four directories in an array
directories=("dir1" "dir2" "dir3" "dir4")

# Loop through the array to create a new .txt file in each directory
for dir in "${directories[@]}"; do
    # Create the directory if it doesn't exist
    mkdir -p "$dir"
    
    # Create a new .txt file in the directory
    touch "$dir/file.txt"
done

# Display a message after creating the files
echo "New .txt files created in the directories."
# End
