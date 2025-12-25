#!/usr/bin/bash

# ╔══════════════════════════════════════════════════════════════╗
# ║                                                              ║
# ║    🌸 NUSHELL SETUP SCRIPT 🌸                                ║
# ║                                                              ║
# ║    Custom Nushell configuration with Catppuccin Mocha        ║
# ║                                                              ║
# ╚══════════════════════════════════════════════════════════════╝

# Colors for output - Catppuccin Mocha Palette
ROSEWATER='\033[38;5;226m'
FLAMINGO='\033[38;5;203m'
PINK='\033[38;5;212m'
MAUVE='\033[38;5;183m'
RED='\033[38;5;203m'
MAROON='\033[38;5;167m'
PEACH='\033[38;5;215m'
YELLOW='\033[38;5;221m'
GREEN='\033[38;5;180m'
TEAL='\033[38;5;158m'
SKY='\033[38;5;116m'
SAPPHIRE='\033[38;5;109m'
BLUE='\033[38;5;111m'
LAVENDER='\033[38;5;147m'
TEXT='\033[38;5;245m'
SUBTEXT1='\033[38;5;241m'
SUBTEXT0='\033[38;5;237m'
OVERLAY2='\033[38;5;233m'
OVERLAY1='\033[38;5;229m'
OVERLAY0='\033[38;5;225m'
SURFACE2='\033[38;5;221m'
SURFACE1='\033[38;5;217m'
SURFACE0='\033[38;5;213m'
BASE='\033[48;5;236m'
MANTLE='\033[48;5;235m'
CRUST='\033[48;5;234m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}│ ${BOLD}ℹ${NC} ${BLUE}${NC} $1"
}

print_success() {
    echo -e "${GREEN}│ ${BOLD}✓${NC} ${GREEN}${NC} $1"
}

print_warning() {
    echo -e "${PEACH}│ ${BOLD}⚠${NC} ${PEACH}${NC} $1"
}

print_error() {
    echo -e "${RED}│ ${BOLD}✗${NC} ${RED}${NC} $1"
}

# Banner
echo ""
echo -e "${MANTLE}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}╭─────────────────────────────────────────────────────╮${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}│                                                     │${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}│  ${PINK}${BOLD}🌸 NUSHELL SETUP SCRIPT 🌸${MAVE}${BOLD}                       │${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}│                                                     │${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}│  ${LAVENDER}${BOLD}Custom Nushell Configuration${MAVE}${BOLD}                 │${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}│  ${SUBTEXT1}Catppuccin Mocha Theme${MAVE}${BOLD}                          │${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}│                                                     │${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}║${NC} ${MAUVE}${BOLD}╰─────────────────────────────────────────────────────╯${NC} ${MANTLE}║${NC}"
echo -e "${MANTLE}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   print_error "This script should not be run as root"
   exit 1
fi

print_status "Starting Nushell installation..."

print_status "Adding Gemfury Nushell repository..."
echo "[gemfury-nushell]
name=Gemfury Nushell Repo
baseurl=https://yum.fury.io/nushell/
enabled=1
gpgcheck=0
gpgkey=https://yum.fury.io/nushell/gpg.key" | sudo tee /etc/yum.repos.d/fury-nushell.repo > /dev/null

print_status "Updating package lists and installing Nushell..."
sudo dnf update -q
sudo dnf install -y nushell

print_status "Setting up Nushell configuration directory..."
mkdir -p ~/.config/nushell/
rm -rf ~/.config/nushell/* 2>/dev/null || true

print_status "Copying configuration files..."
cp -r ./* ~/.config/nushell/ 2>/dev/null || {
    print_error "Failed to copy configuration files"
    exit 1
}

# Make setup script executable
chmod +x ~/.config/nushell/setup.sh

print_success "Nushell installation completed! 🎉"
echo ""
echo -e "${MANTLE}┌─────────────────────────────────────────────────────────────┐${NC}"
echo -e "${MANTLE}│ ${GREEN}${BOLD}🎊 Installation Complete! 🎊${NC} ${MANTLE}                        │${NC}"
echo -e "${MANTLE}├─────────────────────────────────────────────────────────────┤${NC}"
echo -e "${MANTLE}│ ${GREEN}${BOLD}✓${NC} ${TEXT}Nushell installed successfully${NC}                 ${MANTLE}│${NC}"
echo -e "${MANTLE}│ ${GREEN}${BOLD}✓${NC} ${TEXT}Catppuccin Mocha theme configured${NC}              ${MANTLE}│${NC}"
echo -e "${MANTLE}│ ${GREEN}${BOLD}✓${NC} ${TEXT}Custom aliases and functions set up${NC}            ${MANTLE}│${NC}"
echo -e "${MANTLE}│ ${GREEN}${BOLD}✓${NC} ${TEXT}Configuration files in ~/.config/nushell/${NC}      ${MANTLE}│${NC}"
echo -e "${MANTLE}└─────────────────────────────────────────────────────────────┘${NC}"
echo ""

print_status "Next steps:"
echo -e "   ${SUBTEXT1}▸ Start Nushell: ${BLUE}${BOLD}nu${NC}"
echo -e "   ${SUBTEXT1}▸ Make default:  ${BLUE}${BOLD}chsh -s \$(which nu)${NC}"
echo ""

echo -e "${MAUVE}${BOLD}  🌸 Enjoy your beautiful Nushell experience! 🌸${NC}"
echo ""
