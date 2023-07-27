#!/bin/bash

# Script Name:                  scripts within the script
# Author:                       Michael Plaskett    
# Date of latest revision:      07/26/2023
# Purpose:                     add functions to our bash script
# Resource Used: Challenge03.png
# Main
function login_history() {

if [ "$EUID" -ne 0 ]; then
echo "You need root/administrator privileges to access login history."
        return 1
    fi
 last
}
log_login_history() {
    local log_file="$HOME/login_history.log"
    local timestamp=$(date +"%Y-%m-%d %T")
    local user="$USER"
    local remote_addr="$SSH_CONNECTION"

    echo "User: $user - Logged in at: $timestamp - From: $remote_addr" >> "$log_file"
}

# End