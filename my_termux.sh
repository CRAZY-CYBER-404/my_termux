#!/bin/bash

# .termux ডিরেক্টরি তৈরি করা যদি আগে না থাকে
mkdir -p ~/.termux

# ফন্ট এবং রঙ কাস্টমাইজ করার জন্য ইনপুট নেওয়া
echo -e "\n\033[1;32mSet your custom Termux theme\033[0m"
echo -e "Example color codes: \033[1;34m#000000 for black, #00ff00 for green, #ffffff for white\033[0m"
read -p "Enter background color (hex format): " bg_color
read -p "Enter foreground color (hex format): " fg_color
read -p "Enter cursor color (hex format): " cursor_color
read -p "Enter font size (e.g., 12, 14, 18): " font_size

# colors.properties ফাইল তৈরি করে রঙ লিখে দেওয়া
echo "background=$bg_color" > ~/.termux/colors.properties
echo "foreground=$fg_color" >> ~/.termux/colors.properties
echo "cursor=$cursor_color" >> ~/.termux/colors.properties

# termux.properties ফাইলে ফন্ট সাইজ লিখে দেওয়া
echo "font-size=$font_size" > ~/.termux/termux.properties

# Settings রিলোড করা
termux-reload-settings

# লগো ফাইল তৈরি করা
cat << "EOF" > ~/.termux/logo.txt
┌──────────────────────────────┐
│         WELCOME             │
│        AYAN ALVE RINKU      │
└──────────────────────────────┘
EOF

# bashrc ফাইলে লগো ফাইলটি যোগ করা
if ! grep -q "cat ~/.termux/logo.txt" ~/.bashrc; then
    echo "clear; cat ~/.termux/logo.txt; echo" >> ~/.bashrc
fi

# স্ক্রিপ্ট শেষ হওয়া
echo -e "\033[1;32mSetup completed! Restart your Termux to see the changes.\033[0m"
