#!/bin/bash

# Clear the terminal
clear

# .termux ডিরেক্টরি তৈরি করো যদি আগে না থাকে
mkdir -p ~/.termux

# রঙের কাস্টমাইজেশন ইনপুট নেওয়া
echo -e "\n\033[1;32mSet your custom Termux theme\033[0m"
read -p "Enter background color (hex format, e.g., #000000 for black): " bg_color
read -p "Enter foreground color (hex format, e.g., #00ff00 for green): " fg_color
read -p "Enter cursor color (hex format, e.g., #00ff00 for green): " cursor_color
read -p "Enter font size (e.g., 12, 14, 18): " font_size

# colors.properties ফাইল তৈরি করে রঙ লিখে দেওয়া
echo "background=$bg_color" > ~/.termux/colors.properties
echo "foreground=$fg_color" >> ~/.termux/colors.properties
echo "cursor=$cursor_color" >> ~/.termux/colors.properties

# termux.properties ফাইলে ফন্ট সাইজ লিখে দেওয়া
echo "font-size=$font_size" > ~/.termux/termux.properties

# Settings রিলোড করা
termux-reload-settings

# হ্যাকার লোগো এবং টেক্সট তৈরি করা
hacker_logo="
┌──────────────────────────────┐
│ \033[1;32mAndroid Termux\033[0m              │
│ \033[1;33m     ⣴⣶⣦⡀                    \033[0m │
│ \033[1;33m    ⣿⣿⣿⣿⡀                   \033[0m │
│ \033[1;33m    ⣿⣿⣿⣿⡇                   \033[0m │
│ \033[1;33m     ⠛⠿⠿⠋                    \033[0m │
└──────────────────────────────┘
"

# ডিভাইসের তথ্য সংগ্রহ
phone_model=$(getprop ro.product.model)
android_version=$(getprop ro.build.version.release)
kernel_version=$(uname -r)
ram_info=$(free -m | awk 'NR==2{printf "%sMB / %sMB", $3, $2}')
disk_info=$(df -h | awk '$NF=="/"{printf "%s / %s", $3, $2}')
uptime_info=$(uptime -p)
pkg_count=$(pkg list-installed | wc -l)
shell_info=$SHELL

# তথ্য প্রিন্ট করা
echo -e "$hacker_logo"
echo -e "\033[1;36mPhone Model: \033[1;34m$phone_model\033[0m"
echo -e "\033[1;36mOS Version: \033[1;34m$android_version\033[0m"
echo -e "\033[1;36mKernel Version: \033[1;34m$kernel_version\033[0m"
echo -e "\033[1;36mPackages Installed: \033[1;34m$pkg_count\033[0m"
echo -e "\033[1;36mShell: \033[1;34m$shell_info\033[0m"
echo -e "\033[1;36mUptime: \033[1;34m$uptime_info\033[0m"
echo -e "\033[1;36mRAM: \033[1;34m$ram_info\033[0m"
echo -e "\033[1;36mDisk: \033[1;34m$disk_info\033[0m"

# নিচে লম্বা দাগ টানা
echo -e "\033[1;33m─────────────────────────────────────────\033[0m"
