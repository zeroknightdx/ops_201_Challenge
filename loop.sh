#!/bin/bash

# Script Name:                  My First loop Script
# Author:                       Michael Plaskett    
# Date of latest revision:      07/29/2023
# Purpose:                     to learn how to loop scrip wiht the help gpt
# Resource Used: Challenge05.png


# Main

#!/bin/bash

# Function to display running processes
function display_processes {
    echo "----- Running Processes -----"
    ps -e
    echo "-----------------------------"
}

# Function to kill a process by PID
function kill_process {
    local pid=$1
    echo "Killing process with PID $pid..."
    kill "$pid"
}

# Main script starts here
while true; do
    # Display running processes
    display_processes

    # Ask the user for a PID
    read -p "Enter the PID of the process you want to kill (or 'q' to quit): " input

    # Check if the user wants to quit
    if [ "$input" == "q" ]; then
        echo "Exiting the script."
        break
    fi

    # Check if the input is a valid PID
    if [[ $input =~ ^[0-9]+$ ]]; then
        pid=$input

        # Check if the process exists
        if ps -p "$pid" > /dev/null; then
            kill_process "$pid"
        else
            echo "Process with PID $pid does not exist."
        fi
    else
        echo "Invalid input. Please enter a valid PID or 'q' to quit."
    fi

    echo "" # Add an empty line for readability
done

# End