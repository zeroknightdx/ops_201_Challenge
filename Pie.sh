#!/bin/bash

# Script Name:                  scripts within the script
# Author:                       Michael Plaskett    
# Date of latest revision:      07/26/2023
# Purpose:                     add functions to our bash script
# Resource Used: 
pie=“This is the login history”
# Main
echo $pie
function login_history() {

if [ "$EUID" -ne 0 ]; then
echo "You need root/administrator privileges to access login history."
        return 1
    fi
 last
}
echo“This is the login history”
# End