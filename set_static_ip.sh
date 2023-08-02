!/bin/bash

# Script Name:                  set static ip Script
# Author:                       Michael Plaskett    
# Date of latest revision:      08/01/2023
# Purpose:                      to keep ip addr
# Resource Used: 


# Main

# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or using sudo."
  exit 1
fi

# Set the network configuration file path
NETPLAN_CONFIG_FILE="/etc/netplan/01-netcfg.yaml"

# Prompt the user to enter the desired static IP address, netmask, gateway, and DNS servers
read -p "Enter the static IP address (e.g., 192.168.1.100): " STATIC_IP
read -p "Enter the netmask (e.g., 24): " NETMASK
read -p "Enter the gateway address: " GATEWAY
read -p "Enter the primary DNS server address: " DNS_PRIMARY
read -p "Enter the secondary DNS server address: " DNS_SECONDARY

# Validate the entered IP address and DNS servers
if ! [[ "$STATIC_IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid IP address format. Please enter a valid IP address."
  exit 1
fi

if ! [[ "$GATEWAY" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid gateway address format. Please enter a valid IP address."
  exit 1
fi

if ! [[ "$DNS_PRIMARY" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid primary DNS server address format. Please enter a valid IP address."
  exit 1
fi

if ! [[ "$DNS_SECONDARY" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid secondary DNS server address format. Please enter a valid IP address."
  exit 1
fi

# Update the network configuration file with the provided settings
cat <<EOL | sudo tee "$NETPLAN_CONFIG_FILE" > /dev/null
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses: [$STATIC_IP/$NETMASK]
      gateway4: $GATEWAY
      nameservers:
        addresses: [$DNS_PRIMARY, $DNS_SECONDARY]
EOL

# Apply the changes
sudo netplan apply

echo "Static IP address has been set to $STATIC_IP."

# End