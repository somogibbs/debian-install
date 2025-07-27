#!/bin/bash
# Steam Installer for Debian Bookworm

set -e  # Exit on error

# Enable contrib, non-free, and backport repositories
echo "deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Update package list
sudo apt update

# Enable Multi-Arch for 32-bit compatibility
sudo dpkg --add-architecture i386
sudo apt update  # Refresh after enabling i386

# Install Steam and essential 32-bit libraries
sudo apt install \
  steam-installer \
  libgl1-mesa-dri:i386 \
  libglx-mesa0:i386 \
  mesa-vulkan-drivers:i386 \
  libgtk2.0-0:i386 \
  libpulse0:i386 \
  libdbus-glib-1-2:i386 \
  libopenal1:i386

