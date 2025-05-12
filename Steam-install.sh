!#/bin/bash
# Enable contrib, non-free, and backport repos
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Update packages 
sudo apt update && sudo apt upgrade -y

# Enable Multi-Arch
sudo dpkg --add-architecture i386 

# Install drivers and installer
sudo apt install libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer
