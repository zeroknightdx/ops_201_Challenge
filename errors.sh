# Script Name:  PowerShell script to demonstrate various operations with the System event log                
# Author:                       Michael Plaskett    
# Date of latest revision:     08/05/2023
# Purpose:    Function to create a header for each operation         
# Resource Used: Challenge09.png




# Task 1: Output all events from the System event log that occurred in the last 24 hours to a file on your desktop named last_24.txt.
"Task 1: Output all events from the System event log in the last 24 hours to last_24.txt"
$desktopPath = [Environment]::GetFolderPath("Desktop")
Get-EventLog -LogName "System" -After (Get-Date).AddDays(-1) | Out-File -FilePath "$desktopPath\last_24.txt"

# Task 1: Output all events from the System event log that occurred in the last 24 hours to a file on your desktop named last_24.txt.
"Task 1: Output all events from the System event log in the last 24 hours to last_24.txt"
$desktopPath = [Environment]::GetFolderPath("Desktop")
Get-EventLog -LogName "System" -After (Get-Date).AddDays(-1) | Out-File -FilePath "$desktopPath\last_24.txt"

Task 3: Print to the screen all events with ID of 16 from the System event log.
"Task 3: Print to the screen all events with ID of 16 from the System event log"
Get-EventLog -LogName "System" -InstanceId 16

# Task 4: Print to the screen the most recent 20 entries from the System event log.
"Task 4: Print to the screen the most recent 20 entries from the System event log"
Get-EventLog -LogName "System" -Newest 20

# Task 5: Print to the screen all sources of the 500 most recent entries in the System event log. Ensure that the full lines are displayed.
"Task 5: Print to the screen all sources of the 500 most recent entries in the System event log"
Get-EventLog -LogName "System" -Newest 500 | Select-Object -ExpandProperty Source | Get-Unique