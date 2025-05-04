#!/data/data/com.termux/files/usr/bin/bash

# Install dependencies if missing
command -v figlet >/dev/null 2>&1 || pkg install figlet -y
command -v lolcat >/dev/null 2>&1 || { pkg install ruby -y && gem install lolcat; }
command -v termux-battery-status >/dev/null 2>&1 || pkg install termux-api -y

clear

# Banner
figlet "Termux Power" | lolcat

# System Info
echo -e "\e[1;33m--- System Information ---\e[0m" | lolcat

# Battery
BATTERY=$(termux-battery-status | jq -r '.percentage')
echo -e "\e[1;36mBattery:\e[0m $BATTERY%" | lolcat

# Storage
STORAGE=$(df -h /data | awk 'NR==2{print $4 " free / " $2 " total"}')
echo -e "\e[1;36mStorage:\e[0m $STORAGE" | lolcat

# RAM
MEM=$(free -h | awk '/Mem:/ {print $3 " used / " $2 " total"}')
echo -e "\e[1;36mRAM:\e[0m $MEM" | lolcat

# CPU
CPU=$(cat /proc/cpuinfo | grep 'Hardware' | awk -F ': ' '{print $2}' | head -n1)
[ -z "$CPU" ] && CPU=$(uname -m)
echo -e "\e[1;36mCPU:\e[0m $CPU" | lolcat

# Local IP
LOCAL_IP=$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
[ -z "$LOCAL_IP" ] && LOCAL_IP="N/A"
echo -e "\e[1;36mLocal IP:\e[0m $LOCAL_IP" | lolcat

# Public IP
PUBLIC_IP=$(curl -s ifconfig.me)
echo -e "\e[1;36mPublic IP:\e[0m $PUBLIC_IP" | lolcat

echo -e "\e[1;33m--------------------------\e[0m" | lolcat
echo

# Kali-like prompt (change 'kali' as you wish)
export PS1="\[\e[1;32m\]kali@kali\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\\$ "

# Fun quote
echo -e "\e[1;35m“Hack the planet, but do it ethically!”\e[0m" | lolcat
