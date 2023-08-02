




#!/bin/bash

echo "Name of the computer:"
sudo lshw -C system | grep -E 'product|vendor|physical id|bus info|width' | sed 's/^[ \t]*//'

echo -e "\nCPU Information:"
sudo lshw -C cpu | grep -E 'product|vendor|physical id|bus info|width' | sed 's/^[ \t]*//'

echo -e "\nRAM Information:"
sudo lshw -C memory | grep -E 'description|physical id|size' | sed 's/^[ \t]*//'

echo -e "\nDisplay Adapter Information:"
sudo lshw -C display | grep -E 'description|product|vendor|physical id|bus info|width|clock|capabilities|configuration|resources' | sed 's/^[ \t]*//'

echo -e "\nNetwork Adapter Information:"
sudo lshw -C network | grep -E 'description|product|vendor|physical id|bus info|logical name|version|serial|size|capacity|width|clock|capabilities|configuration|resources' | sed 's/^[ \t]*//'
