!#/bin/bash
# Enable contrib and non-free repos
sudo apt-add-repository contrib
sudo apt-add-repository non-free

# Enable Multi-Arch
sudo dpkg --add-architecture i386 

# Update packages 
sudo apt update && sudo apt upgrade -y

# Install drivers and installer
sudo apt install libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer
