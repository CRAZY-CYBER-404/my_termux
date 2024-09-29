#!/bin/bash

# Clear the terminal
clear

# Custom Logo
echo -e "\e[1;36mWELCOME TO MY TERMUX\e[0m"
echo -e "\e[1;32m--------------------------\e[0m"
echo -e "\e[1;35m         HACKER STYLE       \e[0m"
echo -e "\e[1;32m--------------------------\e[0m"

# Display Phone Information
echo -e "\e[1;34mPhone Model: \e[0m$(getprop ro.product.model)"
echo -e "\e[1;34mAndroid Version: \e[0m$(getprop ro.build.version.release)"
echo -e "\e[1;34mKernel Version: \e[0m$(uname -r)"

# Display RAM and Memory
echo -e "\e[1;34mRAM: \e[0m$(free -m | awk 'NR==2{printf "%sMB / %sMB\n", $3, $2}')"
echo -e "\e[1;34mDisk: \e[0m$(df -h | awk '$NF=="/"{printf "%s / %s\n", $3, $2}')"

# Uptime
echo -e "\e[1;34mUptime: \e[0m$(uptime -p)"

# End
echo -e "\e[1;32m--------------------------\e[0m"
