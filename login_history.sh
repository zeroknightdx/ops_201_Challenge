#!/bin/bash

# Script Name:                  scripts within the script
# Author:                       Michael Plaskett    
# Date of latest revision:      07/26/2023
# Purpose:                     add functions to our bash script
# Resource Used: Challenge03.png

# Main
login_history() {
    if [ "$EUID" -ne 0 ]; then
        echo "You need root/administrator privileges to access login history."
        return 1
    fi

    # Log the login details
    log_login_history

    # Display login history using last command
    last

    echo "The World is Fun and New"
}
# End