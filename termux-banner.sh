#!/data/data/com.termux/files/usr/bin/bash

# Ensure required packages are installed
command -v figlet >/dev/null 2>&1 || pkg install figlet -y
command -v lolcat >/dev/null 2>&1 || { pkg install ruby -y && gem install lolcat; }
command -v termux-battery-status >/dev/null 2>&1 || pkg install termux-api -y

clear

# Banner
figlet "The Ghost Jinn" | lolcat

# --- System Information ---
echo -e "\033[1;33m--- System Information ---\033[0m" | lolcat

# Battery Percentage
BATTERY=$(termux-battery-status | grep -o '"percentage": *[0-9]*' | grep -o '[0-9]*')
[ -z "$BATTERY" ] && BATTERY="N/A"
echo -e "\033[1;36mBattery:\033[0m $BATTERY%" | lolcat

# Storage Info
STORAGE=$(df -h /data | awk 'NR==2{print $4 " free / " $2 " total"}')
[ -z "$STORAGE" ] && STORAGE="N/A"
echo -e "\033[1;36mStorage:\033[0m $STORAGE" | lolcat

# RAM Info
MEM=$(free -h | awk '/Mem:/ {print $3 " used / " $2 " total"}')
[ -z "$MEM" ] && MEM="N/A"
echo -e "\033[1;36mRAM:\033[0m $MEM" | lolcat

# CPU Info
CPU=$(cat /proc/cpuinfo | grep 'Hardware' | awk -F ': ' '{print $2}' | head -n1)
[ -z "$CPU" ] && CPU=$(uname -m)
echo -e "\033[1;36mCPU:\033[0m $CPU" | lolcat

# Local IP (Wi-Fi or default)
LOCAL_IP=$(ip addr show wlan0 2>/dev/null | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
[ -z "$LOCAL_IP" ] && LOCAL_IP=$(ip addr show 2>/dev/null | grep 'inet ' | awk 'NR==1{print $2}' | cut -d/ -f1)
[ -z "$LOCAL_IP" ] && LOCAL_IP="N/A"
echo -e "\033[1;36mLocal IP:\033[0m $LOCAL_IP" | lolcat

# Public IP
PUBLIC_IP=$(curl -s ifconfig.me)
[ -z "$PUBLIC_IP" ] && PUBLIC_IP="N/A"
echo -e "\033[1;36mPublic IP:\033[0m $PUBLIC_IP" | lolcat

echo -e "\033[1;33m--------------------------\033[0m" | lolcat
echo

# Fun quote
echo -e "\033[1;35m“Hack the planet, but do it ethically!”\033[0m" | lolcat
echo

# Set kali@kali prompt: all in red, path in blue, colon and space in white, $ in bold white
export PS1='\[\e[1;31m\]kali@ghostjinn\[\e[0m\]\[\e[1;37m\]:\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\] \[\e[1;37m\]\$\[\e[0m\] '

