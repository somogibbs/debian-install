#!/bin/bash
set -e  # Exit on error

# Log output to install.log
exec > >(tee -i install.log)
exec 2>&1

echo "🔧 Updating package list..."
sudo apt update

echo "🖥️ Installing GNOME components..."
sudo apt -y install \
  gnome-core gnome-tweaks libproxy1-plugin-networkmanager network-manager-gnome \
  file-roller gnome-software-plugin-flatpak gnome-extra-icons \
  gnome-shell-extension-manager gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-blur-my-shell gnome-shell-extension-dashtodock \
  gnome-shell-extension-runcat gnome-shell-extension-workspace-indicator \
  gnome-shell-extension-gamemode

echo "📦 Installing APT applications..."
sudo apt -y install \
  libavcodec-extra ffmpeg mpv qbittorrent timeshift fastfetch openssh-server \
  synaptic curl wget lshw cpu-x btop lm-sensors preload gamemode \
  xfce4-terminal libreoffice-writer firefox-esr yuzu easytag variety \
  numix-icon-theme papirus-icon-theme obsidian-icon-theme fonts-recommended \
  fonts-firacode fonts-jetbrains-mono  

echo "📦 Installing Flatpak and adding Flathub..."
sudo apt -y install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "📦 Installing Flatpak applications..."
flatpak install --noninteractive flathub \
  tv.plex.PlexDesktop \
  org.feichtmeier.Musicpod \
  com.usebottles.bottles \
  it.mijorus.gearlever

echo "📡 Installing Speedtest CLI..."
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt -y install speedtest

echo "🔐 Installing Bitwarden..."
wget "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O bitwarden.deb
sudo apt install ./bitwarden.deb

echo "📝 Installing Joplin..."
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

echo "🌐 Downloading Ungoogled Chromium AppImage..."
wget https://github.com/ungoogled-software/ungoogled-chromium-portablelinux/releases/download/139.0.7258.127-1/ungoogled-chromium-139.0.7258.127-1-x86_64.AppImage

echo "🛡️ Installing Proton VPN..."
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install proton-vpn-gnome-desktop

echo "🎮 Installing Steam Installer..."
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer

echo "🛡️ Setting up UFW firewall..."
sudo apt -y install ufw
sudo ufw allow ssh
sudo ufw enable

echo "🎮 Installing Fallout GRUB theme..."
wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash  

echo "📁 Creating folders..."
mkdir ~/.fonts ~/.icons ~/.wallpapers ~/.themes ~/AppImages

echo "📦 Removing unwanted packages..."
sudo apt remove gnome-contacts gnome-calendar gnome-connections gnome-maps totem &&
sudo apt autoremove -y

echo "📶 Configuring NetworkManager..."
sudo apt purge ifupdown -y
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

echo "🔁 Rebooting system..."
sudo shutdown -r now
