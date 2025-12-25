#!/usr/bin/bash

# ╔══════════════════════════════════════════════════════════════╗
# ║                                                              ║
# ║    🚀 NUSHELL SETUP SCRIPT 🚀                                ║
# ║                                                              ║
# ║    Custom Nushell configuration with Catppuccin Mocha        ║
# ║                                                              ║
# ╚══════════════════════════════════════════════════════════════╝

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Banner
echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC} ${BOLD}                                     ${NC}${CYAN}║${NC}"
echo -e "${CYAN}║${NC} ${BOLD}${GREEN}  🚀 NUSHELL SETUP SCRIPT 🚀 ${NC}${CYAN}║${NC}"
echo -e "${CYAN}║${NC} ${BOLD}                                     ${NC}${CYAN}║${NC}"
echo -e "${CYAN}║${NC} ${BOLD}${PURPLE}    Custom Nushell          ${NC}${CYAN}║${NC}"
echo -e "${CYAN}║${NC} ${BOLD}                                     ${NC}${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
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
echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}${CYAN}🎊 Installation Summary 🎊${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}✓${NC} Nushell installed successfully"
echo -e "${BLUE}✓${NC} Catppuccin Mocha theme configured"
echo -e "${BLUE}✓${NC} Custom aliases and functions set up"
echo -e "${BLUE}✓${NC} Configuration files placed in ~/.config/nushell/"
echo ""

print_status "To start using Nushell:"
echo -e "   ${YELLOW}1. Run: ${CYAN}nu${NC}"
echo -e "   ${YELLOW}2. To make it default: ${CYAN}chsh -s $(which nu)${NC}"
echo ""

echo -e "${PURPLE}🔥 Enjoy your beautiful Nushell experience! 🔥${NC}"
echo ""
