#!/data/data/com.termux/files/usr/bin/bash

# Termux Banner Script by Perplexity AI

# Install required packages if not already installed
command -v figlet >/dev/null 2>&1 || pkg install figlet -y
command -v lolcat >/dev/null 2>&1 || { pkg install ruby -y && gem install lolcat; }

clear

# Define colors for manual coloring (if lolcat not available)
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# Banner content
BANNER_TEXT="Termux Power"
SUB_TEXT="Welcome, $(whoami)!"

# Print banner
if command -v lolcat >/dev/null 2>&1; then
    figlet "$BANNER_TEXT" | lolcat
    echo -e "${YELLOW}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}" | lolcat
    echo -e "${GREEN}┃  ${SUB_TEXT}  ┃${NC}" | lolcat
    echo -e "${YELLOW}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}" | lolcat
else
    echo -e "${RED}"
    figlet "$BANNER_TEXT"
    echo -e "${NC}${YELLOW}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
    echo -e "${GREEN}┃  ${SUB_TEXT}  ┃${NC}"
    echo -e "${YELLOW}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
fi

# Optional: Add some system info
echo
echo -e "${BLUE}Date: $(date)${NC}"
echo -e "${BLUE}Device: $(uname -o) | Kernel: $(uname -r)${NC}"
echo -e "${BLUE}Uptime: $(uptime -p)${NC}"
echo

# Fun quote
echo -e "${YELLOW}“Hack the planet, but do it ethically!”${NC}"
