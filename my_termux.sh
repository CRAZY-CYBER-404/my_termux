#!/bin/bash

# Clear the terminal
clear

# Create .termux directory if it doesn't exist
mkdir -p ~/.termux

# Font and color customization input
echo -e "\n\033[1;32mSet your custom Termux theme\033[0m"
echo -e "Example color codes: \033[1;34m#000000 for black, #00ff00 for green, #ffffff for white\033[0m"
read -p "Enter background color (hex format): " bg_color
read -p "Enter foreground color (hex format): " fg_color
read -p "Enter cursor color (hex format): " cursor_color
read -p "Enter font size (e.g., 12, 14, 18): " font_size

# Create colors.properties file and write colors
echo "background=$bg_color" > ~/.termux/colors.properties
echo "foreground=$fg_color" >> ~/.termux/colors.properties
echo "cursor=$cursor_color" >> ~/.termux/colors.properties

# Write font size to termux.properties
echo "font-size=$font_size" > ~/.termux/termux.properties

# Reload settings
termux-reload-settings

# Hacker logo and text
hacker_logo="
┌──────────────────────────────┐
│ \033[1;32mAndroid Termux\033[0m              │
│ \033[1;33m     ⣴⣶⣦⡀                    \033[0m │
│ \033[1;33m    ⣿⣿⣿⣿⡀                   \033[0m │
│ \033[1;33m    ⣿⣿⣿⣿⡇                   \033[0m │
│ \033[1;33m     ⠛⠿⠿⠋                    \033[0m │
└──────────────────────────────┘
"

# Collect device information
phone_model=$(getprop ro.product.model)
android_version=$(getprop ro.build.version.release)
kernel_version=$(uname -r)
ram_info=$(free -m | awk 'NR==2{printf "%sMB / %sMB", $3, $2}')
disk_info=$(df -h | awk '$NF=="/"{printf "%s / %s", $3, $2}')
uptime_info=$(uptime -p)
pkg_count=$(pkg list-installed | wc -l)
shell_info=$SHELL

# Print text (bold color)
echo -e "$hacker_logo"
echo -e "\033[1;36mPhone Model: \033[1;1;34m$phone_model\033[0m"
echo -e "\033[1;36mOS Version: \033[1;1;34m$android_version\033[0m"
echo -e "\033[1;36mKernel Version: \033[1;1;34m$kernel_version\033[0m"
echo -e "\033[1;36mPackages Installed: \033[1;1;34m$pkg_count\033[0m"
echo -e "\033[1;36mShell: \033[1;1;34m$shell_info\033[0m"
echo -e "\033[1;36mUptime: \033[1;1;34m$uptime_info\033[0m"
echo -e "\033[1;36mRAM: \033[1;1;34m$ram_info\033[0m"
echo -e "\033[1;36mDisk: \033[1;1;34m$disk_info\033[0m"

# Print a long dash (bold color)
echo -e "\033[1;1;33m─────────────────────────────────────────\033[0m"

# Available themes
echo -e "\n\033[1;32mAvailable Themes:\033[0m"
echo -e "1. ayu-dark - Background: #0F1419, Foreground: #B3B1AD"
echo -e "2. dracula - Background: #282a36, Foreground: #f8f8f2"
echo -e "3. catppuccin - Background: #1E1E28, Foreground: #D7DAE0"
echo -e "4. monokai-dark - Background: #272822, Foreground: #F8F8F2"

# Input for theme selection
read -p "Choose a theme (1-4): " theme_choice

# Update colors based on selected theme
case $theme_choice in
    1)
        bg_color="#0F1419"
        fg_color="#B3B1AD"
        ;;
    2)
        bg_color="#282a36"
        fg_color="#f8f8f2"
        ;;
    3)
        bg_color="#1E1E28"
        fg_color="#D7DAE0"
        ;;
    4)
        bg_color="#272822"
        fg_color="#F8F8F2"
        ;;
    *)
        echo "Invalid choice! No theme applied."
        ;;
esac

# If valid theme is selected, update colors.properties
if [[ $theme_choice -ge 1 && $theme_choice -le 4 ]]; then
    echo "background=$bg_color" > ~/.termux/colors.properties
    echo "foreground=$fg_color" >> ~/.termux/colors.properties
    termux-reload-settings
    echo -e "\033[1;32mTheme applied successfully!\033[0m"
fi
